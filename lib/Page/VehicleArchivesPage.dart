
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app123456/common/config/Config.dart';
import 'package:flutter_app123456/common/dao/DriverDao.dart';
import 'package:flutter_app123456/common/dao/UserDao.dart';
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
  Future<Vehicle> vehicleObj;


  Future<Vehicle> fetchData() async {
    var vehicleArchives =  await LocalStorage.get(Config.VEHICLE_ARCHIVES);
    Vehicle vehicle = Vehicle.fromJson(json.decode(vehicleArchives));
    return vehicle;
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    vehicleObj = fetchData();
  }



  @override
  Widget build(BuildContext context) {
    //super.build(context);
    //return new StoreBuilder<CustomState>(
    //  builder: (context, store) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("车辆档案"),
      ),
      body:
      new Card(
        color: Color(CustomColors.displayUsernameBackground),
        margin: const EdgeInsets.only(left: 20.0, top: 60.0, right: 20.0, bottom: 60),
        child: new Center(
          child: FutureBuilder<Vehicle>(
            future: vehicleObj,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                //return Text(snapshot.data.vehicleCode);
                return new Table(
//                columnWidths: {
//                  0: FixedColumnWidth(100.0),
//                  1: FixedColumnWidth(100.0)
//                },
                  border: TableBorder.all(color: Colors.white, width: 1.0, style: BorderStyle.solid),
                  children: <TableRow>[
                    TableRow(
                        children: <Widget>[
                          Text("物流公司："),
                          Text(snapshot.data.ouDisplayName),
                        ]
                    ),
                    TableRow(
                        children: <Widget>[
                          Text("所属调运组："),
                          Text(snapshot.data.detailedOUDisplayName),
                        ]
                    ),
                    TableRow(
                        children: <Widget>[
                          Text("车辆编号："),
                          Text(snapshot.data.vehicleCode),
                        ]
                    ),
                    TableRow(
                        children: <Widget>[
                          Text("车牌号："),
                          Text(snapshot.data.mainVehiclePlate),
                        ]
                    ),
                    TableRow(
                        children: <Widget>[
                          Text("车主姓名："),
                          Text(snapshot.data.ownerName)
                        ]
                    ),
                    TableRow(
                        children: <Widget>[
                          Text("车主身份证号："),
                          Text(snapshot.data.ownerIDNumber)
                        ]
                    ),
                    TableRow(
                        children: <Widget>[
                          Text("车主电话："),
                          Text(snapshot.data.ownerPhone)
                        ]
                    ),
                    TableRow(
                        children: <Widget>[
                          Text("车辆业务类型："),
                          Text(snapshot.data.vehicleBusinessTypeText)
                        ]
                    ),
                    TableRow(
                        children: <Widget>[
                          Text("车辆类型："),
                          Text(snapshot.data.vehicleTypeText)
                        ]
                    ),
                    TableRow(
                        children: <Widget>[
                          Text("车辆状态："),
                          Text(snapshot.data.vehicleStateText)
                        ]
                    ),
                    TableRow(
                        children: <Widget>[
                          Text("车组："),
                          Text(snapshot.data.vehicleGroupText.toString())
                        ]
                    ),
                    TableRow(
                        children: <Widget>[
                          Text("备注："),
                          Text(snapshot.data.description)
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
        ),

      ),
    );
    //    },
    //  );
  }
///************************************************************

}