import 'package:flutter/material.dart';
import 'package:flutter_app123456/common/style/CustomStyle.dart';
import 'package:qr_flutter/qr_flutter.dart';

class BarCodeEnlargePage extends StatefulWidget {
  static final String name = "BarCodeEnlarge";

  final QrImage image;

  BarCodeEnlargePage(this.image, {Key key}) : super(key: key);

  _BarCodeEnlargePage createState() => _BarCodeEnlargePage(image);
}

class _BarCodeEnlargePage extends State<BarCodeEnlargePage> {
  final QrImage image;

  _BarCodeEnlargePage(this.image);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            iconSize: 15.0,
            icon: Icon(CustomIcons.BACK, color: Color(0xff4C88FF)),
            onPressed: () {
              Navigator.of(context).pop();
            }),
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        title:
            Text("最新提货单二维码", style: TextStyle(fontSize: 18.0, color: Colors.black)),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 10.0, right: 10.0, left: 10.0),
        child: Container(
          child: image,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2.0),
            border: Border.all(
              color: Color(0xffE2ECFF),
              width: 1.0,
              style: BorderStyle.solid,
            ),
          ),
        ),
      ),
    );
  }
}
