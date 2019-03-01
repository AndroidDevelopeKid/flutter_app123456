

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app123456/common/style/CustomStyle.dart';
import 'package:flutter_app123456/common/utils/CommonUtils.dart';
import 'package:flutter_app123456/widget/BaseMessagePushState.dart';
import 'package:flutter_app123456/widget/CustomFlexButton.dart';

class GrabSheetPage extends StatefulWidget{
  _GrabSheetPageState createState() => _GrabSheetPageState();
}

class _GrabSheetPageState extends State<GrabSheetPage> with AutomaticKeepAliveClientMixin{
  bool isCheck = false;
  int color = CustomColors.white;

  static const counterPlugin = const EventChannel('com.my.flutter/plugin');
  StreamSubscription _counterSub;
  var _count;

  @override
  void initState(){
    super.initState();
    _startCounterPlugin();
  }

  @override
  void dispose() {
    super.dispose();
    _endCounterPlugin();
  }

  void _startCounterPlugin(){
    if(_counterSub == null){
      _counterSub =  counterPlugin.receiveBroadcastStream().listen(_onCounterEvent,onError: _onCounterError);
    }
  }

  void _endCounterPlugin(){
    if(_counterSub != null){
      _counterSub.cancel();
    }
  }

  void _onCounterEvent(Object event) {
    setState(() {
      _count = event;
    });
  }

  void _onCounterError(Object error) {
    setState(() {
      _count = "计时器异常";
      print(error);
    });
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      body:new Container(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.end,
          ///在主轴方向占有空间的值，默认是max，最大化主轴方向的可用空间，min相反
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            new Expanded(
                child: new Card(
                  color: Color(CustomColors.displayUsernameBackground),

                  child: new Center(
                    child: new Text(
                      "您已接单，请到消息页面刷新查看接单信息！",
                      style: CustomConstant.normalTextBlack,
                    ),
                  ),
                ),
            ),
            new Padding(
              padding: const EdgeInsets.only(
                  left: 10.0, top: 10.0, right: 10.0),
              child: new Text('这是一个从原生发射过来的计时器：$_count'),
            ),


            new CustomFlexButton(

              text:  CommonUtils.getLocale(context).receiptText,
              color: Theme.of(context).primaryColor,
              textColor: Color(CustomColors.textWhite),
              onPress: (){

              },
            ),
            new CheckboxListTile(
              title: const Text('自动接单'),
              value: this.isCheck,
              onChanged: (bool value) {
                setState(() {
                  this.isCheck = !this.isCheck;
                });
              },
            ),


          ],
        ),


      ),
//      floatingActionButton: new FloatingActionButton(
//          child: new Text("接单"),
//          foregroundColor: new Color(color),
//          elevation: 7.0,
//          highlightElevation: 14.0,
//          mini: false,
//          tooltip: "按这么长时间干嘛",
//          onPressed:(){
//            _buttonDisable();
//            Scaffold.of(context).showSnackBar(new SnackBar(
//              content: new Text("按钮被点击！"),
//            ));
//
//          }
//      ),
//      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,


    );
  }


  _buttonDisable(){
    setState(() {
      color = CustomColors.subLightTextColor;
    });
  }
}