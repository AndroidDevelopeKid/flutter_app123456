
import 'package:flutter/material.dart';
import 'package:flutter_app123456/common/model/Driver.dart';
import 'package:flutter_app123456/common/redux/DriverRedux.dart';
import 'package:flutter_app123456/common/redux/UserRedux.dart';
import 'package:flutter_app123456/common/model/User.dart';
import 'package:flutter_app123456/common/redux/LocaleRedux.dart';

///全局Redux store 对象，保存state数据
class CustomState{
  ///用户信息
  User userInfo;
  ///司机档案
  Driver driver;
  ///语言
  Locale locale;
  ///当前手机平台默认语言
  Locale platformLocale;
  ///构造方法
  CustomState({this.userInfo, this.locale, this.driver});
}
///创建 Reducer
///源码中 Reducer 是一个方法 typedef State Reducer<State>(State state, dynamic action);
///我们自定义了 appReducer 用于创建 store
CustomState appReducer(CustomState state, action){
  return CustomState(
    ///通过 UserReducer 将 CustomState 内的 userInfo 和 action 关联在一起
    userInfo: UserReducer(state.userInfo, action),
    ///通过 DriverReducer 将 CustomState 内的 userInfo 和 action 关联在一起
    driver: DriverReducer(state.driver, action),
    ///通过 LocaleReducer 将 CustomState 内的 locale 和 action 关联在一起
    locale: LocaleReducer(state.locale, action),
  );
}