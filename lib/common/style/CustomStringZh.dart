
import 'package:flutter_app123456/common/style/CustomStringBase.dart';

class CustomStringZh extends CustomStringBase{

  @override
  String loginText = "登录";

  @override
  String loginCompanyHintText = "物流公司";

  @override
  String loginUsernameHintText = "用户名";

  @override
  String loginPasswordHintText = "密码";

  @override
  String loadingText = "加载中...";

  @override
  String receiptText = "手动接单";

  ///登录时联网出错提醒
  @override
  String networkError = "网络错误";
  @override
  String networkError_401 = "[401错误可能: 未授权 \\ 授权登录失败 \\ 登录过期]";
  @override
  String networkError_403 = "403权限错误";
  @override
  String networkError_404 = "404错误";
  @override
  String networkErrorTimeout = "请求超时";
  @override
  String networkErrorUnknown = "其他异常";

  ///主页tab
  @override
  String homeHome = "首页";
  @override
  String homeNotice = "消息";
  @override
  String homeGrabSheet = "接单";
  @override
  String homeFinance = "财务";
  @override
  String homeMy = "我的";

  @override
  String appEmpty = "什么也没有";

  @override
  String loadMoreText = "加载更多";

  ///我的信息
  @override
  String driverFile = "司机档案";

  @override
  String vehicleInfo = "车辆信息";

  @override
  String vehicleCondition = "车务状态";

  @override
  String dispatchAssignment = "调度指派";
}