import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app123456/common/model/MessagePush.dart';
import 'package:flutter_app123456/common/style/CustomStyle.dart';
import 'package:flutter_app123456/widget/CustomCardItem.dart';

class MessageItem extends StatelessWidget {

  final MessageItemViewModel messageItemViewModel;
  final VoidCallback onPressed;

  MessageItem(this.messageItemViewModel,{this.onPressed}) : super();

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new CustomCardItem(
        child: new FlatButton(
          onPressed: onPressed,
          child:
          new Container(
            padding: const EdgeInsets.all(10.0),
            child: new Column(
              children: [
                new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        new Image.asset(CustomIcons.MESSAGE_IMAGE),
                        new Text(
                          messageItemViewModel.isRead == 0 ? "未读" : "已读",
                        ),
                      ],
                    ),
                new Padding(padding: EdgeInsets.all(10.0)),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                  new Text(
                    messageItemViewModel.msg == "null" ? "无内容" : messageItemViewModel.msg,
                  ),
                  new Text(
                    messageItemViewModel.creationTime == "null" ? "几天前" : TimelineUtil.formatByDateTime(DateTime.parse(messageItemViewModel.creationTime), dayFormat: DayFormat.Simple),
                  ),
                ],),
              ],
            ),
          ),
        ),
      ),

    );
  }
}

class MessageItemViewModel {
  int isRead;
  String msg;
  String id;
  String messageSource;
  String messageFlag;
  String senderUserName;
  String creationTime;

  MessageItemViewModel.fromMap(MessagePush msgPush) {
    isRead = msgPush.isRead;
    msg = msgPush.msg;
    id = msgPush.id;
    messageFlag = msgPush.messageFlag;
    messageSource = msgPush.messageSource;
    senderUserName = msgPush.senderUserName;
    creationTime = msgPush.creationTime;
  }


}