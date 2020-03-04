
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app123456/common/config/Config.dart';
import 'package:flutter_app123456/common/dao/NoticeDao.dart';
import 'package:flutter_app123456/common/dao/ResultDao.dart';
import 'package:flutter_app123456/common/model/MessagePush.dart';
import 'package:flutter_app123456/common/utils/CommonUtils.dart';
import 'package:flutter_app123456/widget/BaseMessagePushState.dart';
import 'package:flutter_app123456/common/style/CustomStyle.dart';
import 'package:flutter_app123456/widget/CustomPullLoadWidget.dart';
import 'package:flutter_app123456/widget/SimpleImageButton.dart';

class NoticePage extends StatefulWidget {
  _NoticePageState createState() => _NoticePageState();
}

class _NoticePageState extends BaseMessagePushState<NoticePage> {
  ///消息颜色
  Color messageColor = const Color(CustomColors.subLightTextColor);

  int skipCountGlobal = 10;
  int readState = null;
  int skipCountInit = 0;

  _refreshNotify() {
    if (isShow) {
      setState(() {
        messageColor = Colors.green;
      });
    }
  }

  ///tab切换防止页面重置
  @override
  bool get wantKeepAlive => true;

  ///初始化
  @override
  void initState() {
    pullLoadWidgetControl.needHeader = false;
    super.initState();
  }

  ///获取数据
  _getData(state, skipCount) async {
    final List<MessagePush> messagePushList = new List();

    var notifications =
        await NoticeDao.getPagedUserNotifications(state, skipCount);
    if (notifications != null && notifications.result) {
      var itemList = notifications.data["result"]["items"];
      var total = notifications.data["result"]["totalCount"];

      for (int i = 0; i < itemList.length; i++) {
        var msg = itemList[i]["notification"]["data"]["messageText"].toString();
        var messageSource =
            itemList[i]["notification"]["data"]["messageSource"].toString();
        var messageFlag =
            itemList[i]["notification"]["data"]["messageFlag"].toString();
        var senderUserName =
            itemList[i]["notification"]["data"]["senderUserName"].toString();
        var creationTime =
            itemList[i]["notification"]["creationTime"].toString();
        var isRead = itemList[i]["state"];
        var id = itemList[i]["id"];
        messagePushList.add(new MessagePush(total, id.toString(), isRead, msg,
            senderUserName, messageSource, messageFlag, creationTime));
      }
      return new DataResult(messagePushList, true, notifications.code, total:total);
    }
    if (notifications != null && !notifications.result) {
      return new DataResult("没有新的消息了", false, notifications.code);
    }
  }

  ///请求刷新
  @override
  requestRefresh() {
    // TODO: implement requestRefresh
    skipCountGlobal = 10;
    return _getData(readState, skipCountInit);
  }

  ///请求加载更多
  @override
  requestLoadMore() async {
    // TODO: implement requestLoadMore
    var dataLoadMore = await _getData(readState, skipCountGlobal);
    if (dataLoadMore.result) {
      skipCountGlobal = skipCountGlobal + Config.NOTICE_PAGE_SIZE;
      print("skipCountGlobal : " + skipCountGlobal.toString());
    }
    return dataLoadMore;
  }

  @override
  bool get isRefreshFirst => false;

  @override
  bool get needHeader => false;

  ///initState后调用，在didChangeDependencies中，可以跨组件拿到数据。
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    handleRefresh();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
        appBar: new AppBar(
          elevation: 0,
          brightness: Brightness.light,
          backgroundColor: Colors.white,
          title: Row(children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 15.0, top: 15.0, bottom: 9.0),
              child: SizedBox(height: 20.0, child: Image.asset("assets/images/statelogo.png"),),
            ),
          ],
          ),
        ),
        body: Column(
      children: <Widget>[
        Container(
          height: 2.0,
          color: Color(0xffEEEEEE),
        ),
        Padding(
          padding: EdgeInsets.only(top: 15.0, bottom: 21.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              SimpleImageButton(
                normalwidth: 28.0,
                normalheight: 15.0,
                pressedheight: 20.0,
                pressedwidth: 28.0,
                normalImage: CustomIcons.READ,
                pressedImage: CustomIcons.READ_PRESSED,
                onPressed: () {
                  readState = 1;
                  handleRefresh();
                },
              ),
              SimpleImageButton(
                normalwidth: 28.0,
                normalheight: 15.0,
                pressedheight: 20.0,
                pressedwidth: 28.0,
                normalImage: CustomIcons.UNREAD,
                pressedImage: CustomIcons.UNREAD_PRESSED,
                onPressed: () {
                  readState = 0;
                  handleRefresh();
                },
              ),
              SimpleImageButton(
                normalwidth: 89.0,
                normalheight: 15.0,
                pressedheight: 15.0,
                pressedwidth: 89.0,
                normalImage: CustomIcons.SET_ALL_READ,
                pressedImage: CustomIcons.SET_ALL_READ,
                onPressed: () async {
                  var makeAllReadRes =
                      await NoticeDao.makeAllUserNotificationsAsRead();
                  if (makeAllReadRes != null && makeAllReadRes.result) {
                    CommonUtils.showShort("已全部设为已读");
                    readState = null;
                    handleRefresh();
                  }
                  if (makeAllReadRes != null && !makeAllReadRes.result) {
                    CommonUtils.showShort("全部设为已读失败，请重试");
                    readState = null;
                    handleRefresh();
                  }
                },
              )
            ],
          ),
        ),
        Container(
          height: 6.0,
          color: Color(0xffEEEEEE),
        ),
        Expanded(
          child:
          CustomPullLoadWidget(
            pullLoadWidgetControl,
            (BuildContext context, int index) => renderItem(index, () {
              _refreshNotify();
            }),
            handleRefresh,
            onLoadMore,
            refreshKey: refreshIndicatorKey,
          ),
        ),
      ],
    ));
  }
}
