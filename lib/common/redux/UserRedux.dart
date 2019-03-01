
import 'package:redux/redux.dart';
import 'package:flutter_app123456/common/model/User.dart';

/// redux 的 combineReducers, 通过 TypedReducer 将 UpdateUserAction 与 reducers 关联起来
final UserReducer = combineReducers<User>([
  TypedReducer<User, UpdateUserAction>(_updateLoaded)
]);
///如果有UpdateUserAction 发起一个请求时
///就会调用到_updateLoaded
///_updateLoaded 这里接受一个新的userInfo,并返回
User _updateLoaded(User user, action){
  user = action.userInfo;
  return user;
}
///定义一个UpdateUserAction,用于发起userInfo的变更
///必须通过上面的UserReducer绑定
class UpdateUserAction{
  final User userInfo;
  UpdateUserAction(this.userInfo);
}