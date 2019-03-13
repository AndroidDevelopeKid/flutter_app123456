
import 'dart:convert';

import 'package:flutter_app123456/common/config/Config.dart';
import 'package:flutter_app123456/common/dao/ResultDao.dart';
import 'package:flutter_app123456/common/local/LocalStorage.dart';
import 'package:flutter_app123456/common/model/Vehicle.dart';
import 'package:flutter_app123456/common/net/Address.dart';
import 'package:flutter_app123456/common/net/HttpApi.dart';

class VehicleStateDao{
  static getVehicleStateInfo(vehicleCode) async{
    next() async {
      var res;
      if(vehicleCode != null){
        res = await HttpManager.netFetch(Address.getVehicleState() + "?VehicleCode=${vehicleCode}", null, null, null);
      }else{
        res = new DataResult("获取车辆状态失败", false);
      }
      if(res != null && res.result){
        print("vehicleInfo: " + res.data.toString());
        LocalStorage.save(Config.VEHICLE_STATE, json.encode(res.data["result"]));
        print("driverinfo.ls" + json.encode(res.data["result"]));

        return new DataResult("获取车辆状态成功", true);

      }else{
        return new DataResult(res.data, false);
      }
    }
    return await next();
  }
}