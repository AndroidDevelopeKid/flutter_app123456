
import 'package:flutter_app123456/common/model/Driver.dart';
import 'package:redux/redux.dart';

/// redux 的 combineReducers, 通过 TypedReducer 将 UpdateDriverAction 与 reducers 关联起来
final DriverReducer = combineReducers<Driver>([
  TypedReducer<Driver, UpdateDriverAction>(_updateLoaded)
]);
///如果有UpdateDriverAction 发起一个请求时
///就会调用到_updateLoaded
///_updateLoaded 这里接受一个新的driver,并返回
Driver _updateLoaded(Driver driver, action){
  driver = action.driver;
  return driver;
}
///定义一个UpdateDriverAction,用于发起driver的变更
///必须通过上面的DriverReducer绑定
class UpdateDriverAction{
  final Driver driver;
  UpdateDriverAction(this.driver);
}