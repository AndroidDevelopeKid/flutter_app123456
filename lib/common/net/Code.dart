import 'package:event_bus/event_bus.dart';
import 'package:flutter_app123456/common/event/HttpErrorEvent.dart';

///网络返回数据编码
class Code{
  ///网络错误
  static const NETWORK_ERROR = -1;

  ///网络超时
  static const NETWORK_TIMEOUT = -2;

  ///网络返回数据格式化一次
  static const NETWORK_JSON_EXCEPTION = -3;

  ///其他错误
  static const OTHER_ERROR = -4;

  ///成功
  static const SUCCESS = 200;
  ///权限错误
  static const PERMISSION_ERROR = 403;

  static final EventBus eventBus = new EventBus();

  static errorHandleFunction(code, message, noTip){
    if(noTip){
      return message;
    }
    eventBus.fire(new HttpErrorEvent(code, message));
    return message;
  }
}