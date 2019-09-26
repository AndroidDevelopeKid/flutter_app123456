import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_app123456/common/config/Config.dart';
import 'package:flutter_app123456/common/dao/ResultDao.dart';
import 'package:flutter_app123456/common/model/Customer.dart';
import 'package:flutter_app123456/common/net/Address.dart';
import 'package:flutter_app123456/common/net/HttpApi.dart';

import 'UserDao.dart';

class CustomerDao {
  static getCustomerList(type) async {
    Map requestParams = {
      "type": type,
    };

    var res;
    res = await HttpManager.netFetch(Address.getDriverArchives(),
        json.encode(requestParams), null, new Options(method: 'post'));
    if(res.code == 403){
      await UserDao.refreshToken();
      res = await HttpManager.netFetch(Address.getDriverArchives(),
          json.encode(requestParams), null, new Options(method: 'post'));
    }
    if (res != null && res.result) {
      if (Config.DEBUG) {
        print("customer: " + res.result.toString());
      }
      return new DataResult(res.data, true, res.code);
    } else {
      return new DataResult(res.data, false, res.code);
    }
  }
}
