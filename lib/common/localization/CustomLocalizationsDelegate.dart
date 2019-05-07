
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app123456/common/localization/DefaultLocalizations.dart';

class CustomLocalizationsDelegate extends LocalizationsDelegate<CustomLocalizations>{
  CustomLocalizationsDelegate();

  @override
  bool isSupported(Locale locale){
    ///支持中文和英文
    return ['en', 'zh'].contains(locale.languageCode);
  }
  ///根据locale,创建一个对象用于提供当前locale下的文本显示
  @override
  Future<CustomLocalizations> load(Locale locale){
    return new SynchronousFuture<CustomLocalizations>(new CustomLocalizations(locale));
  }

  @override
  bool shouldReload(LocalizationsDelegate<CustomLocalizations> old){
    return false;
  }
  ///全局静态的代理
  static CustomLocalizationsDelegate delegate = new CustomLocalizationsDelegate();
}