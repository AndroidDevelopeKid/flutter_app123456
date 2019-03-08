
import 'package:flutter_app123456/common/config/Config.dart';

class Address{
  static const String host = "http://10.1.9.167/api/";

  ///获取授权 post
  static getAuthorization(){
    return "${host}TokenAuth/Authenticate";
  }
  ///获取司机档案
  static getDriverArchives(){
    return "${host}services/app/VehicleDriverArchive/GetVehicleDriverArchivesByMobile";
  }

  ///获取用户组织
  static getUserOrgs(userName){
    return "${host}users/$userName/orgs";
  }

  ///处理分页参数
  static getPageParams(tab, page, [pageSize = Config.PAGE_SIZE]){
    if(page != null){
      if(pageSize != null){
        return "${tab}page=$page&per_page=$pageSize";
      }else{
        return "${tab}page=$page";
      }
    }else{
      return "";
    }
  }
  ///测试龙飞登录
//  static getTestZFAcount(){
//    return "http://10.1.9.167/api/TokenAuth/Authenticate";
//  }
  ///测试龙飞司机档案
  static getTestZFDriverInfo(){
    return "http://10.1.9.167/api/services/app/VehicleDriverArchive/GetVehicleDriverArchiveForMobileAsync";
  }
//  ///我的用户信息 GET
//  static getMyUserInfo(){
//    return "${host}user";
//  }
//  ///用户信息 GET
//  static getUserInfo(userName){
//    return "${host}users/$userName";
//  }
}