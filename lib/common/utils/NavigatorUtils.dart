

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app123456/Page/BarCodeEnlargePage.dart';
import 'package:flutter_app123456/Page/CurrentAssignCustomerPage.dart';
import 'package:flutter_app123456/Page/FreightInquiryPage.dart';
import 'package:flutter_app123456/Page/HistoryBillPage.dart';
import 'package:flutter_app123456/Page/LastBillPage.dart';
import 'package:flutter_app123456/Page/MaintenanceFeeInquiryPage.dart';
import 'package:flutter_app123456/Page/MessageDetailPage.dart';
import 'package:flutter_app123456/Page/OtherCostInquiryPage.dart';
import 'package:flutter_app123456/Page/QueueInfoPage.dart';
import 'package:flutter_app123456/Page/RefuelInquiryPage.dart';
import 'package:flutter_app123456/Page/StaffAndCertificatesStatePage.dart';
import 'package:flutter_app123456/Page/TollInquiryPage.dart';
import 'package:flutter_app123456/Page/UserInfoPage.dart';
import 'package:flutter_app123456/Page/HomePage.dart';
import 'package:flutter_app123456/Page/LoginPage.dart';
import 'package:flutter_app123456/Page/VehicleArchivesPage.dart';
import 'package:flutter_app123456/Page/VehicleStatePage.dart';
import 'package:flutter_app123456/widget/MessageItem.dart';
import 'package:qr_flutter/qr_flutter.dart';

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
  ///历史提货单
  static goHistoryBill(BuildContext context){
    Navigator.push(context, new CupertinoPageRoute(builder: (context) => new HistoryBillPage()));
  }
  ///运费查询
  static goFreightInquiry(BuildContext context){
    Navigator.push(context, new CupertinoPageRoute(builder: (context) => new FreightInquiryPage()));
  }
  ///加油查询
  static goRefuelInquiry(BuildContext context){
    Navigator.push(context, new CupertinoPageRoute(builder: (context) => new RefuelInquiryPage()));
  }
  ///过路费查询
  static goTollInquiry(BuildContext context){
    Navigator.push(context, new CupertinoPageRoute(builder: (context) => new TollInquiryPage()));
  }
  ///维修费查询
  static goMaintenanceFeeInquiry(BuildContext context){
    Navigator.push(context, new CupertinoPageRoute(builder: (context) => new MaintenanceFeeInquiryPage()));
  }
  ///其他费用查询
  static goOtherCostInquiry(BuildContext context){
    Navigator.push(context, new CupertinoPageRoute(builder: (context) => new OtherCostInquiryPage()));
  }
  ///当前指派客户
  static goCurrentAssignCustomer(BuildContext context){
    Navigator.push(context, new CupertinoPageRoute(builder: (context) => new CurrentAssignCustomerPage()));
  }
  ///放大二维码
  static goBarCodeEnlarge(BuildContext context, QrImage image){
    Navigator.push(context, new CupertinoPageRoute(builder: (context) => new BarCodeEnlargePage(image)));
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
  ///显示排队信息，最新提货单
  static goDisplayQueueInfo(BuildContext context, String title){
    switch(title){
      case "排队信息":
        Navigator.push(context, new CupertinoPageRoute(builder: (context) => new QueueInfoPage()));
        break;
      case "最新提货单":
        Navigator.push(context, new CupertinoPageRoute(builder: (context) => new LastBillPage()));
        break;

    }
  }


  static bool goDisplayMessageDetail(BuildContext context, MessageItemViewModel model){
    Navigator.push(context, new CupertinoPageRoute(builder: (context){
      return new MessageDetailPage(model);
    },
    ),).then((isRefresh){
      print("tiaozhuan shua xin: " + isRefresh.toString());
      return isRefresh;
    }
    );
  }
  ///通知页
//  static Future goNotifyPage(BuildContext context){
//    return Navigator.push(context, new CupertinoPageRoute(builder: (context) => new NotifyPage()));
//  }
}