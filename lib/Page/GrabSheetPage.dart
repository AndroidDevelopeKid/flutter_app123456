import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_app123456/common/config/Config.dart';
import 'package:flutter_app123456/common/dao/GrabSheetDao.dart';
import 'package:flutter_app123456/common/model/AutoOrderState.dart';
import 'package:flutter_app123456/common/style/CustomStyle.dart';
import 'package:flutter_app123456/common/utils/CommonUtils.dart';
import 'package:flutter_app123456/common/utils/NavigatorUtils.dart';

class GrabSheetPage extends StatefulWidget {
  _GrabSheetPageState createState() => _GrabSheetPageState();
}

class _GrabSheetPageState extends State<GrabSheetPage>
    with AutomaticKeepAliveClientMixin {
  bool isQueue;
  bool isBill;

  Future<int> autoState;
  bool offstage;
  int color = CustomColors.white;
  var titles = ["排队信息", "最新提货单"];

  ///条目右侧箭头按钮
  var rightArrowIcon = new Image.asset(
    CustomIcons.ARROW_ICON,
    width: Config.ARROW_ICON_WIDTH,
    height: Config.ARROW_ICON_WIDTH,
  );

  Future<int> _getOrderState() async {
    var res = await GrabSheetDao.getAutoAcceptOrderState();
    if (res != null && res.result) {
      if (res.data["result"] != null) {
        AutoOrderState autoOrderState =
            AutoOrderState.fromJson(res.data["result"]);
        print("当前状态：" +
            autoOrderState.autoAcceptOrderState.toString() +
            "--" +
            autoOrderState.nowDeliveryOrderState.toString() +
            "---" +
            autoOrderState.nowOrderQueueState.toString());

        if (autoOrderState.autoAcceptOrderState == 1) {
          return 1;
        }
        if (autoOrderState.autoAcceptOrderState == 2) {
          return 2;
        }
      }
    } else {
      return 3;
    }
  }

  @override
  void initState() {
    super.initState();
    autoState = _getOrderState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  bool get wantKeepAlive => false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    super.build(context);
    return Scaffold(
      appBar: new AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        title: Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 15.0, top: 15.0, bottom: 9.0),
              child: Image.asset("assets/images/statelogo.png"),
            ),
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Container(
              height: 110.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch, //子控件填满交叉轴
                children: <Widget>[
                  Expanded(
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3.0)),
                      color: Color(0xff6889FF),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "自动接单",
                            style:
                                TextStyle(fontSize: 15.0, color: Colors.white),
                          ),
                          FutureBuilder<int>(
                              future: autoState,
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  if (snapshot.data == 1) {
                                    offstage = false;
                                    return Offstage(
                                        offstage: offstage,
                                        child: Column(
                                          children: <Widget>[
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 5.0),
                                            ),
                                            Container(
                                              height: 13.0,
                                              child: Image.asset(
                                                  CustomIcons.RIGHT),
                                            ),
                                          ],
                                        ));
                                  }
                                  if (snapshot.data == 2) {
                                    offstage = true;
                                    return Offstage(
                                        offstage: offstage,
                                        child: Column(
                                          children: <Widget>[
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 5.0),
                                            ),
                                            Container(
                                              height: 13.0,
                                              child: Image.asset(
                                                  CustomIcons.RIGHT),
                                            ),
                                          ],
                                        ));
                                  }

                                  if (snapshot.data == 3) {
                                    offstage = false;
                                    return Offstage(
                                        offstage: offstage,
                                        child: Column(
                                          children: <Widget>[
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 5.0),
                                            ),
                                            Container(
                                              height: 13.0,
                                              child: Text("当前用户无该权限！", style: TextStyle(fontSize: 10.0, color: Colors.white),),
                                            ),
                                          ],
                                        ));
                                  }
                                } else if (snapshot.hasError) {
                                  return CommonUtils.showShort("获取自动接单失败！");
                                }
                                return SizedBox(
                                    width: 6.0,
                                    height: 6.0,
                                    child: CircularProgressIndicator());
                              }),
                        ],
                      ),
                      onPressed: () {
                        //调取自动接单按钮开闭接口，通知服务端
                        if (offstage != null) {
                          GrabSheetDao.driverAutoGrabSheetSwitch(offstage)
                              .then((res) {
                            if (res != null && res.result) {
                              new Future.delayed(
                                  const Duration(milliseconds: 10), () {
                                if (offstage) {
                                  setState(() {
                                    //offstage = false;
                                    autoState = _getOrderState();
                                  });
                                  CommonUtils.showShort("您已开启自动接单");
                                } else {
                                  setState(() {
                                    //offstage = true;
                                    autoState = _getOrderState();
                                  });
                                  CommonUtils.showShort("您已关闭自动接单");
                                }
                                return true;
                              });
                            }
                          });
                        } else {
                          CommonUtils.showShort("请稍后再尝试");
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.0),
                  ),
                  Expanded(
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3.0)),
                      color: Color(0xff7D68FF),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "手动接单",
                            style:
                                TextStyle(fontSize: 15.0, color: Colors.white),
                          ),
                        ],
                      ),
                      onPressed: () {
                        //点击手动接单，调用手动接单接口，调用成功后，然后调用自动接单开关接口，告诉服务器开关状态并返回提示
                        GrabSheetDao.driverGrabSheetQueue().then((res) {
                          if (res != null && res.result) {
                            new Future.delayed(
                                const Duration(milliseconds: 100), () {
                              CommonUtils.showShort("已排队");
                            });
                          }
                          if (res != null && !res.result) {
                            print("手动接单 错误提示： " + res.data.toString());
                            new Future.delayed(
                                const Duration(milliseconds: 100), () {
                              CommonUtils.showShort(
                                  "" + res.data["error"]["message"].toString());
                              return true;
                            });
                          }
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Divider(
            height: 1.0,
          ),
          InkWell(
            onTap: () {
              //点击进入排队信息界面
              NavigatorUtils.goDisplayQueueInfo(context);
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
                          CustomIcons.QUEUE_INFO,
                          color: Color(0xff4C88FF),
                          size: 15.0,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 6.0, right: 6.0),
                        ),
                        Text(
                          "排队信息",
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
              //点击进入最新提货单界面
              NavigatorUtils.goDisplayLastedBill(context);
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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          CustomIcons.LASTED_BILL,
                          color: Color(0xff4C88FF),
                          size: 15.0,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5.0, right: 5.0),
                        ),
                        Text(
                          "最新提货单",
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
  }
}
