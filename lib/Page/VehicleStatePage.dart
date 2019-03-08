
import 'package:flutter/material.dart';
import 'package:flutter_app123456/common/config/Config.dart';
import 'package:flutter_app123456/common/dao/DriverDao.dart';
import 'package:flutter_app123456/common/dao/UserDao.dart';
import 'package:flutter_app123456/common/local/LocalStorage.dart';
import 'package:flutter_app123456/common/model/Driver.dart';
import 'package:flutter_app123456/common/style/CustomStyle.dart';
import 'package:flutter_app123456/common/utils/CommonUtils.dart';

class VehicleStatePage extends StatefulWidget{
  static final String name = "userInfo";



  VehicleStatePage({Key key}) : super(key: key);

  @override
  _VehicleStatePageState createState() => _VehicleStatePageState();
}

class _VehicleStatePageState extends State<VehicleStatePage>{


  _VehicleStatePageState();

  ///*********************异步获取数据进行页面显示****************************
  Future<String> str;


  Future<String> fetchData() async {
    return await LocalStorage.get(Config.DRIVER_ARCHIVES);
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    str = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    //super.build(context);
    //return new StoreBuilder<CustomState>(
    //  builder: (context, store) {
    return new Scaffold(
      body: new Center(
        child: FutureBuilder<String>(
          future: str,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data);
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