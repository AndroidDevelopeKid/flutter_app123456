

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app123456/Page/MessageDetailPage.dart';
import 'package:flutter_app123456/Page/UserInfoPage.dart';
import 'package:flutter_app123456/Page/HomePage.dart';
import 'package:flutter_app123456/Page/LoginPage.dart';

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
  ///显示司机档案，车辆信息，车务状态，调度指派页
  static goDisplayUserInfo(BuildContext context, String title, String userName){
    Navigator.push(context, new CupertinoPageRoute(builder: (context) => new UserInfoPage(title, userName)));
  }
  static goDisplayMessageDetail(BuildContext context){
    Navigator.push(context, new CupertinoPageRoute(builder: (context) => new MessageDetailPage()));
  }
  ///通知页
//  static Future goNotifyPage(BuildContext context){
//    return Navigator.push(context, new CupertinoPageRoute(builder: (context) => new NotifyPage()));
//  }
}