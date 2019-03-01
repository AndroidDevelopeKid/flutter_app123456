import 'package:flutter_app123456/common/style/CustomStringBase.dart';

class CustomStringEn extends CustomStringBase{

  @override
  String loginText = "Login";

  @override
  String loginCompanyHintText = "company";

  @override
  String loginUsernameHintText = "username";

  @override
  String loginPasswordHintText = "password";

  @override
  String loadingText = "Loading...";

  @override
  String receiptText = "receipt";

  ///登录时联网出错提醒
  @override
  String networkError = "network error";
  @override
  String networkError_401 = "Http 401";
  @override
  String networkError_403 = "Http 403";
  @override
  String networkError_404 = "Http 404";
  @override
  String networkErrorTimeout = "Http timeout";
  @override
  String networkErrorUnknown = "Http unknown error";

  @override
  String appEmpty = "Empty";


  @override
  String loadMoreText = "Load More";

  ///我的信息
  @override
  String driverFile = "driver file";

  @override
  String vehicleInfo = "vehicle info";

  @override
  String vehicleCondition = "vehicle condition";

  @override
  String dispatchAssignment = "dispatch assingment";
}