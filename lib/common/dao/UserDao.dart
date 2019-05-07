import 'dart:collection';

import 'package:dio/dio.dart';
import 'dart:convert';

import 'package:flutter_app123456/common/config/Config.dart';
import 'package:flutter_app123456/common/dao/ResultDao.dart';
import 'package:flutter_app123456/common/dao/StaffAndCertificatesStateDao.dart';
import 'package:flutter_app123456/common/dao/VehicleDao.dart';
import 'package:flutter_app123456/common/dao/VehicleStateDao.dart';
import 'package:flutter_app123456/common/local/LocalStorage.dart';
import 'package:flutter_app123456/common/model/Driver.dart';
import 'package:flutter_app123456/common/model/User.dart';
import 'package:flutter_app123456/common/model/UserOrg.dart';
import 'package:flutter_app123456/common/net/Address.dart';
import 'package:flutter_app123456/common/net/HttpApi.dart';
import 'package:flutter_app123456/common/redux/DriverRedux.dart';
import 'package:flutter_app123456/common/redux/UserRedux.dart';
import 'package:redux/redux.dart';

class UserDao{
  static login(company, userName, password, store) async{

    print("company login:" + company);
    String tenantId = Config.TENANT;
//    String type = userName + ":" + password;
//    var bytes = utf8.encode(type);
//    var base64Str = base64.encode(bytes);
//    if (Config.DEBUG) {
//      print("base64Str login " + base64Str);
//    }
    await LocalStorage.save(Config.USER_NAME_KEY, userName);
//    await LocalStorage.save(Config.USER_BASIC_CODE, base64Str);

//    Map requestParams = {
//      "scopes": ['user', 'repo', 'gist', 'notifications'],
//      "note": "admin_script",
//      "client_id": NetConfig.CLIENT_ID,
//      "client_secret": NetConfig.CLIENT_SECRET
//    };

    ///清除授权
    HttpManager.clearAuthorization();

    ///清空LocalStorage
    await LocalStorage.remove(Config.DRIVER_ARCHIVES);
    await LocalStorage.remove(Config.DRIVER_NAME);
    await LocalStorage.remove(Config.USER_ID);
    await LocalStorage.remove(Config.VEHICLE_ARCHIVES);
    await LocalStorage.remove(Config.VEHICLE_STATE);
    await LocalStorage.remove(Config.STAFF_AND_CERTIFICATES_STATE);
    await LocalStorage.remove(Config.QUEUE_INFO);
    await LocalStorage.remove(Config.LASTED_DELIVERY_ORDER);
    await LocalStorage.remove(Config.HISTORY_DELIVERY_ORDER);

    Map requestParams = {
      //"tenancyName": "default",
      "usernameOrEmailAddress": userName,
      "password": password
    };

    Map<String,String> header = {
      "Abp.TenantId" : tenantId,
    };

    var res = await HttpManager.netFetch(Address.getAuthorization(), json.encode(requestParams), header, new Options(method: 'post'));
    if(Config.DEBUG){
      print("res and res.result and res.data: " + res.toString() + "---" + res.result.toString() + "---");
    }
    var resultDataDriver;
    var resultDataVehicle;
    if(res != null && res.result){
      await LocalStorage.save(Config.PW_KEY, password);
      await LocalStorage.save(Config.USER_ID, res.data["result"]["userId"].toString());
      //resultDataDriver = await getUserInfo(tenantId,res.data["result"]["userId"]);

      if(Config.DEBUG){
        //print("userResult: " + resultDataDriver.result.toString());
        //print("resultDateDriver.data: "+ resultDataDriver.data.toString());
      }
      //redux 管理user状态
      //store.dispatch(new UpdateDriverAction(resultDataDriver.data));

    }
    return new DataResult(res.data, res.result);
  }
  ///初始化用户信息
  static initUserInfo(Store store) async {

  }
  static getUserInfo(tenantId,userId) async {
    next() async {
      var res;
      if(userId != null && tenantId != null){
        res = await HttpManager.netFetch(Address.getDriverArchives() + "?TenantId=${int.parse(tenantId)}&UserId=${userId}", null, null, null);
      }else{
        res = new DataResult("匿名", false);
      }
      if(res != null && res.result){
        print("driverInfo: " + res.data.toString());
        Driver driver = Driver.fromJson(res.data["result"]);
        LocalStorage.save(Config.DRIVER_NAME, driver.driverName);
        LocalStorage.save(Config.DRIVER_ARCHIVES, json.encode(driver.toJson()));
        print("driverinfo.ls" + json.encode(driver.toJson()));

//        var vehicleResult = await VehicleDao.getVehicleInfo(driver.vehicleCode);
//        if(Config.DEBUG){
//          print("getuserinfo -> getvehicleinfo:" + vehicleResult.data.toString());
//        }
//        var staffAndCertificatesStateResult = await StaffAndCertificatesStateDao.getStaffAndCertificatesStateInfo(driver.driverIDNumber);
//        print("getstaffAndCertificatesStateinfo:" + staffAndCertificatesStateResult.data.toString());
//
//        var vehicleStateResult = await VehicleStateDao.getVehicleStateInfo(driver.vehicleCode);
//        print("getvehicleStateinfo:" + vehicleStateResult.data.toString());

        return new DataResult(driver, true);

      }else{
        return new DataResult(res.data, false);
      }
    }
    return await next();
  }




}