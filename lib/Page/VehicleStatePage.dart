import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app123456/common/config/Config.dart';
import 'package:flutter_app123456/common/dao/VehicleStateDao.dart';
import 'package:flutter_app123456/common/local/LocalStorage.dart';
import 'package:flutter_app123456/common/model/VehicleState.dart';
import 'package:flutter_app123456/common/style/CustomStyle.dart';
import 'package:flutter_app123456/widget/CustomErrorReturnWidget.dart';
import 'package:flutter_app123456/widget/CustomTableRowWidget.dart';

class VehicleStatePage extends StatefulWidget {
  static final String name = "vehicleState";

  VehicleStatePage({Key key}) : super(key: key);

  @override
  _VehicleStatePageState createState() => _VehicleStatePageState();
}

class _VehicleStatePageState extends State<VehicleStatePage> {
  _VehicleStatePageState();

  ///*********************异步获取数据进行页面显示****************************
  Future<List<VehicleState>> vehicleStateList;

  Future<List<VehicleState>> fetchData() async {
    var vehicleStateList;// = await LocalStorage.get(Config.VEHICLE_STATE);
    if (vehicleStateList == null) {
      //var userId = await LocalStorage.get(Config.USER_ID);Config.TENANT, userId
      var vehicleStates = await VehicleStateDao.getVehicleStateInfo();
      vehicleStateList = vehicleStates.data;
      print("first in this: " + vehicleStates.data.toString());
    }
    if (vehicleStateList != null) {
      List<dynamic> list = json.decode(vehicleStateList);
      print("list of vehicleStateList::" + list.toString());
      if (list.length <= 0) {
        List<VehicleState> listReturnNull = new List<VehicleState>();
        listReturnNull.add(new VehicleState(null, null, null, null, null, null,
            null, null, null, null, null, null, null, null, null, null));
        return listReturnNull;
      }
      List<VehicleState> listReturn = new List<VehicleState>();
      for (int i = 0; i < list.length; i++) {
        listReturn.add(VehicleState.fromJson(list[i]));
      }
      return listReturn;
    } else {
      List<VehicleState> listReturnNull = new List<VehicleState>();
      listReturnNull.add(new VehicleState(null, null, null, null, null, null,
          null, null, null, null, null, null, null, null, null, null));
      return listReturnNull;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    vehicleStateList = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          leading: IconButton(
              iconSize: 15.0,
              icon: Icon(CustomIcons.BACK, color: Color(0xff4C88FF)),
              onPressed: () {
                Navigator.of(context).pop();
              }),
          brightness: Brightness.light,
          backgroundColor: Colors.white,
          title: new Text("车辆状态",
              style: TextStyle(fontSize: 18.0, color: Colors.black)),
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 10.0),
          child: Container(
            child: FutureBuilder<List<VehicleState>>(
              future: vehicleStateList,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return new ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int position) {
                        return _getItem(snapshot.data[position]);
                      });
                } else if (snapshot.hasError) {
                  return CustomErrorReturnWidget();
                }
                return SizedBox(height: 2.0, child: LinearProgressIndicator());
              },
            ),
          ),
        ));
  }

  _getItem(VehicleState subject) {
    return Container(
      child: Padding(
        padding:
            EdgeInsets.only(top: 15.0, left: 25.0, right: 25.0, bottom: 15.0),
        child: Table(
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: <TableRow>[
            TableRow(children: <Widget>[
              CustomTableRowWidget(
                  "业务类型",
                  subject.businessType == null
                      ? "无"
                      : subject.businessType.toString()),
            ]),
            TableRow(children: <Widget>[
              CustomTableRowWidget(
                "车辆编号",
                subject.vehicleCode == null
                    ? "无"
                    : subject.vehicleCode.toString(),
              ),
            ]),
            TableRow(children: <Widget>[
              CustomTableRowWidget(
                "车务状态",
                subject.vehicleAffairsStatusText == null
                    ? "无"
                    : subject.vehicleAffairsStatusText.toString(),
              ),
            ]),
            TableRow(children: <Widget>[
              CustomTableRowWidget(
                "车务类型",
                subject.vehicleAffairsTypeText == null
                    ? "无"
                    : subject.vehicleAffairsTypeText.toString(),
              ),
            ]),
            TableRow(children: <Widget>[
              CustomTableRowWidget(
                "办理类型",
                subject.handleType == null
                    ? "无"
                    : subject.handleType.toString(),
              ),
            ]),
            TableRow(children: <Widget>[
              CustomTableRowWidget(
                "办理状态",
                subject.handleStatusText == null
                    ? "无"
                    : subject.handleStatusText.toString(),
              ),
            ]),
            TableRow(children: <Widget>[
              CustomTableRowWidget(
                "状态标识",
                subject.vehicleStateFlag == null
                    ? "无"
                    : subject.vehicleStateFlag.toString(),
              ),
            ]),
            TableRow(children: <Widget>[
              CustomTableRowWidget(
                "备注",
                subject.description == null
                    ? "无"
                    : subject.description.toString(),
              ),
            ]),
          ],
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2.0),
        border: Border.all(
          color: Color(0xffF9FBFF),
          width: 1.0,
          style: BorderStyle.solid,
        ),
      ),
    );
  }
}
