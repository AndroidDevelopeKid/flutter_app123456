import 'package:flutter/material.dart';
import 'package:flutter_app123456/common/config/Config.dart';
import 'package:flutter_app123456/common/local/LocalStorage.dart';
import 'package:flutter_app123456/common/style/CustomStyle.dart';
import 'package:flutter_app123456/common/utils/CommonUtils.dart';
import 'package:flutter_app123456/common/utils/NavigatorUtils.dart';

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  var titles = ["我的二维码名片", "人员档案", "车辆档案", "人员及证件状态", "车辆状态"];

  var _userAvatar;
  var _userFullName;

  ///条目右侧箭头按钮
  var rightArrowIcon = new Image.asset(
    CustomIcons.ARROW_ICON,
    width: Config.ARROW_ICON_WIDTH,
    height: Config.ARROW_ICON_WIDTH,
  );

  Future<String> fetchDriverName() async {
    return await LocalStorage.get(Config.USER_NAME_KEY);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _userFullName = fetchDriverName();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return
        Container(
          decoration: BoxDecoration(
            image: new DecorationImage(
                image: AssetImage(CustomIcons.MY_BACKGROUND), fit: BoxFit.fill),
          ),
          child: Column(
            children: <Widget>[
              Padding(padding: EdgeInsets.symmetric(vertical: 40.0),),
              Container(
                width: 57.0,
                height: 57.0,
                decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 7.0),),
              FutureBuilder<String>(
                future: _userFullName,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(
                      snapshot.data,
                      style: TextStyle(color: Colors.white, fontSize: 15.0),
                    );
                  } else if (snapshot.hasError) {
                    return CommonUtils.showShort("获取用户名称失败！");
                  }
                  return SizedBox(
                      width: 6.0,
                      height: 6.0,
                      child: CircularProgressIndicator());
                },
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 40.0),
              ),
              InkWell(
                onTap: () {
                  //点击进入我的二维码名片界面
                  NavigatorUtils.goDisplayMyBarcode(context);
                },
                child: Container(
                  height: 50.0,
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: 15.0, bottom: 15.0, left: 15.0, right: 30.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(
                              CustomIcons.MY_BARCODE,
                              color: Color(0xff4C88FF),
                              size: 15.0,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 6.0, right: 6.0),
                            ),
                            Text(
                              "我的二维码名片",
                              style: TextStyle(fontSize: 15.0),
                            ),
                          ],
                        ),
                        Icon(
                          CustomIcons.ENTRY,
                          color: Color(0xffCCCCCC),
                          size: 15.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Divider(
                height: 1.0,
              ),
              InkWell(
                onTap: () {
                  //点击人员档案
                  NavigatorUtils.goDisplayUserFile(context);
                },
                child: Container(
                  height: 50.0,
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: 15.0, bottom: 15.0, left: 15.0, right: 30.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(
                              CustomIcons.USER_FILE,
                              color: Color(0xff4C88FF),
                              size: 15.0,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 6.0, right: 6.0),
                            ),
                            Text(
                              "人员档案",
                              style: TextStyle(fontSize: 15.0),
                            ),
                          ],
                        ),
                        Icon(
                          CustomIcons.ENTRY,
                          color: Color(0xffCCCCCC),
                          size: 15.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Divider(
                height: 1.0,
              ),
              InkWell(
                onTap: () {
                  //点击进入车辆档案界面
                  NavigatorUtils.goDisplayVehicleFile(context);
                },
                child: Container(
                  height: 50.0,
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: 15.0, bottom: 15.0, left: 15.0, right: 30.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(
                              CustomIcons.VEHICLE_FILE,
                              color: Color(0xff4C88FF),
                              size: 15.0,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 6.0, right: 6.0),
                            ),
                            Text(
                              "车辆档案",
                              style: TextStyle(fontSize: 15.0),
                            ),
                          ],
                        ),
                        Icon(
                          CustomIcons.ENTRY,
                          color: Color(0xffCCCCCC),
                          size: 15.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Divider(
                height: 1.0,
              ),
              InkWell(
                onTap: () {
                  //点击进入人员及证照状态界面
                  NavigatorUtils.goDisplayUserState(context);
                },
                child: Container(
                  height: 50.0,
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: 15.0, bottom: 15.0, left: 15.0, right: 30.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(
                              CustomIcons.USER_STATE,
                              color: Color(0xff4C88FF),
                              size: 15.0,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 6.0, right: 6.0),
                            ),
                            Text(
                              "人员及证照状态",
                              style: TextStyle(fontSize: 15.0),
                            ),
                          ],
                        ),
                        Icon(
                          CustomIcons.ENTRY,
                          color: Color(0xffCCCCCC),
                          size: 15.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Divider(
                height: 1.0,
              ),
              InkWell(
                onTap: () {
                  //点击进入车辆状态界面
                  NavigatorUtils.goDisplayVehicleState(context);
                },
                child: Container(
                  height: 50.0,
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: 15.0, bottom: 15.0, left: 15.0, right: 30.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(
                              CustomIcons.VEHICLE_STATE,
                              color: Color(0xff4C88FF),
                              size: 15.0,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 6.0, right: 6.0),
                            ),
                            Text(
                              "车辆状态",
                              style: TextStyle(fontSize: 15.0),
                            ),
                          ],
                        ),
                        Icon(
                          CustomIcons.ENTRY,
                          color: Color(0xffCCCCCC),
                          size: 15.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Divider(
                height: 1.0,
              ),
            ],
          ),
        );

//    var listView = new ListView.builder(
//      itemCount: titles.length * 2,
//      itemBuilder: (context, i) => renderRow(i),
//    );
//    return listView;
  }

//  renderRow(i) {
//    if (i == 0) {
//      var avatarContainer = new Container(
//        color:Colors.blue,
//        //Color(CustomColors.displayUsernameBackground),
//        height: 130.0,
//        child: new Center(
//          child: new Column(
//            mainAxisAlignment: MainAxisAlignment.center,
//            children: <Widget>[
//              _userAvatar == null
//                  ? new Image.asset(CustomIcons.LOGIN_FACE_IMAGE_MY)
//                  : new Container(
//                      width: 40.0,
//                      height: 40.0,
//                      decoration: new BoxDecoration(
//                        shape: BoxShape.circle,
//                        color: Colors.transparent,
//                        image: new DecorationImage(
//                            image: new NetworkImage(_userAvatar),
//                            fit: BoxFit.cover),
//                        border: new Border.all(
//                          color: Colors.white,
//                          width: 2.0,
//                        ),
//                      ),
//                    ),
//              FutureBuilder<String>(
//                future: _userFullName,
//                builder: (context, snapshot) {
//                  if (snapshot.hasData) {
//                    return Text(
//                      snapshot.data,
//                      style: CustomConstant.normalTextBlack,
//                    );
//                  } else if (snapshot.hasError) {
//                    return Text("${snapshot.error}");
//                  }
//                  return CircularProgressIndicator();
//                },
//              ),
//            ],
//          ),
//        ),
//      );
//      return new GestureDetector(
//        onTap: () {},
//        child: avatarContainer,
//      );
//    }
//    --i;
//    if (i.isOdd) {
//      //判断是否为奇数
//      return new Divider(
//        height: 1.0,
//      );
//    }
//    i = i ~/ 2;
//    String title = titles[i];
//    var listItemContent = new Padding(
//      padding: const EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
//      child: new Row(
//        children: <Widget>[
//          //new Image.asset(CustomIcons.LEFT_DISPLAY_IMAGE),
//          new Expanded(
//              child: new Text(
//            title,
//            style: CustomConstant.normalTextBlack,
//          )),
//          rightArrowIcon
//        ],
//      ),
//    );
//    return new InkWell(
//      child: listItemContent,
//      onTap: () {
//        _handleListItemClick(title);
//      },
//    );
//  }
//
//  _handleListItemClick(String title) {
//    NavigatorUtils.goDisplayUserInfo(context, title);
//  }

}
