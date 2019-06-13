
import 'package:flutter_app123456/common/config/Config.dart';

class Address{
  //static const String host = "http://10.1.9.167/api/";
  static const String host = "https://api.yixintm.com/api/";
  static const String hostGit = "https://api.github.com/";
  static const String updateUrl = "https://www.pgyer.com/Yc9G";

  ///获取授权 post
  static getAuthorization(){
    return "${host}TokenAuth/Authenticate";
  }
  ///获取司机档案
  static getDriverArchives(){
    return "${host}services/app/VehicleDriverArchive/GetVehicleDriverArchivesByMobileAsync";
  }
  ///获取车辆档案
  static getVehicleArchives(){
    return "${host}services/app/VehicleArchives/GetVehicleArchivesStatusByMobileAsync";
  }
  ///获取人员及证照状态
  static getStaffAndCertificatesState(){
    return "${host}services/app/VehicleDriverArchive/GetVehicleDriverArchivesStatusByMobileAsync";
  }
  ///获取车辆状态
  static getVehicleState(){
    return "${host}services/app/VehicleArchives/GetVehicleArchivesStatusByMobileAsync";
  }

  ///获取用户组织
  static getUserOrgs(userName){
    return "${host}users/$userName/orgs";
  }

  ///司机接单排队--post
  static driverGrabSheetQueue(){
    return "${host}services/app/AcceptOrderQueue/CreateAcceptOrderQueueByMobileAsync";
  }

  ///取消排队--post
  static cancelQueue(){
    return "${host}services/app/AcceptOrderQueue/CancelAcceptOrderQueueByMobileAsync";
  }

  ///获取当前排队信息
  static getCurrentQueueInfo(){
    return "${host}services/app/AcceptOrderQueue/GetAcceptOrderQueueByUserByMobileAsync";
  }

  ///自动接单开启关闭按钮--post
  static driverAutoGrabSheetSwitch(){
    return "${host}services/app/AutoAcceptOrderState/CreateOrUpdateAutoAcceptOrderStateByMobileAsync";
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
    return "${host}services/app/DeliveryOrderRecord/GetNowDeliveryOrderRecordsByMobileAsync";
  }
  ///历史提货单
  static getHistoryBill(){
    return "${host}services/app/DeliveryOrderRecord/GetDeliveryOrderRecordsByMobileAsync";
  }
  ///装卸地数据
  static getTransportPlace(){
    return "${host}services/app/TransportPlaceAppService/GetAllTransportPlaceByMobileAsync";
  }
  ///当前指派客户
  static getDispatchAssign(){
    return "${host}services/app/VehicleDispatchAssignAppService/GetVehicleDispatchAssignForMobileAsync";
  }

  ///仓release get
  static getReposRelease(reposOwner, reposName) {
    return "${hostGit}repos/$reposOwner/$reposName/releases";
  }

  ///仓Tag get
  static getReposTag(reposOwner, reposName) {
    return "${hostGit}repos/$reposOwner/$reposName/tags";
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