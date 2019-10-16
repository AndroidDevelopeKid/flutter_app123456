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
import 'package:qr_flutter/qr_flutter.dart';

class MyBarcodePage extends StatefulWidget {
  static final String name = "myBarcode";

  MyBarcodePage({Key key}) : super(key: key);

  @override
  _MyBarcodePageState createState() => _MyBarcodePageState();
}

class _MyBarcodePageState extends State<MyBarcodePage> {
  _MyBarcodePageState();

  ///*********************异步获取数据进行页面显示****************************
  Future<String> barcode;

  Future<String> fetchData() async {
    var resultDataMyBarcode = await UserDao.getMyBarcode();
    if (resultDataMyBarcode.data == null) {
      return "";
    } else {
      return resultDataMyBarcode.data;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    barcode = fetchData();
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
        title: Text("我的二维码名片",
            style: TextStyle(fontSize: 18.0, color: Colors.black)),
      ),
      body: Center(
        heightFactor: 1.1,
        child: Container(
          child: FutureBuilder<String>(
            future: barcode,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return
                      QrImage(
                            data: snapshot.data == null ? "" : snapshot.data,
                            size: 350.0,
                            version: 9,
                            errorCorrectionLevel: QrErrorCorrectLevel.H);

              } else if (snapshot.hasError) {
                return CustomErrorReturnWidget();
              }
              return SizedBox(height: 2.0, child: LinearProgressIndicator());
            },
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2.0),
            border: Border.all(
              color: Color(0xffE2ECFF),
              width: 1.0,
              style: BorderStyle.solid,
            ),
          ),
        ),
      ),
    );
  }
}
