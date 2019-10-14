import 'dart:convert';

import 'package:flutter_app123456/common/config/Config.dart';
import 'package:flutter_app123456/common/dao/ResultDao.dart';
import 'package:flutter_app123456/common/local/LocalStorage.dart';
import 'package:flutter_app123456/common/model/Vehicle.dart';
import 'package:flutter_app123456/common/net/Address.dart';
import 'package:flutter_app123456/common/net/HttpApi.dart';

import 'UserDao.dart';

class VehicleStateDao {
  static getVehicleStateInfo() async {
    //tenantId, userId
    var res;
    res = await HttpManager.netFetch(Address.getVehicleState(), null, null,
        null); // + "?TenantId=${int.parse(tenantId)}&UserId=${userId}"
    if (res.code == Config.ERROR_CODE401 || res.code == Config.ERROR_CODE403) {
      await UserDao.refreshToken();
      res = await HttpManager.netFetch(
          Address.getVehicleState(), null, null, null);
    }
    if (res != null && res.result) {
      print("vehicleStateInfo: " + res.data.toString());
      if (res.data["result"] != null) {
        //LocalStorage.save(Config.VEHICLE_STATE, json.encode(res.data["result"]));
        print("vehicleStateInfo.ls" + json.encode(res.data["result"]));

        return new DataResult(json.encode(res.data["result"]), true, res.code);
      } else {
        return new DataResult(null, true, res.code);
      }
    } else {
      return new DataResult(res.data, false, res.code);
    }
  }
}
