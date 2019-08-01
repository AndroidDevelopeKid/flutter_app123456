import 'package:flutter/material.dart';
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
  
  ///单击提示退出
  Future<bool> _dialogExitApp(BuildContext context){
    return showDialog(
        context: context,
        builder: (context) => new AlertDialog(
          content: new Text("退出？"),
          backgroundColor: Colors.white,
          actions: <Widget>[
            new FlatButton(onPressed: () => Navigator.of(context).pop(false), child: new Text("取消")),
            new FlatButton(
                onPressed: () async {
                  ///清空LocalStorage
                  await LocalStorage.remove(Config.DRIVER_ARCHIVES);
                  await LocalStorage.remove(Config.DRIVER_NAME);
                  await LocalStorage.remove(Config.USER_ID);
                  await LocalStorage.remove(Config.VEHICLE_ARCHIVES);
                  await LocalStorage.remove(Config.VEHICLE_STATE);
                  await LocalStorage.remove(Config.STAFF_AND_CERTIFICATES_STATE);
                  await LocalStorage.remove(Config.QUEUE_INFO);
                  await LocalStorage.remove(Config.LASTED_DELIVERY_ORDER);
                  await LocalStorage.remove(Config.HISTORY_DELIVERY_ORDER);
                  Navigator.of(context).pop(true);
                },
                child: new Text("确认")
            )
          ],
        )
    );
  }
  
  _renderTab(icon, text){
    return new Tab(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[new Icon(icon, size: 16.0,), new Text(text)],
      ),
    );
  }
  
  @override
  Widget build(BuildContext context){
    List<Widget> tabs = [
      _renderTab(CustomIcons.HOME_HOME, CommonUtils.getLocale(context).homeHome),
      _renderTab(CustomIcons.HOME_GRAB_SHEET, CommonUtils.getLocale(context).homeGrabSheet),
      _renderTab(CustomIcons.HOME_NOTICE, CommonUtils.getLocale(context).homeNotice),
      //_renderTab(CustomIcons.HOME_FINANCE, CommonUtils.getLocale(context).homeFinance),
      _renderTab(CustomIcons.HOME_MY, CommonUtils.getLocale(context).homeMy)
    ];
    return WillPopScope(
      onWillPop: (){
        return _dialogExitApp(context);
      },

      child: new CustomTabBarWidget(
        drawer: null,
        type: CustomTabBarWidget.BOTTOM_TAB,
        tabItems: tabs,
        tabViews: [
          new HomeHomePage(),
          new GrabSheetPage(),
          new NoticePage(),
          new MyPage()
        ],
        backgroundColor: Theme.of(context).primaryColor,
        indicatorColor: Color(CustomColors.white),

        title: new Title(color: Color(CustomColors.white), child: new Text("无车承运(司机版)")),
      ),
    

    );
  }
}