


import 'package:flutter/material.dart';
import 'package:flutter_app123456/common/style/CustomStyle.dart';

class QueueInfoPage extends StatefulWidget{
  static final String name = "QueueInfo";

  QueueInfoPage({Key key}) : super(key:key);

  _QueueInfoPage createState() => _QueueInfoPage();
}

class _QueueInfoPage extends State<QueueInfoPage>{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("排队信息"),
      ),

      body:

      new Card(
        color: Color(CustomColors.displayUsernameBackground),
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