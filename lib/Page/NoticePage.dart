

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app123456/common/config/Config.dart';
import 'package:flutter_app123456/common/dao/NoticeDao.dart';
import 'package:flutter_app123456/common/dao/ResultDao.dart';
import 'package:flutter_app123456/common/model/MessagePush.dart';
import 'package:flutter_app123456/common/redux/CustomState.dart';
import 'package:flutter_app123456/common/utils/CommonUtils.dart';
import 'package:flutter_app123456/widget/BaseMessagePushState.dart';
import 'package:flutter_app123456/common/style/CustomStyle.dart';
import 'package:flutter_app123456/widget/CustomPullLoadWidget.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:animated_floatactionbuttons/animated_floatactionbuttons.dart';

class NoticePage extends StatefulWidget{
  _NoticePageState createState() => _NoticePageState();
}

class _NoticePageState extends BaseMessagePushState<NoticePage>{
  ///消息颜色
  Color messageColor = const Color(CustomColors.subLightTextColor);

  int skipCountGlobal = 10;
  int readState = null;
  int skipCountInit = 0;
  ///获取redux store
  Store<CustomState> _getStore(){
    if(context == null){
      return null;
    }
    return StoreProvider.of(context);
  }
  _refreshNotify(){
    if(isShow){
      setState((){
        messageColor = Colors.green;
      });
    }

  }

  ///tab切换防止页面重置
  @override
  bool get wantKeepAlive => true;

  ///初始化
  @override
  void initState(){
    pullLoadWidgetControl.needHeader = false;
    super.initState();
  }
  ///获取数据
  _getData(state, skipCount) async {
    final List<MessagePush> messagePushList = new List();

    var notifications = await NoticeDao.getPagedUserNotifications(state,skipCount);
    if(notifications != null && notifications.result){

        print("skipCount : " + skipCountGlobal.toString());
//      int totalCount = notifications.data["result"]["totalCount"];
//      int pageCount = totalCount ~/ Config.PAGE_SIZE + 1;
//      pageCount--;
//      if(pageCount == 0){
//
//      }
      print("notifications in noticePage: " + notifications.data.toString());
      var itemList = notifications.data["result"]["items"];
      print("notifications in noticePage itemList: " + itemList.toString() + itemList.length.toString());
      print("notifications in noticePage itemList length: " + itemList.length.toString());
      for(int i = 0; i < itemList.length; i++){
        print("notifications in noticePage item" + i.toString() + ":" + itemList[i]["notification"]["data"]["messageText"].toString());
        var msg = itemList[i]["notification"]["data"]["messageText"].toString();
        var messageSource = itemList[i]["notification"]["data"]["messageSource"].toString();
        var messageFlag = itemList[i]["notification"]["data"]["messageFlag"].toString();
        var senderUserName = itemList[i]["notification"]["data"]["senderUserName"].toString();
        var creationTime = itemList[i]["notification"]["creationTime"].toString();
        print("NoticePage msg: " + msg + messageSource + messageFlag + senderUserName + creationTime);
        var isRead = itemList[i]["state"];
        print("NoticePage isRead: " + isRead.toString());
        var id = itemList[i]["id"];
        print("NoticePage id: " + id.toString());
        messagePushList.add(new MessagePush(id.toString(), isRead, msg, senderUserName, messageSource, messageFlag, creationTime));
      }
      return new DataResult(messagePushList, true);
    }
    if(notifications != null && !notifications.result){
      return new DataResult("没有新的消息了", false);
    }

  }
  ///请求刷新
  @override
  requestRefresh() {
    // TODO: implement requestRefresh
    //getMessagePush();
    return _getData(readState,skipCountInit);
  }
  ///请求加载更多
  @override
  requestLoadMore() {
    // TODO: implement requestLoadMore
    var dataLoadMore = _getData(readState,skipCountGlobal);
    if(dataLoadMore.result){
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
  void didChangeDependencies(){
//    if(pullLoadWidgetControl.dataList.length == 0){
//      showRefreshLoading();
//    }
    super.didChangeDependencies();
    handleRefresh();
  }

  Widget selectUnread() {
    return Container(
      child: FloatingActionButton(
        onPressed: (){
          readState = 0;
          handleRefresh();
        },
        tooltip: '查未读',
        heroTag: "unRead",
        child: Icon(Icons.chat_bubble),
      ),
    );
  }

  Widget selectRead() {
    return Container(
      child: FloatingActionButton(
        onPressed: (){
          readState = 1;
          handleRefresh();
        },
        tooltip: '查已读',
        heroTag: "alreadyRead",
        child: Icon(Icons.chat),
      ),
    );
  }

  Widget selectAll() {
    return Container(
      child: FloatingActionButton(
        onPressed: (){
          readState = null;
          handleRefresh();
        },
        tooltip: '查所有',
        heroTag: "allNotifications",
        child: Icon(Icons.chat_bubble_outline),
      ),
    );
  }

  Widget makeAllRead() {
    return Container(
      child: FloatingActionButton(
        onPressed: () async {
          var makeAllReadRes = await NoticeDao.makeAllUserNotificationsAsRead();
          if(makeAllReadRes != null && makeAllReadRes.result){
            CommonUtils.showShort("已全部设为已读");
            readState = null;
            handleRefresh();
          }
          if(makeAllReadRes != null && !makeAllReadRes.result){
            CommonUtils.showShort("全部设为已读失败，请重试");
            readState = null;
            handleRefresh();
          }
        },
        tooltip: '全部设为已读',
        heroTag: "makeAllRead",
        child: Icon(Icons.done_all),
      ),
    );
  }
  @override
  Widget build(BuildContext context){
    super.build(context);
    return new StoreBuilder<CustomState>(
      builder: (context, store){
        return Scaffold(
          body: CustomPullLoadWidget(
            pullLoadWidgetControl,
                (BuildContext context, int index) => renderItem(index,(){
              _refreshNotify();
            }),
            handleRefresh,
            onLoadMore,
            refreshKey: refreshIndicatorKey,
          ),
          floatingActionButton: AnimatedFloatingActionButton(
            fabButtons: <Widget>[
              selectUnread(),
              selectRead(),
              selectAll(),
              makeAllRead()
            ],
            colorStartAnimation: Colors.blue,
            colorEndAnimation: Colors.red,
            animatedIconData: AnimatedIcons.menu_close,
          ),
        );
      },
    );
  }
}