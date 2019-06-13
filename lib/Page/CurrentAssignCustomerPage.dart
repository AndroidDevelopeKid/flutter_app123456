


import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app123456/common/config/Config.dart';
import 'package:flutter_app123456/common/dao/DriverDao.dart';
import 'package:flutter_app123456/common/local/LocalStorage.dart';
import 'package:flutter_app123456/common/model/DispatchAssign.dart';
import 'package:flutter_app123456/common/style/CustomStyle.dart';

class CurrentAssignCustomerPage extends StatefulWidget{
  static final String name = "CurrentAssignCustomer";

  CurrentAssignCustomerPage({Key key}) : super(key:key);

  _CurrentAssignCustomerPage createState() => _CurrentAssignCustomerPage();
}

class _CurrentAssignCustomerPage extends State<CurrentAssignCustomerPage>{
  _CurrentAssignCustomerPage();
  Future<DispatchAssign> dispatchAssign;


  Future<DispatchAssign> fetchData() async {
    var dispatchAssign = await LocalStorage.get(Config.DISPATCH_ASSIGN);
    if(dispatchAssign == null){
      var resultDispatchAssign = await DriverDao.getDispatchAssignInfo();
      if(resultDispatchAssign.data == null){
        var dataNull = new DispatchAssign(null, null, null, null, null, null, null,null);
        return dataNull;
      }else{
        return resultDispatchAssign.data;
      }
    }else{
      DispatchAssign dispatchAssignData = DispatchAssign.fromJson(json.decode(dispatchAssign));
      return dispatchAssignData;
    }

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dispatchAssign = fetchData();
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: CustomColors.listBackground,
      appBar: new AppBar(
        title: new Text("当前指派客户"),
      ),
      body:
      new Card(
        color: Color(CustomColors.displayCardBackground),
        //margin: const EdgeInsets.only(left: 20.0, top: 30.0, right: 20.0, bottom: 30),
        margin: EdgeInsets.only(top: 6.0, bottom: 6.0, left: 4.0, right: 4.0),
        elevation: 8.0,
        child: new Container(
          child: FutureBuilder<DispatchAssign>(
            future: dispatchAssign,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                //return Text(snapshot.data.vehicleCode);
                return new Table(
                  border: TableBorder.all(color: Color(CustomColors.tableBorderColor), width: 2.0, style: BorderStyle.solid),
                  children: <TableRow>[
                    TableRow(
                        children: <Widget>[
                          Text("物流公司：", style: CustomConstant.normalTextBlack),
                          Text(snapshot.data.organizationUnitName == null ? "无" : snapshot.data.organizationUnitName, style: CustomConstant.normalTextBlack),
                        ]
                    ),
                    TableRow(
                        children: <Widget>[
                          Text("车辆编号：", style: CustomConstant.normalTextBlack),
                          Text(snapshot.data.vehicleCode == null ? "无" : snapshot.data.vehicleCode, style: CustomConstant.normalTextBlack),
                        ]
                    ),
                    TableRow(
                        children: <Widget>[
                          Text("派车分组：", style: CustomConstant.normalTextBlack),
                          Text(snapshot.data.groupText == null ? "无" : snapshot.data.groupText, style: CustomConstant.normalTextBlack),
                        ]
                    ),
                    TableRow(
                        children: <Widget>[
                          Text("备注：", style: CustomConstant.normalTextBlack),
                          Text(snapshot.data.remark == null ? "无" : snapshot.data.remark, style: CustomConstant.normalTextBlack),
                        ]
                    ),
                    TableRow(
                        children: <Widget>[
                          Text("是否激活：", style: CustomConstant.normalTextBlack),
                          Text(snapshot.data.isActive == true ? "是" : "否", style: CustomConstant.normalTextBlack),
                        ]
                    ),
                  ],
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return CircularProgressIndicator();
            },
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(
              color: CustomColors.listBackground,
              width: 0.7,
              style: BorderStyle.solid,
            ),
          ),
          padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 12.0, bottom: 12.0),
        ),

      ),
    );
  }


}