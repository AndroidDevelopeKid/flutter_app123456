
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
  ///获取车辆档案
  static getVehicleArchives(){
    return "${host}services/app/VehicleArchives/GetVehicleArchivesByMobile";
  }
  ///获取人员及证照状态
  static getStaffAndCertificatesState(){
    return "${host}services/app/VehicleDriverArchive/GetVehicleDriverArchivesStatusByMobile";
  }
  ///获取车辆状态
  static getVehicleState(){
    return "${host}services/app/VehicleArchives/GetVehicleArchivesStatusByMobile";
  }

  ///获取用户组织
  static getUserOrgs(userName){
    return "${host}users/$userName/orgs";
  }

  ///司机接单排队--post
  static driverGrabSheetQueue(){
    return "${host}services/app/AcceptOrderQueue/CreateAcceptOrderQueueForMobileAsync";
  }

  ///取消排队--post
  static cancelQueue(){
    return "${host}services/app/AcceptOrderQueue/CancelAcceptOrderQueueForMobileAsync";
  }

  ///获取当前排队信息
  static getCurrentQueueInfo(){
    return "${host}services/app/AcceptOrderQueue/GetAcceptOrderQueueByUserForMobileAsync";
  }

  ///自动接单开启关闭按钮--post
  static driverAutoGrabSheetSwitch(){
    return "${host}services/app/AutoAcceptOrderState/CreateOrUpdateAutoAcceptOrderStateAsync";
  }
  ///获取分页后的通知
  static getPagedUserNotifications(){
    return "${host}services/app/Notifications/GetPagedUserNotificationsAsync";
  }
  ///设置所有消息为已读--post
  static makeAllUserNotificationsAsRead(){
    return "${host}services/app/Notifications/MakeAllUserNotificationsAsRead";
  }
  ///设置单条信息为已读--post
  static makeNotificationAsRead(){
    return "${host}services/app/Notifications/MakeNotificationAsRead";
  }
  ///获取最新提货单
  static getLastedDeliveryOrderRecords(){
    return "${host}services/app/DeliveryOrderRecord/GetNowDeliveryOrderRecordsAsync";
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


}