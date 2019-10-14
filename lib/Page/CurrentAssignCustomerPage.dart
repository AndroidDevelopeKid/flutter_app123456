import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app123456/common/config/Config.dart';
import 'package:flutter_app123456/common/dao/DriverDao.dart';
import 'package:flutter_app123456/common/local/LocalStorage.dart';
import 'package:flutter_app123456/common/model/DispatchAssign.dart';
import 'package:flutter_app123456/common/style/CustomStyle.dart';
import 'package:flutter_app123456/widget/CustomErrorReturnWidget.dart';
import 'package:flutter_app123456/widget/CustomTableRowWidget.dart';

class CurrentAssignCustomerPage extends StatefulWidget {
  static final String name = "CurrentAssignCustomer";

  CurrentAssignCustomerPage({Key key}) : super(key: key);

  _CurrentAssignCustomerPage createState() => _CurrentAssignCustomerPage();
}

class _CurrentAssignCustomerPage extends State<CurrentAssignCustomerPage> {
  _CurrentAssignCustomerPage();

  Future<DispatchAssign> dispatchAssign;

  Future<DispatchAssign> fetchData() async {
    var dispatchAssign;// = await LocalStorage.get(Config.DISPATCH_ASSIGN);
    if (dispatchAssign == null) {
      var resultDispatchAssign = await DriverDao.getDispatchAssignInfo();
      if (resultDispatchAssign.data == null) {
        var dataNull =
            new DispatchAssign(null, null, null, null, null, null, null, null);
        return dataNull;
      } else {
        return resultDispatchAssign.data;
      }
    } else {
      DispatchAssign dispatchAssignData =
          DispatchAssign.fromJson(json.decode(dispatchAssign));
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
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            iconSize: 15.0,
            icon: Icon(CustomIcons.BACK, color: Color(0xff4C88FF)),
            onPressed: () {
              Navigator.of(context).pop();
            }),
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        title: Text("当前指派客户",
            style: TextStyle(fontSize: 18.0, color: Colors.black)),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 10.0),
        child: Container(
          child: FutureBuilder<DispatchAssign>(
            future: dispatchAssign,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                //return Text(snapshot.data.vehicleCode);
                return Padding(
                    padding: EdgeInsets.only(
                        top: 15.0, left: 25.0, right: 25.0, bottom: 15.0),
                    child: Table(
                      children: <TableRow>[
                        TableRow(children: <Widget>[
                          CustomTableRowWidget(
                            "物流公司",
                            snapshot.data.organizationUnitName == null
                                ? "无"
                                : snapshot.data.organizationUnitName,
                          ),
                        ]),
                        TableRow(children: <Widget>[
                          CustomTableRowWidget(
                            "车辆编号",
                            snapshot.data.vehicleCode == null
                                ? "无"
                                : snapshot.data.vehicleCode,
                          ),
                        ]),
                        TableRow(children: <Widget>[
                          CustomTableRowWidget(
                            "派车分组",
                            snapshot.data.groupText == null
                                ? "无"
                                : snapshot.data.groupText,
                          ),
                        ]),
                        TableRow(children: <Widget>[
                          CustomTableRowWidget(
                            "是否激活",
                            snapshot.data.isActive == true ? "是" : "否",
                          ),
                        ]),
                      ],
                    ));
              } else if (snapshot.hasError) {
                return CustomErrorReturnWidget();
              }
              return SizedBox(height: 2.0, child: LinearProgressIndicator());
            },
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2.0),
            border: Border.all(
              color: Color(0xffF9FBFF),
              width: 1.0,
              style: BorderStyle.solid,
            ),
          ),
        ),
      ),
    );
  }
}
