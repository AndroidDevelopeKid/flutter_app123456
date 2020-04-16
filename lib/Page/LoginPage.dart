import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_app123456/common/model/Tenant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app123456/common/config/Config.dart';
import 'package:flutter_app123456/common/dao/UserDao.dart';
import 'package:flutter_app123456/common/local/LocalStorage.dart';
import 'package:flutter_app123456/common/style/CustomStyle.dart';
import 'package:flutter_app123456/common/utils/CommonUtils.dart';
import 'package:flutter_app123456/common/utils/NavigatorUtils.dart';

import 'CompanyPage.dart';

class LoginPage extends StatefulWidget {
  static final String sName = "login";

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  ///物流公司，用户名和密码
  Tenant tenant;
  String _companyText;
  String _userName;
  String _password;

  final TextEditingController userController = new TextEditingController();
  final TextEditingController pwController = new TextEditingController();

  ///构造方法
  _LoginPageState() : super();


  @override
  void initState() {
    super.initState();
    initParams();
  }

  @override
  void dispose() {
    userController.dispose();
    pwController.dispose();
    super.dispose();
  }

  initParams() async {
    _userName = await LocalStorage.get(Config.USER_NAME_KEY)??"";
    _password = await LocalStorage.get(Config.PW_KEY)??"";
    _companyText = await LocalStorage.get(Config.TENANT_KEY_NAME)??"选择物流公司";
    setState(() {});
    print("company text :" + _companyText);
    var res = await LocalStorage.get(Config.TENANT_KEY)??"";
    if(res != ""){
      print("res int:" + res);
      tenant = new Tenant(null, int.parse(res), "", "");
    }



    userController.value = new TextEditingValue(text: _userName ?? "");
    pwController.value = new TextEditingValue(text: _password ?? "");
  }

  DecorationImage loginBackgroundImage = new DecorationImage(
    image: new ExactAssetImage(CustomIcons.LOGIN_BACKGROUND_IMAGE),
    fit: BoxFit.cover,
  );

  @override
  Widget build(BuildContext context) {
    return
    GestureDetector(
        behavior: HitTestBehavior.translucent,

        ///点击空白处触发弹出收回键盘事件
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child:
        Scaffold(
          resizeToAvoidBottomPadding: false, //键盘弹出覆盖，不重新布局
          body: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  image: new DecorationImage(
                      image: AssetImage(CustomIcons.LOGIN_BACKGROUND),
                      fit: BoxFit.fill),
                ),
              ),
              Positioned(
                left: 39.0,
                right: 142.0,
                top: 112.0,
                child: Image.asset("assets/images/yixincloud.png"),
              ),
              Positioned(
                  left: 42.0,
                  top: 242.0,
                  child: Text(
                    "Sign In",
                    style: TextStyle(
                        fontFamily: 'MyFont',
                        fontSize: 14.0,
                        color: Color(0xff000000)),
                  )),
              Positioned(
                  left: 39.0,
                  top: 271.0,
                  right: 35.0,
                  child:
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      RaisedButton(
                        onPressed: () {
                          //跳转页面选择物流公司
                          Navigator.push<Tenant>(context, new MaterialPageRoute(
                              builder: (BuildContext context) {
                            return new CompanyPage();
                          })).then((Tenant t) {
                            if (t != null) {
                              LocalStorage.save(Config.TENANT_KEY, t.id.toString());
                              LocalStorage.save(Config.TENANT_KEY_NAME, t.name);
                              _companyText = t.name;
                              setState(() {
                                tenant = t;
                              });
                            }
                          });
                        },
                        child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 18.0),
                            child: Text(
                              _companyText??"选择物流公司",
                              style: TextStyle(
                                  fontSize: 17.0, color: Colors.white),
                            )),
                        color: Color(0xffB4CDFF),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 39.0, right: 35.0, top: 5.0, bottom: 5.0),
                      ),
                      TextField(
                        controller: userController,
                        onChanged: (String value){
                          _userName = value;
                        },
                        decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.symmetric(vertical: 19.0),
                            fillColor: Color(0xffF0F3FF),
                            filled: true,
                            border: InputBorder.none,
                            hintText: "用户名",
                            prefixIcon: Icon(
                              CustomIcons.USER_NAME,
                              color: Color(0xff4C88FF),
                            )),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 39.0, right: 35.0, top: 5.0, bottom: 5.0),
                      ),
                      TextField(
                        obscureText: true,
                        controller: pwController,
                        onChanged: (String value){
                          _password = value;
                        },
                        decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.symmetric(vertical: 19.0),
                            fillColor: Color(0xffF0F3FF),
                            filled: true,
                            border: InputBorder.none,
                            hintText: "密码",
                            prefixIcon: Icon(
                              CustomIcons.PASSWORD,
                              color: Color(0xff4C88FF),
                            )),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 39.0, right: 35.0, top: 13.5, bottom: 13.5),
                      ),
                      RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0)),
                        onPressed: () async {
                          print("bug: " + _userName.toString() + "--" + _password.toString());
                          if (tenant == null) {
                            CommonUtils.showShort("请先选择物流公司！");
                            return false;
                          }
                          if (_userName == null || _userName.length == 0) {
                            CommonUtils.showShort("用户名或密码不可为空！");
                            return false;
                          }
                          if (_password == null || _password.length == 0) {
                            CommonUtils.showShort("用户名或密码不可为空！");
                            return false;
                          }

                          CommonUtils.showLoadingDialog(context);
                          var res = await UserDao.login(tenant.id.toString().trim(),
                              _userName.trim(), _password.trim());
                          if (res != null && res.result) {
                            new Future.delayed(const Duration(seconds: 1), () {
                              NavigatorUtils.goHome(context);
                              return true;
                            });
                          }
                          Navigator.pop(context);

                          if (!res.result) {
                            if (Config.DEBUG) {
                              print("返回结果：" + res.data.toString());
                            }
                            CommonUtils.showShort("登录失败 用户名密码错误！");
                          }
                          return true;
                        },
                        child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 18.0),
                            child: Text(
                              "登录",
                              style: TextStyle(
                                  fontSize: 17.0, color: Colors.white),
                            )),
                        color: Color(0xff4C88FF),
                      ),
                    ],
                  )
              ),
              Positioned(
                left: 163.0,
                right: 162.0,
                bottom: 66.0,
                child: Image.asset("assets/images/logo.png"),
              ),
              Positioned(
                left: 100.0,
                right: 96.0,
                bottom: 47.0,
                child: Text(
                  "Transportation service platform",
                  style: TextStyle(
                      fontFamily: 'MyFont',
                      fontSize: 10.0,
                      color: Color(0xffBCD8FF)),
                ),
              )
            ],
          ),
        ));
  }
}
