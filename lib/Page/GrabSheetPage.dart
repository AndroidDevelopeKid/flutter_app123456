import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app123456/common/config/Config.dart';
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
  bool isCheck = false;
  int color = CustomColors.white;
  var titles = ["排队信息", "最新提货单"];

  ///条目右侧箭头按钮
  var rightArrowIcon = new Image.asset(
    CustomIcons.ARROW_ICON,
    width: Config.ARROW_ICON_WIDTH,
    height: Config.ARROW_ICON_WIDTH,
  );

//  static const counterPlugin = const EventChannel('com.my.flutter/plugin');
//  static const rabbitPlugin = const EventChannel('com.my.flutter/rabbit');
//  StreamSubscription _counterSub;
//  StreamSubscription _msgSub;
//  var _count;
//  var _msg;

  @override
  void initState() {
    super.initState();
//    _startCounterPlugin();
//    _startRabbitPlugin();
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
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return new StoreBuilder<CustomState>(
      builder: (context, store) {
        return Scaffold(
          body: new ListView.builder(
            itemCount: titles.length * 2,
            itemBuilder: (context, i) => renderRow(i),
          )
        );
      },
    );

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
      var grabContainer = new Container(
        child:
        new Column(
          children: <Widget>[
            new Container(
              padding: EdgeInsets.only(
                  left: 20, top: 30, right: 20, bottom: 30),
              child: new CheckboxListTile(
                title: const Text('自动接单'),
                activeColor: Colors.lightGreen,
                value: this.isCheck,
                onChanged: (bool value) {
                  setState(() {
                    this.isCheck = !this.isCheck;
                  });
                },
              ),
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                new Column(
                  children: <Widget>[
                    new IconButton(
                      icon: new Icon(CustomIcons.MANUAL_RECEIPT, size: 80,),
                      onPressed: () {},
                      tooltip: "手动接单",
                      padding: EdgeInsets.only(right: 55.0, bottom: 65.0),
                    ),
                    new Text("手动接单"),
                  ],
                ),
                new Column(
                  children: <Widget>[
                    new IconButton(
                      icon: new Icon(CustomIcons.CANCEL_QUEUE, size: 80),
                      onPressed: () {},
                      tooltip: "取消排队",
                      padding: EdgeInsets.only(right: 55.0, bottom: 65.0),
                    ),
                    new Text("取消排队"),
                  ],
                ),
                new Column(
                  children: <Widget>[
                    new IconButton(
                      icon: new Icon(CustomIcons.QUEUE_REFRESH, size: 80),
                      onPressed: () {},
                      tooltip: "排队刷新",
                      padding: EdgeInsets.only(right: 55.0, bottom: 65.0),
                    ),
                    new Text("排队刷新"),
                  ],
                ),
              ],
            ),
            new Padding(padding: EdgeInsets.only(bottom: 30.0))
          ],
        ),
      );
      return new GestureDetector(
        onTap: () {},
        child: grabContainer,
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