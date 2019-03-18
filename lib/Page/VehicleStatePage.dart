
import 'dart:convert';

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
  static final String name = "vehicleState";



  VehicleStatePage({Key key}) : super(key: key);

  @override
  _VehicleStatePageState createState() => _VehicleStatePageState();
}

class _VehicleStatePageState extends State<VehicleStatePage>{


  _VehicleStatePageState();

  ///*********************异步获取数据进行页面显示****************************
  Future<List<VehicleState>> vehicleStateList;


  Future<List<VehicleState>> fetchData() async {
    var vehicleStateList = await LocalStorage.get(Config.VEHICLE_STATE);
    if (vehicleStateList != null) {
      List<dynamic> list = json.decode(vehicleStateList);
      print("list of vehicleStateList::" + list.toString());
      List<VehicleState> listReturn =
      new List<VehicleState>();
      for (int i = 0; i < list.length; i++) {
        listReturn.add(VehicleState.fromJson(list[i]));
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
      body: new Container(
        child: FutureBuilder<List<VehicleState>>(
          future: vehicleStateList,
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
    //    },
    //  );
  }
  _getItem(VehicleState subject) {
    return new Card(
      color: Color(CustomColors.displayCardBackground),
      margin: EdgeInsets.only(top: 6.0, bottom: 6.0, left: 4.0, right: 4.0),
      elevation: 8.0,
      child: new Container(
        child: new Table(
          border: TableBorder.all(
              color: Colors.white, width: 2.0, style: BorderStyle.solid),
          children: <TableRow>[
            TableRow(children: <Widget>[
              Text("业务类型：", style: CustomConstant.normalTextBlack),
              Text(subject.businessType == null ? "空" : subject.businessType.toString(), style: CustomConstant.normalTextBlack),
            ]),
            TableRow(children: <Widget>[
              Text("车辆编号：", style: CustomConstant.normalTextBlack),
              Text(subject.vehicleCode == null ? "空" : subject.vehicleCode.toString(), style: CustomConstant.normalTextBlack),
            ]),
            TableRow(children: <Widget>[
              Text("车务状态：", style: CustomConstant.normalTextBlack),
              Text(subject.vehicleAffairsStatusText == null ? "空" : subject.vehicleAffairsStatusText.toString(), style: CustomConstant.normalTextBlack),
            ]),
            TableRow(children: <Widget>[
              Text("车务类型：", style: CustomConstant.normalTextBlack),
              Text(subject.vehicleAffairsTypeText == null ? "空" : subject.vehicleAffairsTypeText.toString(), style: CustomConstant.normalTextBlack),
            ]),
            TableRow(children: <Widget>[
              Text("办理类型：", style: CustomConstant.normalTextBlack),
              Text(subject.handleType == null ? "空" : subject.handleType.toString(), style: CustomConstant.normalTextBlack),
            ]),
            TableRow(children: <Widget>[
              Text("办理状态：", style: CustomConstant.normalTextBlack),
              Text(subject.handleStatusText == null ? "空" : subject.handleStatusText.toString(), style: CustomConstant.normalTextBlack),
            ]),
            TableRow(children: <Widget>[
              Text("状态标识：", style: CustomConstant.normalTextBlack),
              Text(subject.vehicleStateFlag == null ? "空" : subject.vehicleStateFlag.toString(), style: CustomConstant.normalTextBlack),
            ]),
            TableRow(children: <Widget>[
              Text("备注：", style: CustomConstant.normalTextBlack),
              Text(subject.description == null ? "空" : subject.description.toString(), style: CustomConstant.normalTextBlack, maxLines: 3,),
            ]),
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: Colors.white,
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