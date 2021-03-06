import 'package:flutter/material.dart';
import 'package:flutter_app123456/Page/HomePage.dart';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_app123456/Page/LoginPage.dart';
import 'package:flutter_app123456/Page/WelcomePage.dart';
import 'package:flutter_app123456/common/config/Config.dart';
import 'package:flutter_app123456/common/event/HttpErrorEvent.dart';
import 'package:flutter_app123456/common/local/LocalStorage.dart';
import 'package:flutter_picker/PickerLocalizationsDelegate.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:flutter_app123456/common/localization/CustomLocalizationsDelegate.dart';
import 'package:flutter_app123456/common/model/User.dart';
import 'package:flutter_app123456/common/net/Code.dart';
import 'package:flutter_app123456/common/redux/CustomState.dart';
import 'package:flutter_app123456/common/utils/CommonUtils.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


void main(){
  runApp(new FlutterReduxApp());
  PaintingBinding.instance.imageCache.maximumSize = 100;
}

class FlutterReduxApp extends StatelessWidget {
  ///创建Store,引用CustomState中的appReducer实现Reducer方法
  ///initialState初始化State
  final store = new Store<CustomState>(
    appReducer,
    ///初始化数据
    initialState:new CustomState(
      userInfo: User.empty(),
      locale: Locale('zh', 'CH'),
    ),
  );
  FlutterReduxApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new StoreProvider(
        store: store,
        child: new StoreBuilder<CustomState>(builder: (context, store){
          return MaterialApp(
            ///多语言实现代理
            localizationsDelegates: [
              PickerLocalizationsDelegate.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              CustomLocalizationsDelegate.delegate,
            ],
            ///本地化委托，用于更改Flutter Widget默认的提示语，按钮text等
            locale:store.state.locale,///区域
            supportedLocales: [store.state.locale],///支持区域，传入支持的语种组数
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              // This is the theme of your application.
              //
              // Try running your application with "flutter run". You'll see the
              // application has a blue toolbar. Then, without quitting the app, try
              // changing the primarySwatch below to Colors.green and then invoke
              // "hot reload" (press "r" in the console where you ran "flutter run",
              // or simply save your changes to "hot reload" in a Flutter IDE).
              // Notice that the counter didn't reset back to zero; the application
              // is not restarted.
              primarySwatch: Colors.blue,
            ),
            ///路由，声明程序中有哪个通过Navigation.of(context).pushNamed跳转的路由
            ///参数以键值对的形式传递
            ///key：路由名字
            ///value：对应的Widget
            initialRoute: "login",
            routes: {
//              WelcomePage.sName: (context){
//                store.state.platformLocale = Localizations.localeOf(context);
//                return WelcomePage();
//              },
              HomePage.sName: (context){
                return new CustomLocalizations(
                  child: new HomePage(),

                );
              },
              LoginPage.sName: (context){
                return LoginPage();
//                return new CustomLocalizations(
//                  child: new LoginPage(),
//                );
              }
            },
          );
        }));

  }
}

class CustomLocalizations extends StatefulWidget {
  final Widget child;
  CustomLocalizations({Key key, this.child}) : super(key: key);

  @override
  _CustomLocalizationsState createState() => _CustomLocalizationsState();
}

class _CustomLocalizationsState extends State<CustomLocalizations> {
  StreamSubscription stream;

  @override
  void initState() {
    super.initState();
    stream = Code.eventBus.on<HttpErrorEvent>().listen((event) {
      errorHandleFunction(event.code, event.message);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new StoreBuilder<CustomState>(builder: (context, store) {
      return new Localizations.override(
        context: context,
        locale: store.state.locale,
        child: widget.child,
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    if (stream != null) {
      stream.cancel();
      stream = null;
    }

  }

  errorHandleFunction(int code, message) {
    switch (code) {
      case Code.NETWORK_ERROR:

        Fluttertoast.showToast(msg: CommonUtils
            .getLocale(context)
            .networkError);
        //Navigator.pop(context);
        break;
      case 401:

        Fluttertoast.showToast(msg: CommonUtils
            .getLocale(context)
            .networkError_401);
        //Navigator.pop(context);
        break;
      case 403:

        Fluttertoast.showToast(msg: CommonUtils
            .getLocale(context)
            .networkError_403);
        //Navigator.pop(context);
        break;
      case 404:

        Fluttertoast.showToast(msg: CommonUtils
            .getLocale(context)
            .networkError_404);
        //Navigator.pop(context);
        break;
      case Code.NETWORK_TIMEOUT:
      //超时

        Fluttertoast.showToast(msg: CommonUtils
            .getLocale(context)
            .networkErrorTimeout);
        //Navigator.pop(context);
        break;
      default:

        Fluttertoast.showToast(msg: CommonUtils
            .getLocale(context)
            .networkErrorUnknown + " " + message);
        //Navigator.pop(context);
        break;
    }
  }
}


