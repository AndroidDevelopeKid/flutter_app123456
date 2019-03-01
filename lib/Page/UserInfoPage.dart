
import 'package:flutter/material.dart';
import 'package:flutter_app123456/common/dao/DriverDao.dart';
import 'package:flutter_app123456/common/model/Driver.dart';
import 'package:flutter_app123456/common/style/CustomStyle.dart';
import 'package:flutter_app123456/common/utils/CommonUtils.dart';

class UserInfoPage extends StatefulWidget{
  static final String name = "userInfo";

  final String title;

  final String userName;

  UserInfoPage(this.title, this.userName, {Key key}) : super(key: key);

  @override
  _UserInfoPageState createState() => _UserInfoPageState(title, userName);
}

class _UserInfoPageState extends State<UserInfoPage>{


  ///*********************测试异步获取数据进行页面显示****************************
  Future<Driver> driver;


  Future<Driver> fetchData() async {
    var res = await DriverDao.getDriverInfo();
    if (res != null && res.result) {
      Driver customer = Driver.fromJson(res.data['result']['items'][0]);
      return customer;
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
    //super.build(context);
    //return new StoreBuilder<CustomState>(
    //  builder: (context, store) {
    return new Scaffold(
      body: new Center(
        child: FutureBuilder<Driver>(
          future: driver,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data.name);
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





  final String title;

  final String userName;

  _UserInfoPageState(this.title, this.userName);
//
//
//  @override
//  Widget build(BuildContext context) {
//    return new Scaffold(
//        appBar: new AppBar(
//            title: new Text("数据显示"),
//            ),
//
//        body:
//
//        new Card(
//          color: Color(CustomColors.displayUsernameBackground),
//          margin: const EdgeInsets.only(left: 20.0, top: 60.0, right: 20.0, bottom: 60),
//          child: new Center(
//            child: new Text(
//              "显示对应的信息！",
//              style: CustomConstant.normalTextBlack,
//            ),
//          ),
//
//        ),
//    );
//  }
}