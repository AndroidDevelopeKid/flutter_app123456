


import 'package:flutter/material.dart';
import 'package:flutter_app123456/common/style/CustomStyle.dart';
import 'package:qr_flutter/qr_flutter.dart';

class BarCodeEnlargePage extends StatefulWidget{
  static final String name = "BarCodeEnlarge";

  final QrImage image;

  BarCodeEnlargePage(this.image, {Key key}) : super(key:key);

  _BarCodeEnlargePage createState() => _BarCodeEnlargePage(image);
}

class _BarCodeEnlargePage extends State<BarCodeEnlargePage>{
  final QrImage image;

  _BarCodeEnlargePage(this.image);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: CustomColors.listBackground,
      appBar: new AppBar(
        title: new Text("二维码"),
      ),
      body: new Center(
        child: Card(
          color: Color(CustomColors.displayCardBackground),
          //margin: const EdgeInsets.only(left: 20.0, top: 30.0, right: 20.0, bottom: 30),
          margin: EdgeInsets.only(top: 6.0, bottom: 6.0, left: 4.0, right: 4.0),
          elevation: 8.0,
          child:
          new Container(
            child: image,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(
                color: CustomColors.listBackground,
                width: 0.7,
                style: BorderStyle.solid,
              ),
            ),
            padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 12.0, bottom: 12.0),
          ),
        ),
      )
    );
  }


}