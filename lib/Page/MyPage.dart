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

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  var titles = ["人员档案", "车辆档案", "人员及证件状态", "车辆状态"];

  var _userAvatar;
  var _userFullName;

  ///条目右侧箭头按钮
  var rightArrowIcon = new Image.asset(
    CustomIcons.ARROW_ICON,
    width: Config.ARROW_ICON_WIDTH,
    height: Config.ARROW_ICON_WIDTH,
  );

  Future<String> fetchDriverName() async{
    return  await LocalStorage.get(Config.USER_NAME_KEY);
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _userFullName = fetchDriverName();
  }


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
        color:Colors.blue,
        //Color(CustomColors.displayUsernameBackground),
        height: 130.0,
        child: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _userAvatar == null
                  ? new Image.asset(CustomIcons.LOGIN_FACE_IMAGE_MY)
//                  new Icon(
//                      CustomIcons.LOGIN_FACE,
//                      size: 40.0,
//                    )
                  : new Container(
                      width: 40.0,
                      height: 40.0,
                      decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.transparent,
                        image: new DecorationImage(
                            image: new NetworkImage(_userAvatar),
                            fit: BoxFit.cover),
                        border: new Border.all(
                          color: Colors.white,
                          width: 2.0,
                        ),
                      ),
                    ),
              FutureBuilder<String>(
                future: _userFullName,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(
                      snapshot.data,
                      style: CustomConstant.normalTextBlack,
                    );
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }
                  return CircularProgressIndicator();
                },
              ),
//              new Text(
//                _userFullName == null ? "" : _userFullName,
//                style: CustomConstant.normalTextBlack,
//              ),
            ],
          ),
        ),
      );
      return new GestureDetector(
        onTap: () {},
        child: avatarContainer,
      );
    }
    --i;
    if (i.isOdd) {
      //判断是否为奇数
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
          //new Image.asset(CustomIcons.LEFT_DISPLAY_IMAGE),
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
        _handleListItemClick(title);
      },
    );
  }

  _handleListItemClick(String title) {
    NavigatorUtils.goDisplayUserInfo(context, title);
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
