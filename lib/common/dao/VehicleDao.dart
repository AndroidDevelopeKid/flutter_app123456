
import 'dart:convert';

import 'package:flutter_app123456/common/config/Config.dart';
import 'package:flutter_app123456/common/dao/ResultDao.dart';
import 'package:flutter_app123456/common/local/LocalStorage.dart';
import 'package:flutter_app123456/common/model/Vehicle.dart';
import 'package:flutter_app123456/common/net/Address.dart';
import 'package:flutter_app123456/common/net/HttpApi.dart';

class VehicleDao{
  static getVehicleInfo(vehicleCode) async{
    Map requestParams = {
      "VehicleCode": vehicleCode
    };
    next() async {
      var res;
      if(vehicleCode != null){
        res = await HttpManager.netFetch(Address.getVehicleArchives(), json.encode(requestParams), null, null);
      }else{
        res = new DataResult("获取车辆档案失败", false);
      }
      if(res != null && res.result){
        print("vehicleInfo: " + res.data.toString());
        Vehicle vehicle = Vehicle.fromJson(res.data["result"][0]);
        LocalStorage.save(Config.VEHICLE_ARCHIVES, json.encode(vehicle.toJson()));
        print("driverinfo.ls" + json.encode(vehicle.toJson()));

        return new DataResult(vehicle, true);

      }else{
        return new DataResult(res.data, false);
      }
    }
    return await next();
  }
}