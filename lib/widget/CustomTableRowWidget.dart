import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app123456/common/style/CustomStyle.dart';

class CustomTableRowWidget extends StatelessWidget {
  final String textField;
  final String textFieldResult;

  CustomTableRowWidget(
    this.textField,
    this.textFieldResult, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.only(bottom: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            width: 135.0,
            child: Text(textField, style: CustomConstant.listFieldStyle),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15.0, right: 15.0),
            child: Text(
              "|",
              style: TextStyle(color: Color(0xffE2EAFF), fontSize: 12.0),
            ),
          ),
          SizedBox(
            width: 135.0,
            child: Text(
              textFieldResult,
              style: CustomConstant.listFieldResultStyle,
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }
}
