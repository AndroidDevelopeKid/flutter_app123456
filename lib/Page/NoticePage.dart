

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app123456/common/dao/NoticeDao.dart';
import 'package:flutter_app123456/common/dao/ResultDao.dart';
import 'package:flutter_app123456/common/model/MessagePush.dart';
import 'package:flutter_app123456/common/redux/CustomState.dart';
import 'package:flutter_app123456/widget/BaseMessagePushState.dart';
import 'package:flutter_app123456/common/style/CustomStyle.dart';
import 'package:flutter_app123456/widget/CustomPullLoadWidget.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class NoticePage extends StatefulWidget{
  _NoticePageState createState() => _NoticePageState();
}

class _NoticePageState extends BaseMessagePushState<NoticePage>{
  ///消息颜色
  Color messageColor = const Color(CustomColors.subLightTextColor);
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
    handleRefresh();

  }
  ///获取数据
  _getData() async {
    final List<MessagePush> messagePushList = new List();
    var notifications = await NoticeDao.getPagedUserNotifications();
    print("notifications in noticePage: " + notifications.data.toString());
    var itemList = notifications.data["result"]["items"];
    print("notifications in noticePage itemList: " + itemList.toString() + itemList.length.toString());
    print("notifications in noticePage itemList length: " + itemList.length.toString());
    for(int i = 0; i < itemList.length; i++){
      print("notifications in noticePage item" + i.toString() + ":" + itemList[i]["notification"]["data"]["messageText"].toString());
      var msg = itemList[i]["notification"]["data"]["messageText"].toString();
      messagePushList.add(new MessagePush(i.toString(), false, msg));
    }

//    messagePushList.add(new MessagePush("1", false, "消息1"));
//    messagePushList.add(new MessagePush("2", false, "消息2"));
//    messagePushList.add(new MessagePush("3", false, "消息3"));
//    messagePushList.add(new MessagePush("4", false, "消息4"));
//    messagePushList.add(new MessagePush("5", false, "消息5"));
//
//    messagePushList.add(new MessagePush("6", false, "消息6"));

//    messagePushList.add(new MessagePush("7", false, "消息7"));
//    messagePushList.add(new MessagePush("8", false, "消息8"));
//    messagePushList.add(new MessagePush("9", false, "消息9"));
//    messagePushList.add(new MessagePush("10", false, "消息10"));

    return new DataResult(messagePushList, true);
  }
  ///请求刷新
  @override
  requestRefresh() {
    // TODO: implement requestRefresh
    //getMessagePush();
    return _getData();
  }
  ///请求加载更多
  @override
  requestLoadMore() {
    // TODO: implement requestLoadMore
    return _getData();
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
  }
  @override
  Widget build(BuildContext context){
    super.build(context);
    return new StoreBuilder<CustomState>(
      builder: (context, store){
        return CustomPullLoadWidget(
          pullLoadWidgetControl,
          (BuildContext context, int index) => renderItem(index,(){
            _refreshNotify();
          }),
          handleRefresh,
          onLoadMore,
          refreshKey: refreshIndicatorKey,
        );
      },
    );
  }
}