


import 'package:flutter/material.dart';
import 'package:flutter_app123456/common/style/CustomStyle.dart';

class HistoryBillPage extends StatefulWidget{
  static final String name = "HistoryBill";

  HistoryBillPage({Key key}) : super(key:key);

  _HistoryBillPage createState() => _HistoryBillPage();
}

class _HistoryBillPage extends State<HistoryBillPage>{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: CustomColors.listBackground,
      appBar: new AppBar(
        title: new Text("历史提货单"),
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