import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app123456/common/config/Config.dart';
import 'package:flutter_app123456/common/dao/CustomerDao.dart';
import 'package:flutter_app123456/common/model/Customer.dart';
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

class MyPage extends StatefulWidget {

  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage>  with AutomaticKeepAliveClientMixin{

  @override
  bool get wantKeepAlive => true;



  var titles = ["司机档案", "车辆信息", "车务状态", "调度指派"];

  var userAvatar;
  var userName;
  ///条目右侧箭头按钮
  var rightArrowIcon = new Image.asset(
    CustomIcons.ARROW_ICON,
    width: Config.ARROW_ICON_WIDTH,
    height: Config.ARROW_ICON_WIDTH,
  );

  @override
  Widget build(BuildContext context) {
    var listView = new ListView.builder(
      itemCount: titles.length * 2,
      itemBuilder: (context, i) => renderRow(i),
    );
    return listView;
  }
  renderRow(i) {
    if (i == 0) {
      var avatarContainer = new Container(
        color: Color(CustomColors.displayUsernameBackground),
        height: 200.0,
        child: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              userAvatar == null
                  ? new Image.asset(
                CustomIcons.DEFAULT_USER_ICON,
                width: 60.0,
              )
                  : new Container(
                width: 60.0,
                height: 60.0,
                decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.transparent,
                  image: new DecorationImage(
                      image: new NetworkImage(userAvatar),
                      fit: BoxFit.cover),
                  border: new Border.all(
                    color: Colors.white,
                    width: 2.0,
                  ),
                ),
              ),
              new Text(
                userName == null ? "无名氏" : userName,
                style: CustomConstant.normalTextBlack,
              ),
            ],
          ),
        ),
      );
      return new GestureDetector(
        onTap: () {

        },
        child: avatarContainer,
      );
    }
    --i;
    if (i.isOdd) {//判断是否为奇数
      return new Divider(
        height: 1.0,
      );
    }
    i = i ~/ 2;
    String title = titles[i];
    var listItemContent = new Padding(
      padding: const EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
      child: new Row(
        children: <Widget>[
          new Expanded(
              child: new Text(
                title,
                style: CustomConstant.normalTextBlack,
              )),
          rightArrowIcon

        ],
      ),
    );
    return new InkWell(
      child: listItemContent,
      onTap: () {
        _handleListItemClick(title,userName);
      },
    );
  }
  _handleListItemClick(String title, String userName){
    NavigatorUtils.goDisplayUserInfo(context, title, userName);
  }


///*********************测试异步获取数据进行页面显示****************************
//  Future<Customer> customerList;
//
//
//  Future<Customer> fetchData() async {
//    var res = await CustomerDao.getCustomerList("");
//    if (res != null && res.result) {
//      Customer customer = Customer.fromJson(res.data['result']['items'][0]);
//      return customer;
//    }
//  }
//  @override
//  void initState() {
//    // TODO: implement initState
//    super.initState();
//    customerList = fetchData();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    //super.build(context);
//    //return new StoreBuilder<CustomState>(
//    //  builder: (context, store) {
//    return new Scaffold(
//      body: new Center(
//        child: FutureBuilder<Customer>(
//          future: customerList,
//          builder: (context, snapshot) {
//            if (snapshot.hasData) {
//              return Text(snapshot.data.name);
//            } else if (snapshot.hasError) {
//              return Text("${snapshot.error}");
//            }
//            return CircularProgressIndicator();
//          },
//        ),
//      ),
//    );
//    //    },
//    //  );
//  }
///************************************************************
}
