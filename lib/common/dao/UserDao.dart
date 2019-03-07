import 'dart:collection';

import 'package:dio/dio.dart';
import 'dart:convert';

import 'package:flutter_app123456/common/config/Config.dart';
import 'package:flutter_app123456/common/dao/ResultDao.dart';
import 'package:flutter_app123456/common/local/LocalStorage.dart';
import 'package:flutter_app123456/common/model/User.dart';
import 'package:flutter_app123456/common/model/UserOrg.dart';
import 'package:flutter_app123456/common/net/Address.dart';
import 'package:flutter_app123456/common/net/HttpApi.dart';
import 'package:flutter_app123456/common/redux/UserRedux.dart';
import 'package:redux/redux.dart';

class UserDao{
  static login(company, userName, password, store) async{

    print("company login:" + company);
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

    Map requestParams = {
      //"tenancyName": "default",
      "usernameOrEmailAddress": userName,
      "password": password
    };

    Map<String,String> header = {
      "Abp.TenantId" : "1",
    };

    var res = await HttpManager.netFetch(Address.getAuthorization(), json.encode(requestParams), header, new Options(method: 'post'));
    if(Config.DEBUG){
      print("res and res.result and res.data: " + res.toString() + "---" + res.result.toString() + "---" + res.data["result"]["userId"].toString());
    }
    var resultData;
    if(res != null && res.result){
      await LocalStorage.save(Config.PW_KEY, password);
      resultData = await getUserInfo(res.data["result"]["userId"]);
      if(Config.DEBUG){
        print("userResult: " + resultData.result.toString());
        print("resultDate.data: "+ resultData.data.toString());
      }
      //redux 管理user状态
      store.dispatch(new UpdateUserAction(resultData.data));

    }
    return new DataResult(resultData, res.result);
  }
  ///初始化用户信息
  static initUserInfo(Store store) async {

  }
  static getUserInfo(userId) async {
    Map requestParamsForUserName = {
      "userIds": userId
    };
    next() async {
      var res;
      if(userId != null){
        res = await HttpManager.netFetch(Address.getUserFullName(), json.encode(requestParamsForUserName), null, null);
      }else{
        res = new DataResult("用户名", false);
      }
      if(res != null && res.result){
        print("userInfo: " + res.toString());
        User user = User.fromJson(res.data);
        if(userId == null){
          LocalStorage.save(Config.USER_INFO, json.encode(user.toJson()));
          print("userinfo.ls" + json.encode(user.toJson()));
        }
        return new DataResult(user, true);

      }else{
        return new DataResult(res.data, false);
      }
    }
    return await next();
  }

  ///获取用户组织
  static getUserOrgsDao(userName, page, {needDb = false}) async{
    //UserOrgsDbProvider provider = new UserOrgsDbProvider();
    next() async{
      String url = Address.getUserOrgs(userName) + Address.getPageParams("?", page);
      var res = await HttpManager.netFetch(url, null, null, null);
      if(res != null && res.result){
        List<UserOrg> list = new List();
        var data = res.data;
        if(data == null || data.length == 0){
          return new DataResult(null, false);
        }
        for(int i = 0; i < data.length; i++){
          list.add(new UserOrg.formJson(data[i]));
        }
        if(needDb){
          //provider.insert(userName, json.encode(data));
        }
        return new DataResult(list, true);
      }else{
        return new DataResult(null, false);
      }

    }

    if(needDb){
      List<UserOrg> list = null; //await provider.getData(userName);
      if(list == null){
        return await next();
      }
      DataResult dataResult = new DataResult(list, true, next: next());
      return dataResult;
    }
    return await next();
  }
}