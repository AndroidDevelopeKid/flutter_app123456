import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app123456/common/config/Config.dart';
import 'package:flutter_app123456/common/dao/DriverDao.dart';
import 'package:flutter_app123456/common/dao/StaffAndCertificatesStateDao.dart';
import 'package:flutter_app123456/common/dao/UserDao.dart';
import 'package:flutter_app123456/common/local/LocalStorage.dart';
import 'package:flutter_app123456/common/model/Driver.dart';
import 'package:flutter_app123456/common/model/StaffAndCertificatesState.dart';
import 'package:flutter_app123456/common/style/CustomStyle.dart';
import 'package:flutter_app123456/common/utils/CommonUtils.dart';

class StaffAndCertificatesStatePage extends StatefulWidget {
  static final String name = "StaffAndCertificatesState";

  StaffAndCertificatesStatePage({Key key}) : super(key: key);

  @override
  _StaffAndCertificatesStatePageState createState() =>
      _StaffAndCertificatesStatePageState();
}

class _StaffAndCertificatesStatePageState
    extends State<StaffAndCertificatesStatePage> {
  _StaffAndCertificatesStatePageState();

  ///*********************异步获取数据进行页面显示****************************
  Future<List<StaffAndCertificatesState>> staffAndCertificatesStateList;

  Future<List<StaffAndCertificatesState>> fetchData() async {
    var staffList = await LocalStorage.get(Config.STAFF_AND_CERTIFICATES_STATE);
    if(staffList == null){
      var userId = await LocalStorage.get(Config.USER_ID);
      var staffs = await StaffAndCertificatesStateDao.getStaffAndCertificatesStateInfo(Config.TENANT, userId);
      staffList = staffs.data;
    }
    if (staffList != null) {
      List<dynamic> list = json.decode(staffList);
      print("list of staffList::" + list.toString());
      List<StaffAndCertificatesState> listReturn =
          new List<StaffAndCertificatesState>();
      for (int i = 0; i < list.length; i++) {
        listReturn.add(StaffAndCertificatesState.fromJson(list[i]));
      }
      return listReturn;
    } else {
      return null;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    staffAndCertificatesStateList = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    //super.build(context);
    //return new StoreBuilder<CustomState>(
    //  builder: (context, store) {
    return new Scaffold(
      backgroundColor: CustomColors.listBackground,
      appBar: new AppBar(
        title: new Text("人员及证件状态"),
      ),
      body: new Container(
        child: FutureBuilder<List<StaffAndCertificatesState>>(
          future: staffAndCertificatesStateList,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return new ListView.builder(
                  padding: EdgeInsets.all(6.0),
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int position) {
                    return _getItem(snapshot.data[position]);
                  });
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }

  _getItem(StaffAndCertificatesState subject) {
    return new Card(
      color: Color(CustomColors.displayCardBackground),
      margin: EdgeInsets.only(top: 6.0, bottom: 6.0, left: 4.0, right: 4.0),
      elevation: 8.0,
      child: new Container(
        child: new Table(
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          //border: TableBorder.all(color: Color(CustomColors.tableBorderColor), width: 2.0, style: BorderStyle.solid),
          children: <TableRow>[
            TableRow(children: <Widget>[
              Text("业务类型：", style: CustomConstant.normalTextBlue),
              Text(subject.businessType == null ? "无" : subject.businessType.toString(), style: CustomConstant.normalTextBlack),
            ]),
            TableRow(children: <Widget>[
              Text("车辆编号：", style: CustomConstant.normalTextBlue),
              Text(subject.vehicleCode == null ? "无" : subject.vehicleCode.toString(), style: CustomConstant.normalTextBlack),
            ]),
            TableRow(children: <Widget>[
              Text("车务状态：", style: CustomConstant.normalTextBlue),
              Text(subject.vehicleAffairsStatusText == null ? "无" : subject.vehicleAffairsStatusText.toString(), style: CustomConstant.normalTextBlack),
            ]),
            TableRow(children: <Widget>[
              Text("车务类型：", style: CustomConstant.normalTextBlue),
              Text(subject.vehicleAffairsTypeText == null ? "无" : subject.vehicleAffairsTypeText.toString(), style: CustomConstant.normalTextBlack),
            ]),
            TableRow(children: <Widget>[
              Text("办理类型：", style: CustomConstant.normalTextBlue),
              Text(subject.handleType == null ? "无" : subject.handleType.toString(), style: CustomConstant.normalTextBlack),
            ]),
            TableRow(children: <Widget>[
              Text("办理状态：", style: CustomConstant.normalTextBlue),
              Text(subject.handleStatusText == null ? "无" : subject.handleStatusText.toString(), style: CustomConstant.normalTextBlack),
            ]),
            TableRow(children: <Widget>[
              Text("状态标识：", style: CustomConstant.normalTextBlue),
              Text(subject.vehicleStateFlag == null ? "无" : subject.vehicleStateFlag.toString(), style: CustomConstant.normalTextBlack),
            ]),
            TableRow(children: <Widget>[
              Text("备注：", style: CustomConstant.normalTextBlue),
              Text(subject.description == null ? "无" : subject.description.toString(), style: CustomConstant.normalTextBlack, maxLines: 3,),
            ]),
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: CustomColors.listBackground,
            width: 0.7,
            style: BorderStyle.solid,
          ),
        ),
        padding:
            EdgeInsets.only(left: 10.0, right: 10.0, top: 12.0, bottom: 12.0),
      ),
    );
  }
}
