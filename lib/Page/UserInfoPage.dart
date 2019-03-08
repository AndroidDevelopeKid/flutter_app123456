
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app123456/common/config/Config.dart';
import 'package:flutter_app123456/common/dao/DriverDao.dart';
import 'package:flutter_app123456/common/dao/UserDao.dart';
import 'package:flutter_app123456/common/local/LocalStorage.dart';
import 'package:flutter_app123456/common/model/Driver.dart';
import 'package:flutter_app123456/common/style/CustomStyle.dart';
import 'package:flutter_app123456/common/utils/CommonUtils.dart';

class UserInfoPage extends StatefulWidget{
  static final String name = "userInfo";



  UserInfoPage({Key key}) : super(key: key);

  @override
  _UserInfoPageState createState() => _UserInfoPageState();
}

class _UserInfoPageState extends State<UserInfoPage>{


  _UserInfoPageState();

  ///*********************异步获取数据进行页面显示****************************
  Future<Driver> driverObj;


  Future<Driver> fetchData() async {
      var driverArchives = await LocalStorage.get(Config.DRIVER_ARCHIVES);
      Driver driver = Driver.fromJson(json.decode(driverArchives));
      return driver;
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    driverObj = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    //super.build(context);
    //return new StoreBuilder<CustomState>(
    //  builder: (context, store) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("人员档案"),
      ),
      body:
      new Card(
        color: Color(CustomColors.displayUsernameBackground),
        margin: const EdgeInsets.only(left: 20.0, top: 60.0, right: 20.0, bottom: 60),
        child: new Center(
          child: FutureBuilder<Driver>(
          future: driverObj,
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
                      Text("司机姓名："),
                      Text(snapshot.data.driverName),
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
                      Text("物流公司："),
                      Text(snapshot.data.ouDisplayName),
                    ]
                  ),
                  TableRow(
                    children: <Widget>[
                      Text("电话号码："),
                      Text(snapshot.data.driverPhone),
                    ]
                  ),
                  TableRow(
                    children: <Widget>[
                      Text("加入日期："),
                      Text(snapshot.data.joiningDate)
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

  }
  ///************************************************************





//
//
//  @override
//  Widget build(BuildContext context) {
//    return new Scaffold(
//        appBar: new AppBar(
//            title: new Text("数据显示"),
//            ),
//
//        body:
//
//        new Card(
//          color: Color(CustomColors.displayUsernameBackground),
//          margin: const EdgeInsets.only(left: 20.0, top: 60.0, right: 20.0, bottom: 60),
//          child: new Center(
//            child: new Text(
//              "显示对应的信息！",
//              style: CustomConstant.normalTextBlack,
//            ),
//          ),
//
//        ),
//    );
//  }
}