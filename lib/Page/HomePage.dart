import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app123456/Page/GrabSheetPage.dart';
import 'package:flutter_app123456/Page/HomeHomePage.dart';
import 'package:flutter_app123456/Page/MyPage.dart';
import 'package:flutter_app123456/Page/NoticePage.dart';
import 'package:flutter_app123456/common/config/Config.dart';
import 'package:flutter_app123456/common/local/LocalStorage.dart';
import 'package:flutter_app123456/common/style/CustomStyle.dart';
import 'package:flutter_app123456/common/utils/CommonUtils.dart';
import 'package:flutter_app123456/widget/CustomTabBarWidget.dart';

class HomePage extends StatelessWidget{
  static final String sName = "home";
  DateTime lastPopTime;

  
  _renderTab(icon, text){
    return new Tab(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(icon, size: 13.0,),
          Padding(padding: EdgeInsets.only(top: 1.5, bottom: 1.5),),
          Text(text, style: TextStyle(fontSize: 9.0),)],
      ),
    );
  }
  
  @override
  Widget build(BuildContext context){
    List<List<Widget>> tabsList = new List<List<Widget>>();
    List<Widget> tabs_0 = [
      _renderTab(CustomIcons.HOME_HOME_ON, CommonUtils.getLocale(context).homeHome),
      _renderTab(CustomIcons.HOME_TAKE_ORDER, CommonUtils.getLocale(context).homeGrabSheet),
      _renderTab(CustomIcons.HOME_MESSAGE, CommonUtils.getLocale(context).homeNotice),
      _renderTab(CustomIcons.HOME_MY, CommonUtils.getLocale(context).homeMy)
    ];
    List<Widget> tabs_1 = [
      _renderTab(CustomIcons.HOME_HOME, CommonUtils.getLocale(context).homeHome),
      _renderTab(CustomIcons.HOME_TAKE_ORDER_ON, CommonUtils.getLocale(context).homeGrabSheet),
      _renderTab(CustomIcons.HOME_MESSAGE, CommonUtils.getLocale(context).homeNotice),
      _renderTab(CustomIcons.HOME_MY, CommonUtils.getLocale(context).homeMy)
    ];
    List<Widget> tabs_2 = [
      _renderTab(CustomIcons.HOME_HOME, CommonUtils.getLocale(context).homeHome),
      _renderTab(CustomIcons.HOME_TAKE_ORDER, CommonUtils.getLocale(context).homeGrabSheet),
      _renderTab(CustomIcons.HOME_MESSAGE_ON, CommonUtils.getLocale(context).homeNotice),
      _renderTab(CustomIcons.HOME_MY, CommonUtils.getLocale(context).homeMy)
    ];
    List<Widget> tabs_3 = [
      _renderTab(CustomIcons.HOME_HOME, CommonUtils.getLocale(context).homeHome),
      _renderTab(CustomIcons.HOME_TAKE_ORDER, CommonUtils.getLocale(context).homeGrabSheet),
      _renderTab(CustomIcons.HOME_MESSAGE, CommonUtils.getLocale(context).homeNotice),
      _renderTab(CustomIcons.HOME_MY_ON, CommonUtils.getLocale(context).homeMy)
    ];
    tabsList.add(tabs_0);
    tabsList.add(tabs_1);
    tabsList.add(tabs_2);
    tabsList.add(tabs_3);
    return WillPopScope(
      onWillPop: () async {
        // 点击返回键的操作
        if(lastPopTime == null || DateTime.now().difference(lastPopTime) > Duration(seconds: 2)){
          lastPopTime = DateTime.now();
          CommonUtils.showShort('再按一次退出');
          return false;
        }else{
          lastPopTime = DateTime.now();
          ///清空LocalStorage,退出app
          await LocalStorage.remove(Config.DRIVER_ARCHIVES);
          await LocalStorage.remove(Config.DRIVER_NAME);
          await LocalStorage.remove(Config.USER_ID);
          await LocalStorage.remove(Config.VEHICLE_ARCHIVES);
          await LocalStorage.remove(Config.VEHICLE_STATE);
          await LocalStorage.remove(Config.STAFF_AND_CERTIFICATES_STATE);
          await LocalStorage.remove(Config.QUEUE_INFO);
          await LocalStorage.remove(Config.LASTED_DELIVERY_ORDER);
          await LocalStorage.remove(Config.HISTORY_DELIVERY_ORDER);
          await LocalStorage.remove(Config.MY_BARCODE);
          await SystemChannels.platform.invokeMethod('SystemNavigator.pop');
          return true;
        }
      },

      child: new CustomTabBarWidget(
        drawer: null,
        type: CustomTabBarWidget.BOTTOM_TAB,
        tabItemsList: tabsList,
        tabViews: [
          new HomeHomePage(),
          new GrabSheetPage(),
          new NoticePage(),
          new MyPage()
        ],
        backgroundColor: Color(CustomColors.white),
        indicatorColor: Color(CustomColors.white),

        //title: new Title(color: Color(CustomColors.white), child: new Text("无车承运(司机版)")),
      ),
    

    );
  }
}