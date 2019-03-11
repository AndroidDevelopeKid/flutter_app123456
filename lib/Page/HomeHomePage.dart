import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app123456/common/config/Config.dart';
import 'package:flutter_app123456/common/dao/CustomerDao.dart';
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
  

  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    super.build(context);
    return new StoreBuilder<CustomState>(
        builder:(context, store){
          return Scaffold(
            body: new GridView.count(
              crossAxisCount: 3,
              padding: EdgeInsets.all(10.0),
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
            child: new IconButton(
                icon: new Icon(CustomIcons.HISTORY_BILL, size: 80),
                onPressed: (){},
                tooltip: "历史提货单",
              padding: EdgeInsets.only(right: 55.0),
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
            child: new IconButton(
              icon: new Icon(CustomIcons.FREIGHT_INQUIRY, size: 80),
              onPressed: (){},
              tooltip: "运费查询",
              padding: EdgeInsets.only(right: 55.0),
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
              icon: new Icon(CustomIcons.REFUEL_INQUIRY, size: 80),
              onPressed: (){},
              tooltip: "加油查询",
              padding: EdgeInsets.only(right: 55.0),
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
              icon: new Icon(CustomIcons.TOLL_INQUIRY, size: 80),
              onPressed: (){},
              tooltip: "过路费查询",
              padding: EdgeInsets.only(right: 55.0),
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
              icon: new Icon(CustomIcons.MAINTENANCE_FEE_INQUIRY, size: 80),
              onPressed: (){},
              tooltip: "维修费查询",
              padding: EdgeInsets.only(right: 55.0),
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
              icon: new Icon(CustomIcons.OUTHER_COST_INQUIRY, size: 80),
              onPressed: (){},
              tooltip: "其他费用查询",
              padding: EdgeInsets.only(right: 55.0),
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
              icon: new Icon(CustomIcons.CURRENT_ASSIGN_CUSTOMER, size: 80),
              onPressed: (){},
              tooltip: "当前指派客户",
              padding: EdgeInsets.only(right: 55.0),
            ),
          ),
          new Text("当前指派客户"),
        ],
      ),
    );
    return widgetList;
  }

}
