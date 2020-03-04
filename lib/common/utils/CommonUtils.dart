
import 'package:flutter/material.dart';
import 'package:flutter_app123456/common/localization/DefaultLocalizations.dart';
import 'package:flutter_app123456/common/net/Address.dart';
import 'package:flutter_app123456/common/style/CustomStringBase.dart';
import 'package:flutter_app123456/common/style/CustomStyle.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
//import 'package:flutter_statusbar/flutter_statusbar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';
///通用工具
class CommonUtils{

  static double sStaticBarHeight = 0.0;

//  static void initStatusBarHeight(context) async {
//    sStaticBarHeight = await FlutterStatusbar.height / MediaQuery.of(context).devicePixelRatio;//除数是设备的像素密度
//  }

  ///本地化
  static CustomStringBase getLocale(BuildContext context){
    return CustomLocalizations.of(context).currentLocalized;
  }

  ///显示加载对话框
  static Future<Null> showLoadingDialog(BuildContext context){
    return showDialog(
      context: context,
      builder: (BuildContext context){
        return new Material(
          color: Colors.transparent,
          child: WillPopScope(
            onWillPop: () => new Future.value(false),//弹出dialog前禁掉返回按钮
            child: Center(
              child: new Container(
                width: 100.0,
                height: 100.0,
                padding: new EdgeInsets.all(4.0),
                decoration: new BoxDecoration(
                  color: Colors.transparent,
                  ///用一个BoxDecoration装饰器提供背景图片
                  borderRadius: BorderRadius.all(Radius.circular(4.0)),
                ),
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Container(child: SpinKitCircle(color: Color(CustomColors.white))),
                    //new Container(height: 10.0),
                    //new Container(child: new Text('loading...', style: CustomConstant.normalTextWhite)),
                    //new Container(child: new Text(CommonUtils.getLocale(context).loadingText, style: CustomConstant.normalTextWhite)),

                  ],
                ),
              ),
            ),
          ));
      },
    );

  }


  ///通知提示
  static showShort(String msg){
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
    );
  }

  ///版本更新
  static Future<Null> showUpdateDialog(BuildContext context, String contentMsg) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text("版本更新"),
            content: new Text(contentMsg),
            actions: <Widget>[
              new FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: new Text("取消")),
              new FlatButton(
                  onPressed: () {
                    launch(Address.updateUrl);
                    Navigator.pop(context);
                  },
                  child: new Text("确定")),
            ],
          );
        });
  }
}
