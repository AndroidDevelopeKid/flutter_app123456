

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app123456/Page/BarCodeEnlargePage.dart';
import 'package:flutter_app123456/Page/CompanyPage.dart';
import 'package:flutter_app123456/Page/CurrentAssignCustomerPage.dart';
import 'package:flutter_app123456/Page/FreightInquiryPage.dart';
import 'package:flutter_app123456/Page/HistoryBillPage.dart';
import 'package:flutter_app123456/Page/LastBillPage.dart';
import 'package:flutter_app123456/Page/MaintenanceFeeInquiryPage.dart';
import 'package:flutter_app123456/Page/MessageDetailPage.dart';
import 'package:flutter_app123456/Page/MyBarcodePage.dart';
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
  ///显示车辆状态
  static goDisplayVehicleState(BuildContext context){
    Navigator.push(context, new CupertinoPageRoute(builder: (context) => new VehicleStatePage()));
  }
  ///显示人员及证件状态
  static goDisplayUserState(BuildContext context){
    Navigator.push(context, new CupertinoPageRoute(builder: (context) => new StaffAndCertificatesStatePage()));
  }
  ///显示车辆档案
  static goDisplayVehicleFile(BuildContext context){
    Navigator.push(context, new CupertinoPageRoute(builder: (context) => new VehicleArchivesPage()));
  }
  ///显示人员档案
  static goDisplayUserFile(BuildContext context){
    Navigator.push(context, new CupertinoPageRoute(builder: (context) => new UserInfoPage()));
  }
  ///显示我的二维码名片
  static goDisplayMyBarcode(BuildContext context){
    Navigator.push(context, new CupertinoPageRoute(builder: (context) => new MyBarcodePage()));
  }
  ///显示排队信息
  static goDisplayQueueInfo(BuildContext context){
    Navigator.push(context, new CupertinoPageRoute(builder: (context) => new QueueInfoPage()));
  }
  ///显示最新提货单
  static goDisplayLastedBill(BuildContext context){
    Navigator.push(context, new CupertinoPageRoute(builder: (context) => new LastBillPage()));
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
  ///返回上一页，不带参数
  static void goBackWithNoParams(BuildContext context){
     Navigator.pop(context);
  }
  ///返回上一页，带参数
  static T goBackWithParams<T>(BuildContext context, T params){
    Navigator.pop(context, params);
    return params;

  }

}