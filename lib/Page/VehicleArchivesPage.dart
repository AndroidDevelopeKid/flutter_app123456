import 'dart:convert';

import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app123456/common/config/Config.dart';
import 'package:flutter_app123456/common/dao/DriverDao.dart';
import 'package:flutter_app123456/common/dao/UserDao.dart';
import 'package:flutter_app123456/common/dao/VehicleDao.dart';
import 'package:flutter_app123456/common/local/LocalStorage.dart';
import 'package:flutter_app123456/common/model/Driver.dart';
import 'package:flutter_app123456/common/model/Vehicle.dart';
import 'package:flutter_app123456/common/style/CustomStyle.dart';
import 'package:flutter_app123456/common/utils/CommonUtils.dart';
import 'package:flutter_app123456/widget/CustomErrorReturnWidget.dart';
import 'package:flutter_app123456/widget/CustomTableRowWidget.dart';

class VehicleArchivesPage extends StatefulWidget {
  static final String name = "vehicleInfo";

  VehicleArchivesPage({Key key}) : super(key: key);

  @override
  _VehicleArchivesPageState createState() => _VehicleArchivesPageState();
}

class _VehicleArchivesPageState extends State<VehicleArchivesPage> {
  _VehicleArchivesPageState();

  ///*********************异步获取数据进行页面显示****************************
  Future<Vehicle> vehicle;

  Future<Vehicle> fetchData() async {
    var vehicleArchives;//await LocalStorage.get(Config.VEHICLE_ARCHIVES);
    if (vehicleArchives == null) {
      //var userId = await LocalStorage.get(Config.USER_ID);Config.TENANT, userId
      var resultDataVehicle = await VehicleDao.getVehicleInfo();
      if (resultDataVehicle.data == null) {
        var dataNull = new Vehicle(null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
        return dataNull;
      }
      return resultDataVehicle.data;
    }
    Vehicle vehicleData = Vehicle.fromJson(json.decode(vehicleArchives));
    return vehicleData;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    vehicle = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        leading: IconButton(
            iconSize: 15.0,
            icon: Icon(CustomIcons.BACK, color: Color(0xff4C88FF)),
            onPressed: () {
              Navigator.of(context).pop();
            }),
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        title: new Text("车辆档案",
            style: TextStyle(fontSize: 18.0, color: Colors.black)),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 10.0),
        child: Container(
          child: FutureBuilder<Vehicle>(
            future: vehicle,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Padding(
                    padding: EdgeInsets.only(
                        top: 15.0, left: 25.0, right: 25.0, bottom: 15.0),
                    child: Table(
                      defaultVerticalAlignment:
                          TableCellVerticalAlignment.middle,
                      children: <TableRow>[
                        TableRow(children: <Widget>[
                          CustomTableRowWidget("车辆编号",
                              snapshot.data.vehicleCode == null
                                  ? "无"
                                  : snapshot.data.vehicleCode,),
                        ]),
                        TableRow(children: <Widget>[
                          CustomTableRowWidget("车牌号",
                              snapshot.data.mainVehiclePlate == null
                                  ? "无"
                                  : snapshot.data.mainVehiclePlate,),
                        ]),
                        TableRow(children: <Widget>[
                          CustomTableRowWidget("物流公司",
                              snapshot.data.ouDisplayName == null
                                  ? "无"
                                  : snapshot.data.ouDisplayName,),
                        ]),
                        TableRow(children: <Widget>[
                          CustomTableRowWidget("车辆类型",
                              snapshot.data.vehicleTypeText == null
                                  ? "无"
                                  : snapshot.data.vehicleTypeText,),
                        ]),
                        TableRow(children: <Widget>[
                          CustomTableRowWidget("业务类型",
                              snapshot.data.vehicleBusinessTypeText == null
                                  ? "无"
                                  : snapshot.data.vehicleBusinessTypeText,),
                        ]),
                        TableRow(children: <Widget>[
                          CustomTableRowWidget("车型",
                              snapshot.data.vehicleTypeText == null
                                  ? "无"
                                  : snapshot.data.vehicleTypeText,),
                        ]),
                        TableRow(children: <Widget>[
                          CustomTableRowWidget("车辆状态",
                              snapshot.data.vehicleStateText == null
                                  ? "无"
                                  : snapshot.data.vehicleStateText,),
                        ]),
                        TableRow(children: <Widget>[
                          CustomTableRowWidget("车主姓名",
                              snapshot.data.ownerName == null
                                  ? "无"
                                  : snapshot.data.ownerName,),
                        ]),
                        TableRow(children: <Widget>[
                          CustomTableRowWidget("车主身份证号",
                              snapshot.data.ownerIDNumber == null
                                  ? "无"
                                  : snapshot.data.ownerIDNumber,),
                        ]),
                        TableRow(children: <Widget>[
                          CustomTableRowWidget("车主联系方式",
                              snapshot.data.ownerPhone == null
                                  ? "无"
                                  : snapshot.data.ownerPhone,),
                        ]),
                        TableRow(children: <Widget>[
                          CustomTableRowWidget("车架号",
                              snapshot.data.trailerFrameNumber == null
                                  ? "无"
                                  : snapshot.data.trailerFrameNumber,),
                        ]),
                        TableRow(children: <Widget>[
                          CustomTableRowWidget("发动机编号",
                              snapshot.data.engineNumber == null
                                  ? "无"
                                  : snapshot.data.engineNumber,),
                        ]),
                        TableRow(children: <Widget>[
                          CustomTableRowWidget("加盟日期",
                              snapshot.data.joiningDate == null
                                  ? "无"
                                  : snapshot.data.joiningDate
                                      .toString()
                                      .substring(0, 10),),
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

  ///************************************************************

}
