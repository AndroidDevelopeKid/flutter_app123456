import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_app123456/common/config/Config.dart';
import 'package:flutter_app123456/common/dao/ResultDao.dart';
import 'package:flutter_app123456/common/model/Customer.dart';
import 'package:flutter_app123456/common/net/Address.dart';
import 'package:flutter_app123456/common/net/HttpApi.dart';

class DriverDao {
  static getDriverInfo() async {


    var res;
    res = await HttpManager.netFetch(Address.getTestZFDriverInfo(),
        null, null, null);

    if (res != null && res.result) {
      if (Config.DEBUG) {
        print("driver info: " + res.result.toString());
      }
      return new DataResult(res.data, true);
    } else {
      return new DataResult(res.data, false);
    }
  }
}
