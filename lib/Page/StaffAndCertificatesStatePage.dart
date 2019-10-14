import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app123456/common/config/Config.dart';
import 'package:flutter_app123456/common/dao/StaffAndCertificatesStateDao.dart';
import 'package:flutter_app123456/common/local/LocalStorage.dart';
import 'package:flutter_app123456/common/model/StaffAndCertificatesState.dart';
import 'package:flutter_app123456/common/style/CustomStyle.dart';
import 'package:flutter_app123456/widget/CustomErrorReturnWidget.dart';
import 'package:flutter_app123456/widget/CustomTableRowWidget.dart';

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
    var staffList;// = await LocalStorage.get(Config.STAFF_AND_CERTIFICATES_STATE);
    if (staffList == null) {
      var staffs =
          await StaffAndCertificatesStateDao.getStaffAndCertificatesStateInfo();
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
          title: new Text("人员及证照状态",
              style: TextStyle(fontSize: 18.0, color: Colors.black)),
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 10.0),
          child: Container(
            child: FutureBuilder<List<StaffAndCertificatesState>>(
              future: staffAndCertificatesStateList,
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

  _getItem(StaffAndCertificatesState subject) {
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
                    : subject.businessType.toString(),
              ),
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
                "车务状态：",
                subject.vehicleAffairsStatusText == null
                    ? "无"
                    : subject.vehicleAffairsStatusText.toString(),
              ),
            ]),
            TableRow(children: <Widget>[
              CustomTableRowWidget(
                "车务类型：",
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
