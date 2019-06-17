
import 'dart:convert';

import 'package:flutter_app123456/common/config/Config.dart';
import 'package:flutter_app123456/common/dao/ResultDao.dart';
import 'package:flutter_app123456/common/local/LocalStorage.dart';
import 'package:flutter_app123456/common/model/Vehicle.dart';
import 'package:flutter_app123456/common/net/Address.dart';
import 'package:flutter_app123456/common/net/HttpApi.dart';

class VehicleDao{
  static getVehicleInfo() async{//tenantId, userId
    next() async {
      var res;
      //if(tenantId != null && userId != null){
        res = await HttpManager.netFetch(Address.getVehicleArchives(), null, null, null);// + "?TenantId=${int.parse(tenantId)}&UserId=${userId}"
//      }else{
//        res = new DataResult("获取车辆档案失败", false);
//      }
      if(res != null && res.result){
        print("vehicleInfo: " + res.data.toString());
        if(res.data["result"] != null){
          Vehicle vehicle = Vehicle.fromJson(res.data["result"][0]);
          LocalStorage.save(Config.VEHICLE_ARCHIVES, json.encode(vehicle.toJson()));
          print("driverinfo.ls" + json.encode(vehicle.toJson()));

          return new DataResult(vehicle, true);
        }else{
          return DataResult(null, true);
        }


      }else{
        return new DataResult(res.data, false);
      }
    }
    return await next();
  }
}