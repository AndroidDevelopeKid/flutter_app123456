


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
      appBar: new AppBar(
        title: new Text("二维码"),
      ),
      body: new Center(
        child: image,
      )
    );
  }


}