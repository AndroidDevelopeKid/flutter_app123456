import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app123456/common/config/Config.dart';
import 'package:flutter_app123456/common/dao/DeliveryOrderDao.dart';
import 'package:flutter_app123456/common/dao/GrabSheetDao.dart';
import 'package:flutter_app123456/common/model/AutoOrderState.dart';
import 'package:flutter_app123456/common/redux/CustomState.dart';
import 'package:flutter_app123456/common/style/CustomStyle.dart';
import 'package:flutter_app123456/common/utils/CommonUtils.dart';
import 'package:flutter_app123456/common/utils/NavigatorUtils.dart';
import 'package:flutter_app123456/widget/BaseMessagePushState.dart';
import 'package:flutter_app123456/widget/CustomFlexButton.dart';
import 'package:flutter_redux/flutter_redux.dart';

class GrabSheetPage extends StatefulWidget {
  _GrabSheetPageState createState() => _GrabSheetPageState();
}

class _GrabSheetPageState extends State<GrabSheetPage>
    with AutomaticKeepAliveClientMixin {
  //bool isCheck = false;
  bool isQueue;
  bool isBill;
  //Future<AutoOrderState> orderStateInit;
  //AutoOrderState orderStateInit;
  Future<bool> autoState;
  int color = CustomColors.white;
  var titles = ["排队信息", "最新提货单"];

  ///条目右侧箭头按钮
  var rightArrowIcon = new Image.asset(
    CustomIcons.ARROW_ICON,
    width: Config.ARROW_ICON_WIDTH,
    height: Config.ARROW_ICON_WIDTH,
  );
  Future<bool> _getOrderState() async {
    var res = await GrabSheetDao.getAutoAcceptOrderState();
    if(res != null && res.result){
      if(res.data["result"] != null){
        AutoOrderState autoOrderState = AutoOrderState.fromJson(res.data["result"]);
        print("当前状态：" + autoOrderState.autoAcceptOrderState.toString() + "--" + autoOrderState.nowDeliveryOrderState.toString() + "---" + autoOrderState.nowOrderQueueState.toString());

        if(autoOrderState.autoAcceptOrderState == 1){
          return true;
        }
        if(autoOrderState.autoAcceptOrderState == 2){
          return false;
        }
      }
    }
  }

//  static const counterPlugin = const EventChannel('com.my.flutter/plugin');
//  static const rabbitPlugin = const EventChannel('com.my.flutter/rabbit');
//  StreamSubscription _counterSub;
//  StreamSubscription _msgSub;
//  var _count;
//  var _msg;

  @override
  void initState() {
    super.initState();
    autoState = _getOrderState();
//    _startCounterPlugin();
//    _startRabbitPlugin();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

  }

  @override
  void dispose() {
    super.dispose();
//    _endCounterPlugin();
//    _endRabbitPlugin();
  }

//  void _startCounterPlugin(){
//    if(_counterSub == null){
//      _counterSub =  counterPlugin.receiveBroadcastStream().listen(_onCounterEvent,onError: _onCounterError);
//    }
//  }
//  void _startRabbitPlugin(){
//    if(_msgSub == null){
//      _msgSub =  rabbitPlugin.receiveBroadcastStream().listen(_onRabbitEvent,onError: _onRabbitError);
//    }
//  }
//
//  void _endCounterPlugin(){
//    if(_counterSub != null){
//      _counterSub.cancel();
//    }
//  }
//  void _endRabbitPlugin(){
//    if(_msgSub != null){
//      _msgSub.cancel();
//    }
//  }
//
//  void _onCounterEvent(Object event) {
//    setState(() {
//      _count = event;
//    });
//  }
//  void _onRabbitEvent(Object event) {
//    setState(() {
//      _msg = event;
//    });
//  }
//
//  void _onCounterError(Object error) {
//    setState(() {
//      _count = "计时器异常";
//      print(error);
//    });
//  }
//  void _onRabbitError(Object error) {
//    setState(() {
//      _msg = "数据异常";
//      print(error);
//    });
//  }

  @override
  bool get wantKeepAlive => false;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        body:
            new Column(
              children: <Widget>[
                new Container(
                  child: FutureBuilder<bool>(
                      future: autoState,
                      builder: (context, snapshot){
                        print("snapshot: " + snapshot.data.toString());
                        if (snapshot.hasData) {
                          bool isCheck = snapshot.data;
                          return new Column(
                            children: <Widget>[
                              new Container(
                                padding: EdgeInsets.only(
                                    left: 20, top: 30, right: 20, bottom: 30),
                                child:
                                new CheckboxListTile(
                                  title: const Text('自动接单'),
                                  activeColor: Colors.lightGreen,
                                  value: isCheck,
                                  onChanged: (newValue) {
                                    setState(() {
                                      autoState = _getOrderState();
                                      isCheck = newValue;
                                    });
                                    //调取自动接单按钮开闭接口，通知服务端
                                    GrabSheetDao.driverAutoGrabSheetSwitch(isCheck).then((res){
                                      if(res != null && res.result){
                                        new Future.delayed(const Duration(milliseconds: 10), (){
                                          if(isCheck){
                                            CommonUtils.showShort("您已开启自动接单");
                                          }else{
                                            CommonUtils.showShort("您已关闭自动接单");
                                          }
                                          return true;
                                        });
                                      }
                                    });
                                  },
                                ),

                              ),
                              new Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  new Column(
                                    children: <Widget>[
                                      new IconButton(
                                        icon: new Image.asset(CustomIcons.MANUAL_RECEIPT_IMAGE),
                                        iconSize: Config.ICON_SIZE,
                                        //new Icon(CustomIcons.MANUAL_RECEIPT, size: Config.ICON_SIZE,),
                                        onPressed: () {
                                          //点击手动接单，调用手动接单接口，调用成功后，然后调用自动接单开关接口，告诉服务器开关状态并返回提示
                                          GrabSheetDao.driverGrabSheetQueue().then((res){
                                            if(res != null && res.result){
                                              new Future.delayed(const Duration(milliseconds: 100), (){
                                                CommonUtils.showShort("已排队");

                                              });
                                            }
                                            if(res != null && !res.result){
                                              print("手动接单 错误提示： " + res.data.toString());
                                              new Future.delayed(const Duration(milliseconds: 100), (){
                                                CommonUtils.showShort("" + res.data["error"]["message"].toString());
                                                return true;
                                              });
                                            }
                                          });
                                        },
                                        tooltip: "手动接单",
                                        //padding: EdgeInsets.only(right: 40.0, bottom: 45.0),
                                      ),
                                      new Text("手动接单"),
                                    ],
                                  ),

                                ],
                              ),
                              new Padding(padding: EdgeInsets.only(bottom: 30.0))
                            ],
                          );
                        } else if (snapshot.hasError) {
                          return Text("${snapshot.error}");
                        }
                        return CircularProgressIndicator();

                      }),


                ),
                new Expanded(child: new ListView.builder(
                  itemCount: titles.length * 2,
                  itemBuilder: (context, i) => renderRow(i),
                )),

            ],)



    );



//    return new FutureBuilder<AutoOrderState>(
//      future: orderStateInit,
//      builder: (context, snapshot) {
//        if(snapshot.hasData){
//          if(snapshot.data.autoAcceptOrderState == 1){
//            isCheck = true;
//          }
//          if(snapshot.data.autoAcceptOrderState == 2){
//            isCheck = false;
//          }
//        }
//
//      },
//    );

//    return new Scaffold(
//      body:new Container(
//        child: new Column(
//          mainAxisAlignment: MainAxisAlignment.start,
//          ///在主轴方向占有空间的值，默认是max，最大化主轴方向的可用空间，min相反
//          mainAxisSize: MainAxisSize.max,
//          children: <Widget>[
//
////            new Padding(
////              padding: const EdgeInsets.only(
////                  left: 10.0, top: 10.0, right: 10.0),
////              child: new Text('这是一个从原生发射过来的计时器：$_count，数据：$_msg'),
////            ),
//            new CheckboxListTile(
//              title: const Text('自动接单'),
//              value: this.isCheck,
//              onChanged: (bool value) {
//                setState(() {
//                  this.isCheck = !this.isCheck;
//                });
//              },
//            ),
//
//
//            new CustomFlexButton(
//              text:  CommonUtils.getLocale(context).receiptText,
//              color: Theme.of(context).primaryColor,
//              textColor: Color(CustomColors.textWhite),
//              onPress: (){
//                //调排队接口，返回信息提示
//              },
//            ),
//
//
//
//          ],
//        ),
//
//
//      ),
//
//
//
//    );
  }
  renderRow(i) {
    if (i == 0) {
//      var grabContainer =
//      new Container(
//        child: FutureBuilder<bool>(
//            future: autoState,
//            builder: (context, snapshot){
//              print("snapshot: " + snapshot.data.toString());
//              if (snapshot.hasData) {
//                bool isCheck = snapshot.data;
//                return new Column(
//                  children: <Widget>[
//                    new Container(
//                      padding: EdgeInsets.only(
//                          left: 20, top: 30, right: 20, bottom: 30),
//                      child:
//                      new CheckboxListTile(
//                        title: const Text('自动接单'),
//                        activeColor: Colors.lightGreen,
//                        value: isCheck,
//                        onChanged: (bool value) {
//                          setState(() {
//                            isCheck = !isCheck;
//                          });
//                          //调取自动接单按钮开闭接口，通知服务端
//                          GrabSheetDao.driverAutoGrabSheetSwitch(isCheck).then((res){
//                            if(res != null && res.result){
//                              new Future.delayed(const Duration(milliseconds: 100), (){
//                                if(isCheck){
//                                  CommonUtils.showShort("您已开启自动接单");
//                                }else{
//                                  CommonUtils.showShort("您已关闭自动接单");
//                                }
//                                return true;
//                              });
//                            }
//                          });
//                        },
//                      ),
//
//                    ),
//                    new Row(
//                      mainAxisAlignment: MainAxisAlignment.spaceAround,
//                      children: <Widget>[
//                        new Column(
//                          children: <Widget>[
//                            new IconButton(
//                              icon: new Image.asset(CustomIcons.MANUAL_RECEIPT_IMAGE),
//                              iconSize: Config.ICON_SIZE,
//                              //new Icon(CustomIcons.MANUAL_RECEIPT, size: Config.ICON_SIZE,),
//                              onPressed: () {
//                                //点击手动接单，调用手动接单接口，调用成功后，然后调用自动接单开关接口，告诉服务器开关状态并返回提示
//                                GrabSheetDao.driverGrabSheetQueue().then((res){
//                                  if(res != null && res.result){
//                                    new Future.delayed(const Duration(milliseconds: 100), (){
//                                      CommonUtils.showShort("已排队");
//
//                                    });
//                                  }
//                                  if(res != null && !res.result){
//                                    print("手动接单 错误提示： " + res.data.toString());
//                                    new Future.delayed(const Duration(milliseconds: 100), (){
//                                      CommonUtils.showShort("" + res.data["error"]["message"].toString());
//                                      return true;
//                                    });
//                                  }
//                                });
//                              },
//                              tooltip: "手动接单",
//                              //padding: EdgeInsets.only(right: 40.0, bottom: 45.0),
//                            ),
//                            new Text("手动接单"),
//                          ],
//                        ),
//                        new Column(
//                          children: <Widget>[
//                            new IconButton(
//                              icon: new Image.asset(CustomIcons.CANCEL_QUEUE_IMAGE),
//                              iconSize: Config.ICON_SIZE,
//                              //new Icon(CustomIcons.CANCEL_QUEUE, size: Config.ICON_SIZE),
//                              onPressed: () {
//                                GrabSheetDao.cancelQueue().then((res){
//                                  if(res != null && res.result){
//                                    new Future.delayed(const Duration(milliseconds: 100), (){
//                                      CommonUtils.showShort("取消排队成功");
//                                      return true;
//                                    });
//                                  }
//                                  if(res != null && !res.result){
//                                    new Future.delayed(const Duration(milliseconds: 100), (){
//                                      CommonUtils.showShort("" + res.data["error"]["message"].toString());
//                                      return true;
//                                    });
//                                  }
//                                });
//                              },
//                              tooltip: "取消排队",
//                              //padding: EdgeInsets.only(right: 40.0, bottom: 45.0),
//                            ),
//                            new Text("取消排队"),
//                          ],
//                        ),
//                        new Column(
//                          children: <Widget>[
//                            new IconButton(
//                              icon: new Image.asset(CustomIcons.QUEUE_REFRESH_IMAGE),
//                              iconSize: Config.ICON_SIZE,
//                              //new Icon(CustomIcons.QUEUE_REFRESH, size: Config.ICON_SIZE),
//                              onPressed: () {
//                                GrabSheetDao.getCurrentQueueInfo().then((res){
//                                  if(res != null && res.result){
//                                    new Future.delayed(const Duration(milliseconds: 100), (){
//                                      CommonUtils.showShort("刷新排队成功");
//                                      return true;
//                                    });
//                                  }
//                                  if(res != null && !res.result){
//                                    new Future.delayed(const Duration(milliseconds: 100), (){
//                                      CommonUtils.showShort("" + res.data["error"]["message"].toString());
//                                      return true;
//                                    });
//                                  }
//                                });
//                              },
//                              tooltip: "排队刷新",
//                              //padding: EdgeInsets.only(right: 40.0, bottom: 45.0),
//                            ),
//                            new Text("排队刷新"),
//                          ],
//                        ),
//                      ],
//                    ),
//                    new Padding(padding: EdgeInsets.only(bottom: 30.0))
//                  ],
//                );
//              } else if (snapshot.hasError) {
//                return Text("${snapshot.error}");
//              }
//              return CircularProgressIndicator();
//
//            }),
//
//
//      );
//      return new GestureDetector(
//        onTap: () {},
//        child: grabContainer,
//      );
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
    NavigatorUtils.goDisplayQueueInfo(context, title);
  }


}