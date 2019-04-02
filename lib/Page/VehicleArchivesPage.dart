
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

class VehicleArchivesPage extends StatefulWidget{
  static final String name = "vehicleInfo";



  VehicleArchivesPage({Key key}) : super(key: key);

  @override
  _VehicleArchivesPageState createState() => _VehicleArchivesPageState();
}

class _VehicleArchivesPageState extends State<VehicleArchivesPage>{


  _VehicleArchivesPageState();

  ///*********************异步获取数据进行页面显示****************************
  Future<Vehicle> vehicle;


  Future<Vehicle> fetchData() async {
    var vehicleArchives =  await LocalStorage.get(Config.VEHICLE_ARCHIVES);
    if(vehicleArchives == null){
      var userId = await LocalStorage.get(Config.USER_ID);
      var resultDataVehicle = await VehicleDao.getVehicleInfo(Config.TENANT, userId);
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
    //super.build(context);
    //return new StoreBuilder<CustomState>(
    //  builder: (context, store) {
    return new Scaffold(
      backgroundColor: CustomColors.listBackground,
      appBar: new AppBar(
        title: new Text("车辆档案"),
      ),
      body:
      new Card(
        color: Color(CustomColors.displayCardBackground),
        //margin: const EdgeInsets.only(left: 20.0, top: 30.0, right: 20.0, bottom: 30),
        margin: EdgeInsets.only(top: 6.0, bottom: 6.0, left: 4.0, right: 4.0),
        elevation: 8.0,
        child: new Container(
          child: FutureBuilder<Vehicle>(
            future: vehicle,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                //return Text(snapshot.data.vehicleCode);
                return new Table(
//                columnWidths: {
//                  0: FixedColumnWidth(100.0),
//                  1: FixedColumnWidth(100.0)
//                },
                  border: TableBorder.all(color: Color(CustomColors.tableBorderColor), width: 2.0, style: BorderStyle.solid),
                  children: <TableRow>[
                    TableRow(
                        children: <Widget>[
                          Text("车辆编号：", style: CustomConstant.normalTextBlack),
                          Text(snapshot.data.vehicleCode == null ? "无": snapshot.data.vehicleCode, style: CustomConstant.normalTextBlack),
                        ]
                    ),
                    TableRow(
                        children: <Widget>[
                          Text("车牌号：", style: CustomConstant.normalTextBlack),
                          Text(snapshot.data.mainVehiclePlate == null ? "无" : snapshot.data.mainVehiclePlate, style: CustomConstant.normalTextBlack),
                        ]
                    ),
                    TableRow(
                        children: <Widget>[
                          Text("物流公司：", style: CustomConstant.normalTextBlack),
                          Text(snapshot.data.ouDisplayName == null ? "无" : snapshot.data.ouDisplayName, style: CustomConstant.normalTextBlack),
                        ]
                    ),
                    TableRow(
                        children: <Widget>[
                          Text("车辆类型：", style: CustomConstant.normalTextBlack),
                          Text(snapshot.data.vehicleTypeText == null ? "无" : snapshot.data.vehicleTypeText, style: CustomConstant.normalTextBlack),
                        ]
                    ),
                    TableRow(
                        children: <Widget>[
                          Text("业务类型：", style: CustomConstant.normalTextBlack),
                          Text(snapshot.data.vehicleBusinessTypeText == null ? "无" : snapshot.data.vehicleBusinessTypeText, style: CustomConstant.normalTextBlack),
                        ]
                    ),
                    TableRow(
                        children: <Widget>[
                          Text("车型：", style: CustomConstant.normalTextBlack),
                          Text(snapshot.data.vehicleTypeText == null ? "无" : snapshot.data.vehicleTypeText, style: CustomConstant.normalTextBlack),
                        ]
                    ),
                    TableRow(
                        children: <Widget>[
                          Text("车辆状态：", style: CustomConstant.normalTextBlack),
                          Text(snapshot.data.vehicleStateText == null ? "无": snapshot.data.vehicleStateText, style: CustomConstant.normalTextBlack),
                        ]
                    ),
                    TableRow(
                        children: <Widget>[
                          Text("车主姓名：", style: CustomConstant.normalTextBlack),
                          Text(snapshot.data.ownerName == null ? "无" : snapshot.data.ownerName, style: CustomConstant.normalTextBlack),
                        ]
                    ),
                    TableRow(
                        children: <Widget>[
                          Text("车主身份证号：", style: CustomConstant.normalTextBlack),
                          Text(snapshot.data.ownerIDNumber == null ? "无" : snapshot.data.ownerIDNumber, style: CustomConstant.normalTextBlack),
                        ]
                    ),
                    TableRow(
                        children: <Widget>[
                          Text("车主联系方式：", style: CustomConstant.normalTextBlack),
                          Text(snapshot.data.ownerPhone == null ? "无" : snapshot.data.ownerPhone, style: CustomConstant.normalTextBlack)
                        ]
                    ),
                    TableRow(
                        children: <Widget>[
                          Text("车架号：", style: CustomConstant.normalTextBlack),
                          Text(snapshot.data.trailerFrameNumber == null ? "无" : snapshot.data.trailerFrameNumber, style: CustomConstant.normalTextBlack)
                        ]
                    ),
                    TableRow(
                        children: <Widget>[
                          Text("发动机编号：", style: CustomConstant.normalTextBlack),
                          Text(snapshot.data.engineNumber == null ? "无" : snapshot.data.engineNumber, style: CustomConstant.normalTextBlack)
                        ]
                    ),
                    TableRow(
                        children: <Widget>[
                          Text("加盟日期：", style: CustomConstant.normalTextBlack),
                          Text(snapshot.data.joiningDate == null ? "0000-00-00" : snapshot.data.joiningDate.toString().substring(0,10), style: CustomConstant.normalTextBlack)
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
    //    },
    //  );
  }
///************************************************************

}