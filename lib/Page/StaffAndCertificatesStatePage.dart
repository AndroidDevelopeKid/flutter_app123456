
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
  Future<List<StaffAndCertificatesState>> staffAndCertificatesStateList;


  Future<List<StaffAndCertificatesState>> fetchData() async {
    var staffList = await LocalStorage.get(Config.STAFF_AND_CERTIFICATES_STATE);
    List<StaffAndCertificatesState> listObj = [];
    if(staffList != null){

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
      appBar: new AppBar(
        title: new Text("人员及证件状态"),
      ),
      body:
      new Card(
        color: Color(CustomColors.displayCardBackground),
        //margin: const EdgeInsets.only(left: 20.0, top: 30.0, right: 20.0, bottom: 30),
        margin: EdgeInsets.only(top: 6.0, bottom: 6.0, left: 4.0, right: 4.0),
        elevation: 8.0,
        child: new Container(
          child: FutureBuilder<List<StaffAndCertificatesState>>(
              future: staffAndCertificatesStateList,
              builder: (context, snapshot) {
                if(snapshot.hasData){
                  return new Text("staffAndCertificatesState");
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