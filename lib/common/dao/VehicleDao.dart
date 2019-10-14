import 'dart:convert';

import 'package:flutter_app123456/common/config/Config.dart';
import 'package:flutter_app123456/common/dao/ResultDao.dart';
import 'package:flutter_app123456/common/local/LocalStorage.dart';
import 'package:flutter_app123456/common/model/Vehicle.dart';
import 'package:flutter_app123456/common/net/Address.dart';
import 'package:flutter_app123456/common/net/HttpApi.dart';

import 'UserDao.dart';

class VehicleDao {
  static getVehicleInfo() async {
    //tenantId, userId

    var res;
    res = await HttpManager.netFetch(Address.getVehicleArchives(), null, null,
        null); // + "?TenantId=${int.parse(tenantId)}&UserId=${userId}"
    if (res.code == Config.ERROR_CODE401 || res.code == Config.ERROR_CODE403) {
      await UserDao.refreshToken();
      res = await HttpManager.netFetch(
          Address.getVehicleArchives(), null, null, null);
    }
    if (res != null && res.result) {
      print("vehicleInfo: " + res.data.toString());
      if (res.data["result"] != null) {
        Vehicle vehicle = Vehicle.fromJson(res.data["result"][0]);
        print("driverinfo.ls" + json.encode(vehicle.toJson()));

        return new DataResult(vehicle, true, res.code);
      } else {
        return DataResult(null, true, res.code);
      }
    } else {
      return new DataResult(res.data, false, res.code);
    }
  }
}
