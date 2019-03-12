


import 'package:flutter/material.dart';
import 'package:flutter_app123456/common/style/CustomStyle.dart';

class CurrentAssignCustomerPage extends StatefulWidget{
  static final String name = "CurrentAssignCustomer";

  CurrentAssignCustomerPage({Key key}) : super(key:key);

  _CurrentAssignCustomerPage createState() => _CurrentAssignCustomerPage();
}

class _CurrentAssignCustomerPage extends State<CurrentAssignCustomerPage>{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("当前指派客户"),
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