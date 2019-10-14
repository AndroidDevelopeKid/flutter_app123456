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
import 'package:flutter_app123456/widget/CustomErrorReturnWidget.dart';
import 'package:flutter_app123456/widget/CustomTableRowWidget.dart';

class UserInfoPage extends StatefulWidget {
  static final String name = "userInfo";

  UserInfoPage({Key key}) : super(key: key);

  @override
  _UserInfoPageState createState() => _UserInfoPageState();
}

class _UserInfoPageState extends State<UserInfoPage> {
  _UserInfoPageState();

  ///*********************异步获取数据进行页面显示****************************
  Future<Driver> driver;

  Future<Driver> fetchData() async {
    var driverArchives;//await LocalStorage.get(Config.DRIVER_ARCHIVES);
    if (driverArchives == null) {
      var resultDataDriver = await UserDao.getUserInfo();
      if (resultDataDriver.data == null) {
        var dataNull = new Driver(null, null, null, null, null, null, null,
            null, null, null, null, null, null);
        return dataNull;
      } else {
        return resultDataDriver.data;
      }
    } else {
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
        title: Text("人员档案",
            style: TextStyle(fontSize: 18.0, color: Colors.black)),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 10.0),
        child: Container(
          child: FutureBuilder<Driver>(
            future: driver,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Padding(
                  padding: EdgeInsets.only(
                      top: 15.0, left: 25.0, right: 25.0, bottom: 15.0),
                  child: Table(
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    children: <TableRow>[
                      TableRow(children: <Widget>[
                        CustomTableRowWidget(
                            "身份证号",
                            snapshot.data.driverIDNumber == null
                                ? "无"
                                : snapshot.data.driverIDNumber.toString())
                      ]),
                      TableRow(children: <Widget>[
                        CustomTableRowWidget(
                            "姓名",
                            snapshot.data.driverName == null
                                ? "无"
                                : snapshot.data.driverName.toString())
                      ]),
                      TableRow(children: <Widget>[
                        CustomTableRowWidget(
                          "电话号码",
                          snapshot.data.driverPhone == null
                              ? "无"
                              : snapshot.data.driverPhone.toString(),
                        ),
                      ]),
                      TableRow(children: <Widget>[
                        CustomTableRowWidget(
                          "所属物流公司",
                          snapshot.data.ouDisplayName == null
                              ? "无"
                              : snapshot.data.ouDisplayName.toString(),
                        ),
                      ]),
                      TableRow(children: <Widget>[
                        CustomTableRowWidget(
                          "人员类型",
                          snapshot.data.personTypeText == null
                              ? "无"
                              : snapshot.data.personTypeText.toString(),
                        ),
                      ]),
                      TableRow(children: <Widget>[
                        CustomTableRowWidget(
                          "车辆编号",
                          snapshot.data.vehicleCode == null
                              ? "无"
                              : snapshot.data.vehicleCode.toString(),
                        ),
                      ]),
                      TableRow(children: <Widget>[
                        CustomTableRowWidget(
                          "身份证到期日期",
                          snapshot.data.certificateEndDate == null
                              ? "无"
                              : snapshot.data.certificateEndDate
                                  .toString()
                                  .substring(0, 10),
                        ),
                      ]),
                      TableRow(children: <Widget>[
                        CustomTableRowWidget(
                          "人员状态",
                          snapshot.data.personStateText == null
                              ? "无"
                              : snapshot.data.personStateText.toString(),
                        ),
                      ]),
                      TableRow(children: <Widget>[
                        CustomTableRowWidget(
                          "备用联系人",
                          snapshot.data.buckupContactPerson == null
                              ? "无"
                              : snapshot.data.buckupContactPerson.toString(),
                        ),
                      ]),
                      TableRow(children: <Widget>[
                        CustomTableRowWidget(
                          "备用联系地址",
                          snapshot.data.buckupContactPersonAddress == null
                              ? "无"
                              : snapshot.data.buckupContactPersonAddress
                                  .toString(),
                        ),
                      ]),
                      TableRow(children: <Widget>[
                        CustomTableRowWidget(
                          "备用联系方式",
                          snapshot.data.buckupContactPersonPhone == null
                              ? "无"
                              : snapshot.data.buckupContactPersonPhone
                                  .toString(),
                        ),
                      ]),
                      TableRow(children: <Widget>[
                        CustomTableRowWidget(
                          "驾驶证号",
                          snapshot.data.driverLicenseID == null
                              ? "无"
                              : snapshot.data.driverLicenseID.toString(),
                        ),
                      ]),
                      TableRow(children: <Widget>[
                        CustomTableRowWidget(
                          "驾驶证到期日期",
                          snapshot.data.dlCertificateEndDate == null
                              ? "无"
                              : snapshot.data.dlCertificateEndDate
                                  .toString()
                                  .substring(0, 10),
                        ),
                      ]),
                    ],
                  ),
                );
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
