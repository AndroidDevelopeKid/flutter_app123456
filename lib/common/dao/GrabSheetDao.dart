
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_app123456/common/config/Config.dart';
import 'package:flutter_app123456/common/dao/ResultDao.dart';
import 'package:flutter_app123456/common/local/LocalStorage.dart';
import 'package:flutter_app123456/common/net/Address.dart';
import 'package:flutter_app123456/common/net/HttpApi.dart';

class GrabSheetDao{
  ///自动接单开关接口
  static autoGrabSheetSwitch(state)async{
    Map requestParams = {
      "state": state,
    };
    var res = await HttpManager.netFetch(Address.driverAutoGrabSheetSwitch(), json.encode(requestParams), null, new Options(method: 'post'));
    if(Config.DEBUG){
      print("autoGrabSheetSwitch res: " + res.toString());
    }

    return new DataResult(res.data, res.result);
  }
  ///司机接单排队
  static driverGrabSheetQueue() async{
    var res = await HttpManager.netFetch(Address.driverGrabSheetQueue(), null, null, new Options(method: 'post'));
    if(Config.DEBUG){
      print("driverGrabSheetQueue res: " + res.toString());
    }
  }
  ///取消排队
  static cancelQueue() async{
    var res = await HttpManager.netFetch(Address.cancelQueue(), null, null, new Options(method: 'post'));
    if(Config.DEBUG){
      print("cancelQueue res: " + res.toString());
    }
  }
  ///获取当前排队信息
  static getCurrentQueueInfo() async {
    var res = await HttpManager.netFetch(Address.getCurrentQueueInfo(), null, null, null);
    if(Config.DEBUG){
      print("getCurrentQueueInfo res: " + res.toString());
    }
  }
}