import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app123456/Page/NoticePage.dart';
import 'package:flutter_app123456/common/config/Config.dart';
import 'package:flutter_app123456/common/dao/CustomerDao.dart';
import 'package:flutter_app123456/common/dao/NoticeDao.dart';
import 'package:flutter_app123456/common/dao/ReposDao.dart';
import 'package:flutter_app123456/common/local/LocalStorage.dart';
import 'package:flutter_app123456/common/model/Customer.dart';
import 'package:flutter_app123456/common/model/Driver.dart';
import 'package:flutter_app123456/common/net/HttpApi.dart';
import 'package:flutter_app123456/common/redux/CustomState.dart';
import 'package:flutter_app123456/common/style/CustomStyle.dart';
import 'package:flutter_app123456/common/utils/CommonUtils.dart';
import 'package:flutter_app123456/common/utils/NavigatorUtils.dart';
import 'package:flutter_app123456/widget/BasePersonState.dart';
import 'package:flutter_app123456/widget/CustomPullLoadWidget.dart';
import 'package:flutter_app123456/common/net/Address.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/io.dart';

class HomeHomePage extends StatefulWidget {
  @override
  _HomeHomePageState createState() => _HomeHomePageState();
}

class _HomeHomePageState extends State<HomeHomePage> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  var flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
  //var platform = MethodChannel('message.io/notice');
  @override
  void initState(){
    // TODO: implement initState
    super.initState();
    //检查版本更新
    ReposDao.getNewsVersion(context, false);
    //初始化本地通知
    var initializationSettingsAndroid = new AndroidInitializationSettings('icon_msg');
    //var initializationSettingsIOS = new IOSInitializationSettings(onDidReceiveLocalNotification: onDidReceiveLocalNotification);
    var initializationSettings = new InitializationSettings(initializationSettingsAndroid, null);
    flutterLocalNotificationsPlugin.initialize(initializationSettings, onSelectNotification: null);//onSelectNotification
    var timer = new Timer.periodic(const Duration(seconds: 60), (Void) async{
      //这里调用消息接口
      var notifications = await NoticeDao.getPagedUserNotifications(0,0);
      if(notifications != null && notifications.result && notifications.data["result"]["unreadCount"] != 0){
        //有未读消息，提示
        _showNotification();
      }

      print("timer notifications: " + notifications.data.toString());
    });

  }
//  Future onSelectNotification(String payload) async {
//    if (payload != null) {
//      debugPrint('notification payload: ' + payload);
//    }
//    //payload 可作为通知的一个标记，区分点击的通知。
//    if(payload != null && payload == "complete") {
//      await Navigator.push(
//        context,
//        new MaterialPageRoute(builder: (context) => new NoticePage()),
//      );
//    }
//  }
  Future _showNotification() async {
    //安卓的通知配置，必填参数是渠道id, 名称, 和描述, 可选填通知的图标，重要度等等。
    var androidPlatformChannelSpecifics = new AndroidNotificationDetails(
        'your channel id', 'your channel name', 'your channel description',
        importance: Importance.Max, priority: Priority.High);
    //IOS的通知配置
    var iOSPlatformChannelSpecifics = new IOSNotificationDetails();
    var platformChannelSpecifics = new NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
    //显示通知，其中 0 代表通知的 id，用于区分通知。
    await flutterLocalNotificationsPlugin.show(
        0, '您有新的消息', '', platformChannelSpecifics,
        payload: 'complete');
  }
  //删除单个通知
  Future _cancelNotification() async {
    //参数 0 为需要删除的通知的id
    await flutterLocalNotificationsPlugin.cancel(0);
  }
//删除所有通知
  Future _cancelAllNotifications() async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }


  @override
  Widget build(BuildContext context) {
    super.build(context);
    return new StoreBuilder<CustomState>(
        builder:(context, store){
          return Scaffold(
            body: new GridView.count(
              crossAxisCount: 3,
              padding: EdgeInsets.all(20.0),
              children: _buildWidgetList(),
            ),
          );
        },
    );
  }
  List<Widget> _buildWidgetList(){
    List<Widget> widgetList = new List();
    widgetList.add(
      new Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Expanded(
            child:
            new IconButton(
                icon: new Image.asset(CustomIcons.HISTORY_BILL_IMAGE),
                iconSize: Config.ICON_SIZE,
                //new Icon(CustomIcons.HISTORY_BILL, size: Config.ICON_SIZE),
                onPressed: (){
                  NavigatorUtils.goHistoryBill(context);
                },
                tooltip: "历史提货单",
              //padding: EdgeInsets.only(right: Config.ICON_RIGHT_PADDING),
            ),
          ),
          new Text("历史提货单"),
        ],
      ),
    );
    widgetList.add(
      new Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Expanded(
            child:
            new IconButton(
              icon: new Image.asset(CustomIcons.FREIGHT_INQUIRY_IMAGE),
              iconSize: Config.ICON_SIZE,
              //new Icon(CustomIcons.FREIGHT_INQUIRY, size: Config.ICON_SIZE),
              onPressed: (){
                CommonUtils.showShort("敬请期待...");
                //NavigatorUtils.goFreightInquiry(context);
              },
              tooltip: "运费查询",
              //padding: EdgeInsets.only(right: Config.ICON_RIGHT_PADDING),
            ),
          ),
          new Text("运费查询"),
        ],
      ),
    );
    widgetList.add(
      new Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Expanded(
            child: new IconButton(
              icon: new Image.asset(CustomIcons.REFUEL_INQUIRY_IMAGE),
              iconSize: Config.ICON_SIZE,
              //new Icon(CustomIcons.REFUEL_INQUIRY, size: Config.ICON_SIZE),
              onPressed: (){
                CommonUtils.showShort("敬请期待...");
                //NavigatorUtils.goRefuelInquiry(context);
              },
              tooltip: "加油查询",
              //padding: EdgeInsets.only(right: Config.ICON_RIGHT_PADDING),
            ),
          ),
          new Text("加油查询"),
        ],
      ),
    );
    widgetList.add(
      new Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Expanded(
            child: new IconButton(
              icon:new Image.asset(CustomIcons.TOLL_INQUIRY_IMAGE),
              iconSize: Config.ICON_SIZE,
              //new Icon(CustomIcons.TOLL_INQUIRY, size: Config.ICON_SIZE),
              onPressed: (){
                CommonUtils.showShort("敬请期待...");
                //NavigatorUtils.goTollInquiry(context);
              },
              tooltip: "过路费查询",
              //padding: EdgeInsets.only(right: Config.ICON_RIGHT_PADDING),
            ),
          ),
          new Text("过路费查询"),
        ],
      ),
    );
    widgetList.add(
      new Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Expanded(
            child: new IconButton(
              icon: new Image.asset(CustomIcons.MAINTENANCE_FEE_INQUIRY_IMAGE),
              iconSize: Config.ICON_SIZE,
              //new Icon(CustomIcons.MAINTENANCE_FEE_INQUIRY, size: Config.ICON_SIZE),
              onPressed: (){
                CommonUtils.showShort("敬请期待...");
                //NavigatorUtils.goMaintenanceFeeInquiry(context);
              },
              tooltip: "维修费查询",
              //padding: EdgeInsets.only(right: Config.ICON_RIGHT_PADDING),
            ),
          ),
          new Text("维修费查询"),
        ],
      ),
    );
    widgetList.add(
      new Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Expanded(
            child: new IconButton(
              icon: new Image.asset(CustomIcons.OTHER_COST_INQUIRY_IMAGE),
              iconSize: Config.ICON_SIZE,
              //new Icon(CustomIcons.OTHER_COST_INQUIRY, size: Config.ICON_SIZE),
              onPressed: (){
                CommonUtils.showShort("敬请期待...");
                //NavigatorUtils.goOtherCostInquiry(context);
              },
              tooltip: "其他费用查询",
              //padding: EdgeInsets.only(right: Config.ICON_RIGHT_PADDING),
            ),
          ),
          new Text("其他费用查询"),
        ],
      ),
    );
    widgetList.add(
      new Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Expanded(
            child: new IconButton(
              icon: new Image.asset(CustomIcons.CURRENT_ASSIGN_CUSTOMER_IMAGE),
              iconSize: Config.ICON_SIZE,
              //new Icon(CustomIcons.CURRENT_ASSIGN_CUSTOMER, size: Config.ICON_SIZE),
              onPressed: (){
                CommonUtils.showShort("敬请期待...");
                //NavigatorUtils.goCurrentAssignCustomer(context);
              },
              tooltip: "当前指派客户",
              //padding: EdgeInsets.only(right: Config.ICON_RIGHT_PADDING),
            ),
          ),
          new Text("当前指派客户"),
        ],
      ),
    );
    return widgetList;
  }

}
