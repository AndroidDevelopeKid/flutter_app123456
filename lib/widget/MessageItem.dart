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
            padding: const EdgeInsets.all(32.0),
            child: new Row(
              children: [

                new Expanded(
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      new Container(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: new Text(
                          messageItemViewModel.isRead == false ? "未读" : "已读",
                          style: new TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      new Text(
                        messageItemViewModel.msg,
                        style: new TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                new Image.asset(CustomIcons.MESSAGE_IMAGE),
//                new Icon(
//                  Icons.star,
//                  color: Colors.red[500],
//                ),
//                new Text('41'),
              ],
            ),
          ),
//          new Padding(
//            padding: new EdgeInsets.only(
//                left: 0.0, top: 5.0, right: 0.0, bottom: 10.0),
//            child: new Row(
//                children: <Widget>[
//                  new Expanded(child: new Text(messageItemViewModel.msg, style: CustomConstant.smallTextBold)),
//            ]),
//
//          ),
        ),
      ),

    );
  }
}

class MessageItemViewModel {
  bool isRead;
  String msg;

  MessageItemViewModel.fromMap(MessagePush msgPush) {
    isRead = msgPush.isRead;
    msg = msgPush.msg;
  }


}