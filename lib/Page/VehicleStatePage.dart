
import 'package:flutter/material.dart';
import 'package:flutter_app123456/common/config/Config.dart';
import 'package:flutter_app123456/common/dao/DriverDao.dart';
import 'package:flutter_app123456/common/dao/UserDao.dart';
import 'package:flutter_app123456/common/local/LocalStorage.dart';
import 'package:flutter_app123456/common/model/Driver.dart';
import 'package:flutter_app123456/common/model/VehicleState.dart';
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
  Future<List<VehicleState>> vehicleStateList;


  Future<List<VehicleState>> fetchData() async {
    return await LocalStorage.get(Config.VEHICLE_STATE);
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    vehicleStateList = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    //super.build(context);
    //return new StoreBuilder<CustomState>(
    //  builder: (context, store) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("车辆状态"),
        ),
        body: new Card(
          color: Color(CustomColors.displayCardBackground),
          //margin: const EdgeInsets.only(left: 20.0, top: 30.0, right: 20.0, bottom: 30),
          margin: EdgeInsets.only(top: 6.0, bottom: 6.0, left: 4.0, right: 4.0),
          elevation: 8.0,
          child: new Container(
            child: FutureBuilder<List<VehicleState>>(
              future: vehicleStateList,
              builder: (context, snapshot) {
                if(snapshot.hasData){
                  return new Text("vehicleState");
                }else if(snapshot.hasError){
                  return Text("${snapshot.error}");
                }
                return CircularProgressIndicator();
              },
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(
                color: Colors.white,
                width: 0.7,
                style: BorderStyle.solid,
              ),
            ),
            padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 12.0, bottom: 12.0),
          ),
        )
    );
    //    },
    //  );
  }
///************************************************************





}