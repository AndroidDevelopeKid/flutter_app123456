
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_app123456/common/config/Config.dart';
import 'package:flutter_app123456/common/dao/ResultDao.dart';
import 'package:flutter_app123456/common/local/LocalStorage.dart';
import 'package:flutter_app123456/common/model/Queue.dart';
import 'package:flutter_app123456/common/net/Address.dart';
import 'package:flutter_app123456/common/net/HttpApi.dart';

class GrabSheetDao{
  static driverAutoGrabSheetSwitch(state) async {
      Map requestParams = {
        "state" : state
      };
      var res = await HttpManager.netFetch(Address.driverAutoGrabSheetSwitch(), json.encode(requestParams), null, new Options(method: 'post'));
      if(Config.DEBUG){
        print("driverAutoGrabSheetSwitch res: " + res.toString() + "---" + res.result.toString() + "---");
      }
      if(res != null && res.result){
        return DataResult(res.data, res.result);
      }else{
        return DataResult("", false);
      }
  }
  static driverGrabSheetQueue() async {
      var res = await HttpManager.netFetch(Address.driverGrabSheetQueue(), null, null, new Options(method: 'post'));
      if(Config.DEBUG){
        print("driverGrabSheetQueue res: " + res.toString() + "---" + res.result.toString() + "---");
      }
      if(res != null && res.result){
        return DataResult(res.data, res.result);

      }else{
        return DataResult("", false);
      }

  }
  static cancelQueue() async{
      var res = await HttpManager.netFetch(Address.cancelQueue(), null, null, new Options(method: 'post'));
      if(Config.DEBUG){
        print("cancelQueue res: " + res.toString() + "---" + res.result.toString() + "---");
      }
      if(res != null && res.result){
        return DataResult(res.data, res.result);
      }else{
        return DataResult("", false);
      }
  }
  static getCurrentQueueInfo() async{
      var res = await HttpManager.netFetch(Address.getCurrentQueueInfo(), null, null, null);
      if(Config.DEBUG){
        print("getCurrentQueueInfo res: " + res.toString() + "---" + res.result.toString() + "---");
      }
      if(res != null && res.result){
        Queue queue = Queue.fromJson(res.data["result"]);
        LocalStorage.save(Config.QUEUE_INFO, json.encode(queue.toJson()));
        return DataResult(res.data, res.result);
      }else{
        return DataResult("", false);
      }
  }
}