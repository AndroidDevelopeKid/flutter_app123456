


import 'package:common_utils/common_utils.dart';
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
            //margin: const EdgeInsets.only(left: 20.0, top: 30.0, right: 20.0, bottom: 30),
            margin: EdgeInsets.only(top: 6.0, bottom: 6.0, left: 4.0, right: 4.0),
            elevation: 8.0,
            child: new Container(
              child:new Table(
                border: TableBorder.all(color: Colors.white, width: 2.0, style: BorderStyle.solid),
                children: <TableRow>[
                  TableRow(
                      children: <Widget>[
                        Text("信息来源：", style: CustomConstant.normalTextBlack),
                        Text(model.messageSource == "null" ? "无" : model.messageSource, style: CustomConstant.normalTextBlack),
                      ]
                  ),
                  TableRow(
                      children: <Widget>[
                        Text("信息标识：", style: CustomConstant.normalTextBlack),
                        Text(model.messageFlag == "null" ? "无" : model.messageFlag, style: CustomConstant.normalTextBlack),
                      ]
                  ),
                  TableRow(
                      children: <Widget>[
                        Text("发送人：", style: CustomConstant.normalTextBlack),
                        Text(model.senderUserName == "" ? "无" : model.senderUserName, style: CustomConstant.normalTextBlack),
                      ]
                  ),
                  TableRow(
                      children: <Widget>[
                        Text("信息创建时间：", style: CustomConstant.normalTextBlack),
                        Text(model.creationTime == "null" ? "00-00 00:00" : TimelineUtil.formatByDateTime(DateTime.parse(model.creationTime), dayFormat: DayFormat.Full), style: CustomConstant.normalTextBlack),
                      ]
                  ),
                  TableRow(
                      children: <Widget>[
                        Text("信息内容：", style: CustomConstant.normalTextBlack),
                        Text(model.msg == "null" ? "无内容" : model.msg, style: CustomConstant.normalTextBlack),
                  ]
                  ),
                ],
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(
                  color: Colors.white,
                  width: 0.7,
                  style: BorderStyle.solid,
                ),
              ),
              padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 12.0, bottom: 12.0),
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