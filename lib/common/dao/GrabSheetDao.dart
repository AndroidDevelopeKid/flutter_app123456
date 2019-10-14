import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_app123456/common/config/Config.dart';
import 'package:flutter_app123456/common/dao/ResultDao.dart';
import 'package:flutter_app123456/common/local/LocalStorage.dart';
import 'package:flutter_app123456/common/model/Queue.dart';
import 'package:flutter_app123456/common/net/Address.dart';
import 'package:flutter_app123456/common/net/HttpApi.dart';

import 'UserDao.dart';

class GrabSheetDao {
  //自动接单
  static driverAutoGrabSheetSwitch(state) async {
    var s;
    if (state == true) {
      s = 1;
    } else {
      s = 2;
    }

    Map requestParams = {"state": s};
    var res;
    res = await HttpManager.netFetch(Address.driverAutoGrabSheetSwitch(),
        json.encode(requestParams), null, new Options(method: 'post'));
    if (res.code == Config.ERROR_CODE401 || res.code == Config.ERROR_CODE403) {
      await UserDao.refreshToken();
      res = await HttpManager.netFetch(Address.driverAutoGrabSheetSwitch(),
          json.encode(requestParams), null, new Options(method: 'post'));
    }
    if (Config.DEBUG) {
      print("driverAutoGrabSheetSwitch res: " +
          res.toString() +
          "---" +
          res.result.toString() +
          "---");
    }
    if (res != null && res.result) {
      return DataResult(res.data, res.result, res.code);
    } else {
      return DataResult(res.data, false, res.code);
    }
  }

  //排队信息
  static driverGrabSheetQueue() async {
    var res;
    res = await HttpManager.netFetch(Address.driverGrabSheetQueue(), null, null,
        new Options(method: 'post'));
    if (res.code == Config.ERROR_CODE401 || res.code == Config.ERROR_CODE403) {
      await UserDao.refreshToken();
      res = await HttpManager.netFetch(Address.driverGrabSheetQueue(), null,
          null, new Options(method: 'post'));
    }
    if (Config.DEBUG) {
      print("driverGrabSheetQueue res: " +
          res.toString() +
          "---" +
          res.result.toString() +
          "---");
    }
    if (res != null && res.result) {
      return DataResult(res.data, res.result, res.code);
    } else {
      return DataResult(res.data, false, res.code);
    }
  }

  //取消排队
  static cancelQueue() async {
    var res;
    res = await HttpManager.netFetch(
        Address.cancelQueue(), null, null, new Options(method: 'post'));
    if (res.code == Config.ERROR_CODE401 || res.code == Config.ERROR_CODE403) {
      await UserDao.refreshToken();
      res = await HttpManager.netFetch(
          Address.cancelQueue(), null, null, new Options(method: 'post'));
    }
    if (Config.DEBUG) {
      print("cancelQueue res: " +
          res.toString() +
          "---" +
          res.result.toString() +
          "---");
    }
    if (res != null && res.result) {
      await LocalStorage.remove(Config.QUEUE_INFO);
      return DataResult(res.data, res.result, res.code);
    } else {
      return DataResult(res.data, false, res.code);
    }
  }

  //当前提货单
  static getCurrentQueueInfo() async {
    var res;
    res = await HttpManager.netFetch(
        Address.getCurrentQueueInfo(), null, null, null);
    if (res.code == Config.ERROR_CODE401 || res.code == Config.ERROR_CODE403) {
      await UserDao.refreshToken();
      res = await HttpManager.netFetch(
          Address.getCurrentQueueInfo(), null, null, null);
    }
    if (Config.DEBUG) {
      print("getCurrentQueueInfo res: " +
          res.toString() +
          "---" +
          res.result.toString() +
          "---");
    }
    if (res != null && res.result) {
      await LocalStorage.remove(Config.QUEUE_INFO);
      Queue queue = Queue.fromJson(res.data["result"]);
      await LocalStorage.save(Config.QUEUE_INFO, json.encode(queue.toJson()));
      return DataResult(res.data, res.result, res.code);
    } else {
      return DataResult(res.data, false, res.code);
    }
  }

  //登录进入后获取上次状态
  static getAutoAcceptOrderState() async {
    var res;
    res = await HttpManager.netFetch(
        Address.getQueueAndAutoAcceptOrderState(), null, null, null);
    if (res.code == Config.ERROR_CODE401 || res.code == Config.ERROR_CODE403) {
      await UserDao.refreshToken();
      res = await HttpManager.netFetch(
          Address.getQueueAndAutoAcceptOrderState(), null, null, null);
    }
    if (Config.DEBUG) {
      print("queueAndAutoAcceptOrderState res: " +
          res.toString() +
          "---" +
          res.result.toString() +
          "---" +
          res.code.toString()
      );
    }
    if (res != null && res.result) {
      return DataResult(res.data, res.result, res.code);
    } else {
      return DataResult(res.data, false, res.code);
    }
  }
}
