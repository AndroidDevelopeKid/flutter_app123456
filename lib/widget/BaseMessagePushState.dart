
import 'package:flutter/cupertino.dart';
import 'package:flutter_app123456/Page/MessageDetailPage.dart';
import 'package:flutter_app123456/common/dao/NoticeDao.dart';
import 'package:flutter_app123456/common/model/MessagePush.dart';
import 'package:flutter_app123456/common/utils/CommonUtils.dart';
import 'package:flutter_app123456/common/utils/NavigatorUtils.dart';
import 'package:flutter_app123456/widget/CustomListState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app123456/widget/MessageItem.dart';

abstract class BaseMessagePushState<T extends StatefulWidget> extends State<T> with AutomaticKeepAliveClientMixin<T>, CustomListState<T>{
  ///定义消息推送的列表数组
  //final List<MessagePush> messagePushList = new List();

  ///渲染item
  @protected
  renderItem(index, VoidCallback refreshCallBack){
      return new MessageItem(MessageItemViewModel.fromMap(pullLoadWidgetControl.dataList[index]), onPressed: () async{
        //设置此消息为已读
        var res = await NoticeDao.makeNotificationAsRead(MessageItemViewModel.fromMap(pullLoadWidgetControl.dataList[index]).id);
        if(res != null && res.result){
          //跳转详情
          Navigator.push(context, new CupertinoPageRoute(builder: (context){
            return new MessageDetailPage(MessageItemViewModel.fromMap(pullLoadWidgetControl.dataList[index]));
          },
          ),).then((isRefresh){
            print("tiaozhuan shua xin: " + isRefresh.toString());
            if(isRefresh){
              handleRefresh();
            }
          }
          );

        }
        if(res != null && !res.result){
          CommonUtils.showShort("显示信息详情失败");
        }

      },);
//    }

  }

  @override
  bool get wantKeepAlive => true;

  @override
  bool get isRefreshFirst => true;

  @override
  bool get needHeader => true;

  ///获取消息
//  @protected
//  getMessagePush(){
//    if(page <= 1){
//      setState(() {
//        messagePushList.clear();
//        messagePushList.add(new MessagePush("1", false, "aaaaa"));
//        messagePushList.add(new MessagePush("2", false, "bbbbb"));
//        messagePushList.add(new MessagePush("3", false, "ccccc"));
//        messagePushList.add(new MessagePush("4", false, "eeeee"));
//      });
//    }
//
//
//  }


}