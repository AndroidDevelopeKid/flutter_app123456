
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
  static final String name = "userInfo";



  VehicleArchivesPage({Key key}) : super(key: key);

  @override
  _VehicleArchivesPageState createState() => _VehicleArchivesPageState();
}

class _VehicleArchivesPageState extends State<VehicleArchivesPage>{


  _VehicleArchivesPageState();

  ///*********************异步获取数据进行页面显示****************************
  Future<Vehicle> vehicleObj;


  Future<Vehicle> fetchData() async {
    return await LocalStorage.get(Config.DRIVER_ARCHIVES);
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
      body: new Center(
        child: FutureBuilder<Vehicle>(
          future: vehicleObj,
          builder: (context, snapshot) {
            if (snapshot.hasData) {

              return Text(snapshot.data.vehicleCode);
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