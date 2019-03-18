


import 'package:flutter/material.dart';
import 'package:flutter_app123456/common/style/CustomStyle.dart';

class MessageDetailPage extends StatefulWidget{
  static final String name = "messageDetail";

  MessageDetailPage({Key key}) : super(key:key);

  _MessageDetailPage createState() => _MessageDetailPage();
}

class _MessageDetailPage extends State<MessageDetailPage>{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("数据显示"),
      ),

      body:

      new Card(
        color: Color(CustomColors.displayCardBackground),
        margin: const EdgeInsets.only(left: 20.0, top: 60.0, right: 20.0, bottom: 60),
        child: new Center(
          child: new Text(
            "显示对应的信息！",
            style: CustomConstant.normalTextBlack,
          ),
        ),

      ),
    );
  }
}