import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app123456/common/style/CustomStyle.dart';
import 'package:flutter_app123456/widget/CustomTableRowWidget.dart';
import 'package:flutter_app123456/widget/MessageItem.dart';

class MessageDetailPage extends StatefulWidget {
  static final String name = "messageDetail";

  final MessageItemViewModel model;

  MessageDetailPage(this.model, {Key key}) : super(key: key);

  _MessageDetailPage createState() => _MessageDetailPage(model);
}

class _MessageDetailPage extends State<MessageDetailPage> {
  final MessageItemViewModel model;

  _MessageDetailPage(this.model);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              iconSize: 15.0,
              icon: Icon(CustomIcons.BACK, color: Color(0xff4C88FF)),
              onPressed: () {
                Navigator.pop(context, true);
                return Future.value(false);
              }),
          brightness: Brightness.light,
          backgroundColor: Colors.white,
          title: Text("信息显示",
              style: TextStyle(fontSize: 18.0, color: Colors.black)),
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 10.0),
          child: Container(
            child: Padding(
              padding: EdgeInsets.only(
                  top: 15.0, left: 25.0, right: 25.0, bottom: 15.0),
              child: Table(
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                children: <TableRow>[
                  TableRow(children: <Widget>[
                    CustomTableRowWidget(
                      "信息来源",
                      model.messageSource == "null" ? "无" : model.messageSource,
                    ),
                  ]),
                  TableRow(children: <Widget>[
                    CustomTableRowWidget(
                      "信息标识",
                      model.messageFlag == "null" ? "无" : model.messageFlag,
                    ),
                  ]),
                  TableRow(children: <Widget>[
                    CustomTableRowWidget(
                      "发送人",
                      model.senderUserName == "" ? "无" : model.senderUserName,
                    ),
                  ]),
                  TableRow(children: <Widget>[
                    CustomTableRowWidget(
                      "信息创建时间",
                      model.creationTime == "null"
                          ? "00-00 00:00"
                          : TimelineUtil.formatByDateTime(
                              DateTime.parse(model.creationTime),
                              dayFormat: DayFormat.Full),
                    ),
                  ]),
                  TableRow(children: <Widget>[
                    CustomTableRowWidget(
                      "信息内容",
                      model.msg == "null" ? "无内容" : model.msg,
                    ),
                  ]),
                ],
              ),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2.0),
              border: Border.all(
                color: Color(0xffF9FBFF),
                width: 1.0,
                style: BorderStyle.solid,
              ),
            ),
          ),
        ),
      ),
      onWillPop: _onBack,
    );
  }

  Future<bool> _onBack() {
    Navigator.pop(context, true);
    return Future.value(false);
  }
}
