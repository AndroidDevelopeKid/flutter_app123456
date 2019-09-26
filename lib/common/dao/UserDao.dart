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
  static login(companyId, userName, password) async{

    print("company login:" + companyId);
    //String tenantId = Config.TENANT;
    String tenantId = companyId;

//    String type = userName + ":" + password;
//    var bytes = utf8.encode(type);
//    var base64Str = base64.encode(bytes);
//    if (Config.DEBUG) {
//      print("base64Str login " + base64Str);
//    }
    await LocalStorage.save(Config.USER_NAME_KEY, userName);
    await LocalStorage.save(Config.TENANT_ID, tenantId);
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
    await LocalStorage.remove(Config.TENANT_ID);
    await LocalStorage.remove(Config.VEHICLE_ARCHIVES);
    await LocalStorage.remove(Config.VEHICLE_STATE);
    await LocalStorage.remove(Config.STAFF_AND_CERTIFICATES_STATE);
    await LocalStorage.remove(Config.QUEUE_INFO);
    await LocalStorage.remove(Config.LASTED_DELIVERY_ORDER);
    await LocalStorage.remove(Config.HISTORY_DELIVERY_ORDER);
    await LocalStorage.remove(Config.DISPATCH_ASSIGN);

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
      print("res and res.result and res.data: " + res.data.toString() + "---" + res.result.toString() + "---");
    }
    if(res != null && res.result){
      await LocalStorage.save(Config.PW_KEY, password);
      await LocalStorage.save(Config.USER_ID, res.data["result"]["userId"].toString());

    }

    return new DataResult(res.data, res.result, res.code);
  }
  ///初始化用户信息
  static initUserInfo(Store store) async {

  }
  ///获取用户二维码名片
  static getMyBarcode(tenantId) async{
    var res;
    res = await HttpManager.netFetch(Address.getMyBarcode(), null, null, null);// + "?TenantId=${int.parse(tenantId)}&UserId=${userId}"
    if(res.code == 403){
      await refreshToken();
      res = await HttpManager.netFetch(Address.getMyBarcode(), null, null, null);
    }
    if(res != null && res.result){
      print("barcode: " + res.data.toString());
      if(res.data["result"] != null){
        return new DataResult(res.data["result"], true, res.code);
      }else{
        return new DataResult(null, true, res.code);
      }
    }
    else{
      return new DataResult(null, false, res.code);
    }

  }
  static getUserInfo(tenantId,userId) async {
    next() async {
      var res;
      res = await HttpManager.netFetch(Address.getDriverArchives(), null, null, null);// + "?TenantId=${int.parse(tenantId)}&UserId=${userId}"
      if(res.code == 403){
        await refreshToken();
        res = await HttpManager.netFetch(Address.getDriverArchives(), null, null, null);
      }
      if(res != null && res.result){
        print("driverInfo: " + res.data.toString());
        if(res.data["result"] != null){
          Driver driver = Driver.fromJson(res.data["result"]);
          LocalStorage.save(Config.DRIVER_NAME, driver.driverName);
          print("driverinfo.ls" + json.encode(driver.toJson()));
          return new DataResult(driver, true, res.code);
        }else{
          return new DataResult(null, true, res.code);
        }
      }else{
        return new DataResult(null, false, res.code);
      }
    }
    return await next();
  }

  ///登陆信息
  static getTenants(maxResultCount, skipCount) async {
    var res = await HttpManager.netFetch(Address.getTenant() + "?MaxResultCount=${maxResultCount}&SkipCount=${skipCount}", null, null, null);
    if(res != null ){
      print("tenants: " + res.data.toString());
      return new DataResult(res.data, true, res.code);
    }
  }

  ///刷新token
  static refreshToken() async {
    String userName = await LocalStorage.get(Config.USER_NAME_KEY);
    String password = await LocalStorage.get(Config.PW_KEY);
    String tenantId = await LocalStorage.get(Config.TENANT_ID);
    ///清除授权
    HttpManager.clearAuthorization();
    Map requestParams = {
      //"tenancyName": "default",
      "usernameOrEmailAddress": userName,
      "password": password
    };

    Map<String,String> header = {
      "Abp.TenantId" : tenantId,
    };
    var res = await HttpManager.netFetch(Address.getAuthorization(), json.encode(requestParams), header, new Options(method: 'post'));

  }




}