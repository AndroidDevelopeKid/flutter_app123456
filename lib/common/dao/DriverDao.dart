import 'dart:convert';

import 'package:flutter_app123456/common/config/Config.dart';
import 'package:flutter_app123456/common/dao/ResultDao.dart';
import 'package:flutter_app123456/common/local/LocalStorage.dart';
import 'package:flutter_app123456/common/model/DispatchAssign.dart';
import 'package:flutter_app123456/common/net/Address.dart';
import 'package:flutter_app123456/common/net/HttpApi.dart';

import 'UserDao.dart';

class DriverDao {
  static getDriverInfo() async {}

  //当前指派客户
  static getDispatchAssignInfo() async {
    var res;
    res = await HttpManager.netFetch(Address.getDispatchAssign(), null, null,
        null); // + "?TenantId=${int.parse(tenantId)}&UserId=${userId}"
    if (res.code == Config.ERROR_CODE401 || res.code == Config.ERROR_CODE403) {
      await UserDao.refreshToken();
      res = await HttpManager.netFetch(Address.getDispatchAssign(), null, null,
          null); // + "?TenantId=${int.parse(tenantId)}&UserId=${userId}"
    }
    if (res != null && res.result) {
      print("dispatchAssign: " + res.data.toString());
      if (res.data["result"] != null) {
        DispatchAssign dispatchAssign =
            DispatchAssign.fromJson(res.data["result"]);
        print("dispatchAssign.ls" + json.encode(dispatchAssign.toJson()));

        return new DataResult(dispatchAssign, true, res.code);
      } else {
        return DataResult(null, true, res.code);
      }
    } else {
      return new DataResult(res.data, false, res.code);
    }
  }
}
