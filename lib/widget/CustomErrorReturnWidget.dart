import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app123456/common/style/CustomStyle.dart';

class CustomErrorReturnWidget extends StatelessWidget {


  CustomErrorReturnWidget({
        Key key,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height - 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: 99.0,
            height: 73.0,
            child: Image.asset(CustomIcons.NO_MORE),
          ),
          SizedBox(
            width: 99.0,
            height: 10.0,
          ),
          Text(
            "系统开小差了，当前用户无该权限",
            style: TextStyle(color: Color(0xff4C88FF), fontSize: 15.0),
          )
        ],
      ),
    );
  }
}
