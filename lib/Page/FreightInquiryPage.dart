


import 'package:flutter/material.dart';
import 'package:flutter_app123456/common/style/CustomStyle.dart';

class FreightInquiryPage extends StatefulWidget{
  static final String name = "FreightInquiry";

  FreightInquiryPage({Key key}) : super(key:key);

  _FreightInquiryPage createState() => _FreightInquiryPage();
}

class _FreightInquiryPage extends State<FreightInquiryPage>{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("运费查询"),
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