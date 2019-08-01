
import 'package:flutter/material.dart';
import 'package:flutter_app123456/Page/LoginPage.dart';
import 'package:flutter_app123456/common/dao/UserDao.dart';
import 'package:flutter_app123456/common/redux/CustomState.dart';
import 'package:flutter_app123456/common/style/CustomStyle.dart';
import 'package:flutter_app123456/common/utils/CommonUtils.dart';
import 'package:flutter_app123456/common/utils/NavigatorUtils.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:redux/redux.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomePage extends StatefulWidget{
  static final String sName = "/";

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage>{
  bool hadInit = false;

  List<Slide> slides = new List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    slides.add(
        new Slide(
          title: "无车承运",
          description: "整合资源，提升效率",
          styleDescription: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontFamily: 'Raleway'
          ),
          marginDescription: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0, bottom: 70.0),
          colorBegin: Color(0xffFFDAB9),
          colorEnd: Color(0xff40E0D0),
          directionColorBegin: Alignment.topLeft,
          directionColorEnd: Alignment.bottomRight,
        ),
    );
    slides.add(
      new Slide(
        title: "司机好帮手",
        description: "司机接单赚钱利器",
        styleDescription: TextStyle(
          color: Colors.white,
          fontSize: 20.0,
          fontFamily: 'Raleway'
        ),
        marginDescription: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0, bottom: 70.0),
        colorBegin: Color(0xffFFFACD),
        colorEnd: Color(0xffFF6347),
        directionColorBegin: Alignment.topLeft,
        directionColorEnd: Alignment.bottomRight,
      ),
    );
//    slides.add(
//      new Slide(
//        title: "欢迎使用",
//        description: "定会爱不释手",
//        styleDescription: TextStyle(
//          color: Colors.white,
//          fontSize: 20.0,
//          fontFamily: 'Raleway'
//        ),
//        marginDescription: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0, bottom: 70.0),
//        colorBegin: Color(0xffFFA500),
//        colorEnd: Color(0xff7FFFD4),
//        directionColorBegin: Alignment.topLeft,
//        directionColorEnd: Alignment.bottomRight,
//      ),
//    );
  }

  void onDonePress(){
    _setHasSkip();
    Navigator.of(context).pushAndRemoveUntil(
        new MaterialPageRoute(builder: (context) => LoginPage()),
        (route) => route == null);
  }
  void _setHasSkip() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool("hasSkip", true);
  }

//  @override
//  void didChangeDependencies(){
//    super.didChangeDependencies();
//    if(hadInit){
//      return;
//    }
//    hadInit = true;
//    ///防止多次进入
//    Store<CustomState> store = StoreProvider.of(context);
//    CommonUtils.initStatusBarHeight(context);
//    new Future.delayed(const Duration(seconds: 3),(){
//      UserDao.initUserInfo(store).then((res){
//        if(res != null && res.result){
//          NavigatorUtils.goHome(context);
//        }else{
//          NavigatorUtils.goLogin(context);
//        }
//        return true;
//      });
//    });
//  }
  
  @override
  Widget build(BuildContext context){
    return IntroSlider(
      slides: this.slides,
      onDonePress: this.onDonePress,
      nameSkipBtn: "跳过",
      nameNextBtn: "下一页",
      nameDoneBtn: "进入",
    );
//    return StoreBuilder<CustomState>(
//      builder: (context, store){
//        return new Container(
//          color: Color(CustomColors.white),
//          child: new Center(
//            child: new Image(image: new AssetImage(CustomIcons.WELCOME_ICON)),
//          ),
//        );
//      },
//    );
  }
}