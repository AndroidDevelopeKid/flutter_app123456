
import 'dart:convert';

import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app123456/common/config/Config.dart';
import 'package:flutter_app123456/common/dao/DriverDao.dart';
import 'package:flutter_app123456/common/dao/UserDao.dart';
import 'package:flutter_app123456/common/local/LocalStorage.dart';
import 'package:flutter_app123456/common/model/Driver.dart';
import 'package:flutter_app123456/common/model/Vehicle.dart';
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
  Future<Driver> driver;


  Future<Driver> fetchData() async {
      var driverArchives = await LocalStorage.get(Config.DRIVER_ARCHIVES);
      if(driverArchives == null){
        var userId = await LocalStorage.get(Config.USER_ID);
        var resultDataDriver = await UserDao.getUserInfo(Config.TENANT, userId);
        if(resultDataDriver.data == null){
          var dataNull = new Driver("无", "无", "无", "无", "无", "无", "无", "无", "无", "无", "无", "无", "无");
          return dataNull;
        }else{
          return resultDataDriver.data;
        }
      }else{
        Driver driverData = Driver.fromJson(json.decode(driverArchives));
        return driverData;
      }

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    driver = fetchData();
  }

//  List<Widget> buildUI() {
//    // main UI rendering operation is performed here, be careful
//    List<Widget> tmpUI = [];
//    <List<dynamic>>[
//
//    ].forEach((List<dynamic> elem) {
//      elem.forEach((dynamic item) {
//        tmpUI.add(item.getCard());
//      });
//    });
//    return tmpUI;
//  }

  @override
  Widget build(BuildContext context) {
    //super.build(context);
    //return new StoreBuilder<CustomState>(
    //  builder: (context, store) {
    return new Scaffold(
      backgroundColor: CustomColors.listBackground,
      appBar: new AppBar(
        title: new Text("人员档案"),
      ),
      body:
      new Card(
        color: Color(CustomColors.displayCardBackground),
        //margin: const EdgeInsets.only(left: 20.0, top: 30.0, right: 20.0, bottom: 30),
        margin: EdgeInsets.only(top: 6.0, bottom: 6.0, left: 4.0, right: 4.0),
        elevation: 8.0,
        child: new Container(
          child: FutureBuilder<Driver>(
          future: driver,
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
                        Text("身份证号：", style: CustomConstant.normalTextBlack),
                        Text(snapshot.data.driverIDNumber == null ? "无" : snapshot.data.driverIDNumber.toString(), style: CustomConstant.normalTextBlack),
                      ]
                  ),
                  TableRow(
                    children: <Widget>[
                      Text("姓名：", style: CustomConstant.normalTextBlack),
                      Text(snapshot.data.driverName == null ? "无" : snapshot.data.driverName.toString(), style: CustomConstant.normalTextBlack),
                    ]
                  ),
                  TableRow(
                      children: <Widget>[
                        Text("电话号码：", style: CustomConstant.normalTextBlack),
                        Text(snapshot.data.driverPhone == null ? "无" : snapshot.data.driverPhone.toString(), style: CustomConstant.normalTextBlack),
                      ]
                  ),
                  TableRow(
                      children: <Widget>[
                        Text("所属物流公司：", style: CustomConstant.normalTextBlack),
                        Text(snapshot.data.ouDisplayName == null ? "无" : snapshot.data.ouDisplayName.toString(), style: CustomConstant.normalTextBlack),
                      ]
                  ),
                  TableRow(
                      children: <Widget>[
                        Text("人员类型：", style: CustomConstant.normalTextBlack),
                        Text(snapshot.data.personTypeText == null ? "无" : snapshot.data.personTypeText.toString(), style: CustomConstant.normalTextBlack),
                      ]
                  ),
                  TableRow(
                    children: <Widget>[
                      Text("车辆编号：", style: CustomConstant.normalTextBlack),
                      Text(snapshot.data.vehicleCode == null ? "无" : snapshot.data.vehicleCode.toString(), style: CustomConstant.normalTextBlack),
                    ]
                  ),
                  TableRow(
                    children: <Widget>[
                      Text("身份证到期日期：", style: CustomConstant.normalTextBlack),
                      Text(snapshot.data.certificateEndDate == null ? "0000-00-00" : snapshot.data.certificateEndDate.toString().substring(0,10), style: CustomConstant.normalTextBlack),
                    ]
                  ),
                  TableRow(
                    children: <Widget>[
                      Text("人员状态：", style: CustomConstant.normalTextBlack),
                      Text(snapshot.data.personStateText == null ? "无" : snapshot.data.personStateText.toString(), style: CustomConstant.normalTextBlack),
                    ]
                  ),
                  TableRow(
                    children: <Widget>[
                      Text("备用联系人：", style: CustomConstant.normalTextBlack),
                      Text(snapshot.data.buckupContactPerson == null ? "无" : snapshot.data.buckupContactPerson.toString(), style: CustomConstant.normalTextBlack)
                    ]
                  ),
                  TableRow(
                      children: <Widget>[
                        Text("备用联系地址：", style: CustomConstant.normalTextBlack),
                        Text(snapshot.data.buckupContactPersonAddress == null ? "无" : snapshot.data.buckupContactPersonAddress.toString(), style: CustomConstant.normalTextBlack)
                      ]
                  ),
                  TableRow(
                      children: <Widget>[
                        Text("备用联系方式：", style: CustomConstant.normalTextBlack),
                        Text(snapshot.data.buckupContactPersonPhone == null ? "无" : snapshot.data.buckupContactPersonPhone.toString(), style: CustomConstant.normalTextBlack)
                      ]
                  ),
                  TableRow(
                      children: <Widget>[
                        Text("驾驶证号：", style: CustomConstant.normalTextBlack),
                        Text(snapshot.data.driverLicenseID == null ? "无" : snapshot.data.driverLicenseID.toString(), style: CustomConstant.normalTextBlack)
                      ]
                  ),
                  TableRow(
                      children: <Widget>[
                        Text("驾驶证到期日期：", style: CustomConstant.normalTextBlack),
                        Text(snapshot.data.dlCertificateEndDate == null ? "0000-00-00" : snapshot.data.dlCertificateEndDate.toString().substring(0,10), style: CustomConstant.normalTextBlack)
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
  ///************************************************************
}