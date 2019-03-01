
import 'package:flutter/material.dart';
import 'package:flutter_app123456/common/dao/UserDao.dart';
import 'package:flutter_app123456/common/redux/CustomState.dart';
import 'package:flutter_app123456/common/style/CustomStyle.dart';
import 'package:flutter_app123456/common/utils/CommonUtils.dart';
import 'package:flutter_app123456/common/utils/NavigatorUtils.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class WelcomePage extends StatefulWidget{
  static final String sName = "/";

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage>{
  bool hadInit = false;

  @override
  void didChangeDependencies(){
    super.didChangeDependencies();
    if(hadInit){
      return;
    }
    hadInit = true;
    ///防止多次进入
    Store<CustomState> store = StoreProvider.of(context);
    CommonUtils.initStatusBarHeight(context);
    new Future.delayed(const Duration(seconds: 3),(){
      UserDao.initUserInfo(store).then((res){
        if(res != null && res.result){
          NavigatorUtils.goHome(context);
        }else{
          NavigatorUtils.goLogin(context);
        }
        return true;
      });
    });
  }
  
  @override
  Widget build(BuildContext context){
    return StoreBuilder<CustomState>(
      builder: (context, store){
        return new Container(
          color: Color(CustomColors.white),
          child: new Center(
            child: new Image(image: new AssetImage(CustomIcons.WELCOME_ICON)),
          ),
        );
      },
    );
  }
}