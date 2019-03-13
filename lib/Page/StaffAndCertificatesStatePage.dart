
import 'package:flutter/material.dart';
import 'package:flutter_app123456/common/config/Config.dart';
import 'package:flutter_app123456/common/dao/DriverDao.dart';
import 'package:flutter_app123456/common/dao/UserDao.dart';
import 'package:flutter_app123456/common/local/LocalStorage.dart';
import 'package:flutter_app123456/common/model/Driver.dart';
import 'package:flutter_app123456/common/model/StaffAndCertificatesState.dart';
import 'package:flutter_app123456/common/style/CustomStyle.dart';
import 'package:flutter_app123456/common/utils/CommonUtils.dart';

class StaffAndCertificatesStatePage extends StatefulWidget{
  static final String name = "StaffAndCertificatesState";



  StaffAndCertificatesStatePage({Key key}) : super(key: key);

  @override
  _StaffAndCertificatesStatePageState createState() => _StaffAndCertificatesStatePageState();
}

class _StaffAndCertificatesStatePageState extends State<StaffAndCertificatesStatePage>{


  _StaffAndCertificatesStatePageState();

  ///*********************异步获取数据进行页面显示****************************
  Future<StaffAndCertificatesState> staffAndCertificatesState;


  Future<StaffAndCertificatesState> fetchData() async {
    return await LocalStorage.get(Config.STAFF_AND_CERTIFICATES_STATE);
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    staffAndCertificatesState = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    //super.build(context);
    //return new StoreBuilder<CustomState>(
    //  builder: (context, store) {
    return new Scaffold(
      body: new Center(
        child: FutureBuilder<StaffAndCertificatesState>(
          future: staffAndCertificatesState,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data.VehicleStateFlag.toString());
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
    //    },
    //  );
  }
///************************************************************





}