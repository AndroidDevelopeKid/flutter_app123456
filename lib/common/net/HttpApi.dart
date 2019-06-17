import 'dart:collection';

import 'package:flutter_app123456/common/config/Config.dart';
import 'package:flutter_app123456/common/local/LocalStorage.dart';
import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:flutter_app123456/common/net/Code.dart';
import 'package:flutter_app123456/common/net/ResultData.dart';

///封装http请求
class HttpManager{
  static const CONTENT_TYPE_JSON = "application/json";
  static const CONTENT_TYPE_FORM = "application/x-www-form-urlencoded";
  static Map optionParams = {
    "timeoutMs": 15000,
    "token" : null,
    "authorizationCode": null,
  };
  ///清除授权
  static clearAuthorization(){
    optionParams["authorizationCode"] = null;
    LocalStorage.remove(Config.BEARER_KEY);
  }
  ///获取授权token  或  bearer
//  static getAuthorization() async{
//    String token = await LocalStorage.get(Config.TOKEN_KEY);
//
//    if(token == null){
//      String basic = await LocalStorage.get(Config.USER_BASIC_CODE);
//      if(basic == null){
//        //提示输入账号密码
//      }else{
//        //通过basic去获取token，获取到设置，返回token
//        return "Basic $basic";
//      }
//    }else{
//      optionParams["authorizationCode"] = token;
//      return token;
//    }
//  }
  static getAuthorization() async{
    String bearer = await LocalStorage.get(Config.BEARER_KEY);
    if(bearer != null){
      optionParams["authorizationCode"] = bearer;
    }
    return bearer;
  }
  ///发起网络请求
  ///[url] 请求url
  ///[params] 请求参数
  ///[header] 请求头
  ///[option] 配置
  static netFetch(url, params, Map<String,String> header, Options option, {noTip = false}) async {
    //没有网络情况
    var connectivityResult = await (new Connectivity().checkConnectivity());
    if(connectivityResult == ConnectivityResult.none){
      //return new ResultData("网络错误", false, Code.NETWORK_ERROR);
      return new ResultData(Code.errorHandleFunction(Code.NETWORK_ERROR, "", noTip), false, Code.NETWORK_ERROR);

    }

    Map<String, String> headers = new HashMap();
    if(header != null){
      headers.addAll(header);
    }

    ///授权码
    if(optionParams["authorizationCode"] == null){
      var authorizationCode = await getAuthorization();
      if(authorizationCode != null){
        optionParams["authorizationCode"] = authorizationCode;
      }
    }

    ///配置请求头
    headers["Authorization"] = optionParams["authorizationCode"];


    if(option != null){
      option.headers = headers;
    }else{
      option = new Options(method: "get");
      option.headers = headers;
    }
    ///超时时间
    option.connectTimeout = 15000;

    Dio dio = new Dio();
    Response response;
    try{
      print("message" + url.toString() + "----" + params.toString() + "---" + option.headers.toString());
      response = await dio.request(url, data: params, options: option);
    } on DioError catch(e){
      Response errorResponse;
      if(e.response != null){
        errorResponse = e.response;
      }else{
        errorResponse = new Response();
      }
      if(e.type == DioErrorType.CONNECT_TIMEOUT){
        errorResponse.statusCode = Code.NETWORK_TIMEOUT;
      }

      if(Config.DEBUG){
        //print('请求异常: ' + "---" + e.response.statusCode.toString());//e.response.data.toString()
        print('请求异常url: ' + url);
      }

      //return new ResultData(errorResponse.data, false, errorResponse.statusCode);
      return new ResultData(Code.errorHandleFunction(errorResponse.statusCode, e.message, noTip), false, errorResponse.statusCode);

    }
    ///网络请求成功后正常返回的数据debug
    if(Config.DEBUG){
      print('请求url: ' + url);
      print('请求头: ' + option.headers.toString());
      if(params != null){
        print('请求参数: ' + params.toString());
      }
      if(response != null){
        print('返回参数: ' + response.toString());
        print('返回码：' + response.statusCode.toString());
      }
      if(optionParams["authorizationCode"] != null){
        print('authorizationCode : ' + optionParams["authorizationCode"]);
      }
    }

    try{
      if(option.contentType != null && option.contentType.primaryType == "text"){
        return new ResultData(response.data, true, Code.SUCCESS);
      }else{
        var responseJson = response.data;
        if(response.statusCode == 200 && responseJson["result"] != null && headers["Authorization"] == null){
          optionParams["authorizationCode"] = "Bearer " +  responseJson["result"]["accessToken"];
          //optionParams["authorizationCode"] = "Bearer " +  responseJson["result"];
          await LocalStorage.save(Config.BEARER_KEY, optionParams["authorizationCode"]);

        }
      }
      if(response.statusCode == 200 || response.statusCode == 201){
        return new ResultData(response.data, true, Code.SUCCESS, headers: response.headers);
      }
    }catch(e){
      print(e.toString());
      return new ResultData(response.data, false, response.statusCode);
    }
    //return new ResultData("登录请求失败", false, response.statusCode);
    return new ResultData(Code.errorHandleFunction(response.statusCode, "", noTip), false, response.statusCode);




  }
}