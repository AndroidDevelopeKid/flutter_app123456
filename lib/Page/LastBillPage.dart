


import 'package:flutter/material.dart';
import 'package:flutter_app123456/common/style/CustomStyle.dart';

class LastBillPage extends StatefulWidget{
  static final String name = "LastBill";

  LastBillPage({Key key}) : super(key:key);

  _LastBillPage createState() => _LastBillPage();
}

class _LastBillPage extends State<LastBillPage>{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("最新提货单"),
      ),

      body:

      new Card(
        color: Color(CustomColors.displayCardBackground),
        margin: const EdgeInsets.only(left: 20.0, top: 30.0, right: 20.0, bottom: 30),
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