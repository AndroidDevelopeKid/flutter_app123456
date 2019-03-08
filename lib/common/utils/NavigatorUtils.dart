

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app123456/Page/MessageDetailPage.dart';
import 'package:flutter_app123456/Page/StaffAndCertificatesStatePage.dart';
import 'package:flutter_app123456/Page/UserInfoPage.dart';
import 'package:flutter_app123456/Page/HomePage.dart';
import 'package:flutter_app123456/Page/LoginPage.dart';
import 'package:flutter_app123456/Page/VehicleArchivesPage.dart';
import 'package:flutter_app123456/Page/VehicleStatePage.dart';

///控制页面跳转逻辑
class NavigatorUtils{
  ///主页
  static goHome(BuildContext context){
    Navigator.pushReplacementNamed(context, HomePage.sName);
  }
  ///登录页
  static goLogin(BuildContext context){
    Navigator.pushReplacementNamed(context, LoginPage.sName);
  }
  ///显示人员档案，车辆档案，人员及证件状态，车辆状态页
  static goDisplayUserInfo(BuildContext context, String title){
    switch(title){
      case "人员档案":
        Navigator.push(context, new CupertinoPageRoute(builder: (context) => new UserInfoPage()));
        break;
      case "车辆档案":
        Navigator.push(context, new CupertinoPageRoute(builder: (context) => new VehicleArchivesPage()));
        break;
      case "人员及证件状态":
        Navigator.push(context, new CupertinoPageRoute(builder: (context) => new StaffAndCertificatesStatePage()));
        break;
      case "车辆状态":
        Navigator.push(context, new CupertinoPageRoute(builder: (context) => new VehicleStatePage()));
        break;
    }
  }
  static goDisplayMessageDetail(BuildContext context){
    Navigator.push(context, new CupertinoPageRoute(builder: (context) => new MessageDetailPage()));
  }
  ///通知页
//  static Future goNotifyPage(BuildContext context){
//    return Navigator.push(context, new CupertinoPageRoute(builder: (context) => new NotifyPage()));
//  }
}