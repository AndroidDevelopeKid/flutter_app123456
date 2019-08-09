
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
import 'package:qr_flutter/qr_flutter.dart';

class MyBarcodePage extends StatefulWidget{
  static final String name = "myBarcode";



  MyBarcodePage({Key key}) : super(key: key);

  @override
  _MyBarcodePageState createState() => _MyBarcodePageState();
}

class _MyBarcodePageState extends State<MyBarcodePage>{


  _MyBarcodePageState();

  ///*********************异步获取数据进行页面显示****************************
  Future<String> barcode;


  Future<String> fetchData() async {
    var myBarcode = await LocalStorage.get(Config.MY_BARCODE);
    if(myBarcode == null){
      var resultDataMyBarcode = await UserDao.getMyBarcode(Config.TENANT);
      return resultDataMyBarcode.data;

    }else{
      return myBarcode;
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
    //super.build(context);
    //return new StoreBuilder<CustomState>(
    //  builder: (context, store) {
    return new Scaffold(
      backgroundColor: CustomColors.listBackground,
      appBar: new AppBar(
        title: new Text("我的二维码名片"),
      ),
      body:new Center(
          child: new Card(
            color: Color(CustomColors.displayCardBackground),
            //margin: const EdgeInsets.only(left: 20.0, top: 30.0, right: 20.0, bottom: 30),
            margin: EdgeInsets.only(top: 6.0, bottom: 6.0, left: 4.0, right: 4.0),
            elevation: 8.0,
            child: new Container(
              child: FutureBuilder<String>(
                future: barcode,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return
                      new QrImage(data: snapshot.data == null ? "" : snapshot.data,size: 350.0, version: 9, errorCorrectionLevel: QrErrorCorrectLevel.H);
//                      new Container(
//                      child: new Column(
//
//                        children: <Widget>[
//                          new Text("二维码名片："),
//                          new QrImage(data: snapshot.data == null ? "" : snapshot.data,size: 350.0, version: 9, errorCorrectionLevel: QrErrorCorrectLevel.H),
//                        ],
//                        mainAxisAlignment: MainAxisAlignment.start,
//                      ),
//                    );
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
      ),

    );

  }
///************************************************************
}