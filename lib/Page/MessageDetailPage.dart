


import 'package:flutter/material.dart';
import 'package:flutter_app123456/common/style/CustomStyle.dart';
import 'package:flutter_app123456/widget/MessageItem.dart';

class MessageDetailPage extends StatefulWidget{
  static final String name = "messageDetail";

  final MessageItemViewModel model;

  MessageDetailPage(this.model, {Key key}) : super(key:key);

  _MessageDetailPage createState() => _MessageDetailPage(model);
}

class _MessageDetailPage extends State<MessageDetailPage>{
  final MessageItemViewModel model;
  _MessageDetailPage(this.model);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          appBar: new AppBar(
            title: new Text("信息显示"),
          ),

          body:
          new Card(
            color: Color(CustomColors.displayCardBackground),
            margin: const EdgeInsets.only(left: 20.0, top: 60.0, right: 20.0, bottom: 60),
            child: new Center(
              child: new Text(
                model.msg,
                style: CustomConstant.normalTextBlack,
              ),
            ),
          ),

        ),
        onWillPop: _onBack,
    );
  }
  Future<bool> _onBack(){
    try{}catch(e){}finally{}
    Navigator.pop(context, true);
    return Future.value(false);
}
}