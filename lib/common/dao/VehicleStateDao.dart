
import 'dart:convert';

import 'package:flutter_app123456/common/config/Config.dart';
import 'package:flutter_app123456/common/dao/ResultDao.dart';
import 'package:flutter_app123456/common/local/LocalStorage.dart';
import 'package:flutter_app123456/common/model/Vehicle.dart';
import 'package:flutter_app123456/common/net/Address.dart';
import 'package:flutter_app123456/common/net/HttpApi.dart';

class VehicleStateDao{
  static getVehicleStateInfo() async{//tenantId, userId
    next() async {
      var res;
      //if(tenantId != null && userId != null){
        res = await HttpManager.netFetch(Address.getVehicleState(), null, null, null);// + "?TenantId=${int.parse(tenantId)}&UserId=${userId}"
//      }else{
//        res = new DataResult("获取车辆状态失败", false);
//      }
      if(res != null && res.result){
        print("vehicleStateInfo: " + res.data.toString());
        if(res.data["result"] != null){
          //LocalStorage.save(Config.VEHICLE_STATE, json.encode(res.data["result"]));
          print("vehicleStateInfo.ls" + json.encode(res.data["result"]));

          return new DataResult(json.encode(res.data["result"]), true);
        }else{
          return new DataResult(null, true);
        }

      }else{
        return new DataResult(res.data, false);
      }
    }
    return await next();
  }
}