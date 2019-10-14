import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app123456/common/model/MessagePush.dart';
import 'package:flutter_app123456/common/style/CustomStyle.dart';
import 'package:flutter_app123456/widget/CustomCardItem.dart';

class MessageItem extends StatelessWidget {
  final MessageItemViewModel messageItemViewModel;
  final VoidCallback onPressed;

  MessageItem(this.messageItemViewModel, {this.onPressed}) : super();

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onPressed,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                          left: 30.0,
                          top: 21.0,
                        ),
                        child: Row(
                          children: <Widget>[
                            Container(
                              child: messageItemViewModel.isRead == 0
                                  ? SizedBox(
                                      width: 22.0,
                                      height: 20.0,
                                      child:
                                          Image.asset(CustomIcons.MESSAGE_UNREAD),
                                    )
                                  : SizedBox(
                                      width: 17.0,
                                      height: 15.0,
                                      child: Image.asset(
                                          CustomIcons.MESSAGE_READ)),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 12.0),
                              child: Text(
                                messageItemViewModel.creationTime == "null"
                                    ? "几天前"
                                    : TimelineUtil.formatByDateTime(
                                        DateTime.parse(
                                            messageItemViewModel.creationTime),
                                        dayFormat: DayFormat.Simple),
                                style: TextStyle(fontSize: 11.0),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 30.0, top: 14.0),
                        child: Text(
                          messageItemViewModel.msg == "null"
                              ? "无内容"
                              : messageItemViewModel.msg,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 13.0),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 28.0, right: 28.0),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 26.0),
                  child: Text(
                    messageItemViewModel.isRead == 0 ? "未读" : "已读",
                    style: TextStyle(color: Color(0xffCCCCCC), fontSize: 15.0),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 9.0, bottom: 9.0),
            ),
            Divider(
              height: 1.0,
            ),
          ],
        ));
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
