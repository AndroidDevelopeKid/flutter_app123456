
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_app123456/common/config/Config.dart';
import 'package:flutter_app123456/common/dao/ResultDao.dart';
import 'package:flutter_app123456/common/net/Address.dart';
import 'package:flutter_app123456/common/net/HttpApi.dart';

class NoticeDao{
  static getPagedUserNotifications() async {
    // + "?State=null&MaxResultCount=${Config.PAGE_SIZE}&SkipCount=0"
    var res = await HttpManager.netFetch(Address.getPagedUserNotifications(), null, null, null);
    if(Config.DEBUG){
      print("getPagedUserNotifications res: " + res.toString() + "---" + res.result.toString() + "---");
    }
    if(res != null && res.result){
      return DataResult(res.data, res.result);
    }else{
      return DataResult("没有新的通知", false);
    }
  }
  static makeAllUserNotificationsAsRead() async {
    var res = await HttpManager.netFetch(Address.makeAllUserNotificationsAsRead(), null, null, new Options(method: 'post'));
    if(Config.DEBUG){
      print("makeAllUserNotificationsAsRead res: " + res.toString() + "---" + res.result.toString() + "---");
    }
    if(res != null && res.result){
      return DataResult(res.data, res.result);
    }else{
      return DataResult("", false);
    }
  }
  static makeNotificationAsRead(notificationId) async {
    Map requestParams = {
      "id":notificationId
    };
    var res = await HttpManager.netFetch(Address.makeNotificationAsRead(), json.encode(requestParams), null, new Options(method: 'post'));
    if(Config.DEBUG){
      print("makeNotificationAsRead res: " + res.toString() + "---" + res.result.toString() + "---");
    }
    if(res != null && res.result){
      return DataResult(res.data, res.result);
    }else{
      return DataResult("", false);
    }
  }
}