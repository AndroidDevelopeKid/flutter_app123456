

import 'dart:convert';

import 'package:flutter_app123456/common/config/CompanyPicker.dart';
import 'package:flutter_app123456/widget/Background.dart';
import 'package:flutter_app123456/widget/DropDown.dart';
import 'package:flutter_picker/flutter_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app123456/common/config/Config.dart';
import 'package:flutter_app123456/common/dao/UserDao.dart';
import 'package:flutter_app123456/common/local/LocalStorage.dart';
import 'package:flutter_app123456/common/redux/CustomState.dart';
import 'package:flutter_app123456/common/style/CustomStyle.dart';
import 'package:flutter_app123456/common/utils/CommonUtils.dart';
import 'package:flutter_app123456/common/utils/NavigatorUtils.dart';
import 'package:flutter_app123456/widget/CustomFlexButton.dart';
import 'package:flutter_app123456/widget/CustomInputWidget.dart';
import 'package:flutter_redux/flutter_redux.dart';

class LoginPage extends StatefulWidget{
  static final String sName = "login";


  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{


  ///物流公司，用户名和密码
  String _company;
  var _userName = "";
  var _password = "";

  final TextEditingController userController = new TextEditingController();
  final TextEditingController pwController = new TextEditingController();
  ///构造方法
  _LoginPageState() : super();

  @override
  void initState(){
    super.initState();
    initParams();
  }
  @override
  void dispose(){
    userController.dispose();
    pwController.dispose();
    super.dispose();
  }
  initParams() async {
    _userName = await LocalStorage.get(Config.USER_NAME_KEY);
    _password = await LocalStorage.get(Config.PW_KEY);

    userController.value = new TextEditingValue(text: _userName ?? "");
    pwController.value = new TextEditingValue(text: _password ?? "");

  }
  void _onCompanySelected(String value) {
    setState(() => _company = value);
  }

  DecorationImage loginBackgroundImage = new DecorationImage(
    image: new ExactAssetImage(CustomIcons.LOGIN_BACKGROUND_IMAGE),
    fit: BoxFit.cover,
  );
  @override
  Widget build(BuildContext context) {
    if(_company == null){
      _company = CompanyList[0];
    }

    return new StoreBuilder<CustomState>(builder: (context, store){
      return new GestureDetector(
        behavior:  HitTestBehavior.translucent,///点击空白处触发弹出收回键盘事件
        onTap: (){
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child:
        Scaffold(
          resizeToAvoidBottomPadding: false,//键盘弹出覆盖，不重新布局
          body: //new SingleChildScrollView(
              //child:
              new Container(
                decoration: new BoxDecoration(
                  image: loginBackgroundImage,

                ),
                //color: Theme.of(context).primaryColor,
                child: new Center(
                  child:
                  new Card(
                    ///阴影大小，默认2.0
                    elevation: 5.0,
                    shape: new RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    ///背景色
                    color: Color(CustomColors.cardWhite),
                    margin: const EdgeInsets.only(left: 50.0, right: 50.0),
                    child:
                    new Padding(
                      padding: new EdgeInsets.only(left: 30.0, top: 10.0, right: 30.0, bottom: 0.0),
                      child: new Column(
                        ///主轴方向上的对齐方式，默认start，center是将children放置在主轴中心
                        mainAxisAlignment: MainAxisAlignment.center,
                        ///在主轴方向占有空间的值，默认是max，最大化主轴方向的可用空间，min相反
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          //new Image.asset(CustomIcons.DEFAULT_USER_ICON, width: 80.0, height: 80.0),


                          new Padding(padding: new EdgeInsets.all(10.0)),
                          new Dropdown(
                            items: CompanyList,
                            value: _company,
                            onChanged: _onCompanySelected,
                            isExpanded: false,
                          ),
                          new Padding(padding: new EdgeInsets.all(10.0)),
                          new CustomInputWidget(
                            hintText: CommonUtils.getLocale(context).loginUsernameHintText,
                            iconData: CustomIcons.LOGIN_USER,
                            onChanged: (String value){
                              _userName = value;
                            },
                            controller: userController,
                          ),
                          new Padding(padding: new EdgeInsets.all(10.0)),
                          new CustomInputWidget(
                            hintText: '密码',
                            iconData: CustomIcons.LOGIN_PW,
                            obscureText: true,
                            onChanged: (String value){
                              _password = value;
                            },
                            controller: pwController,
                          ),
                          new Padding(padding: new EdgeInsets.all(25.0)),
                          new CustomFlexButton(
                            text:  CommonUtils.getLocale(context).loginText,
                            color: Theme.of(context).primaryColor,
                            textColor: Color(CustomColors.textWhite),
                            onPress: (){
                              if(_company == null || _company.length == 0){
                                return;
                              }
                              if(_userName == null || _userName.length == 0){
                                return;
                              }
                              if(_password == null || _password.length == 0){
                                return;
                              }
                              CommonUtils.showLoadingDialog(context);
                              UserDao.login(_company.trim(), _userName.trim(), _password.trim(), store).then((res){
                                if(res != null && res.result){
                                  new Future.delayed(const Duration(seconds: 1), (){

                                    NavigatorUtils.goHome(context);
                                    return true;
                                  });
                                }
                                Navigator.pop(context);
                                if(!res.result){
                                  if(res.data == null){
                                    CommonUtils.showShort("访问异常");
                                  }else{
                                    CommonUtils.showShort(res.data["error"]["details"].toString());
                                  }
                                  return false;
                                }
                              }
                              );
                            },
                          ),
                          new Padding(padding: new EdgeInsets.all(20.0)),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
          //),

        ),
      );
    });
  }

}