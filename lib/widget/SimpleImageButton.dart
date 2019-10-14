import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ImageButton.dart';

/*
 * 常用图片按钮
 */
class SimpleImageButton extends StatefulWidget {
  final String normalImage;
  final String pressedImage;
  final Function onPressed;
  final double normalwidth;
  final double normalheight;
  final double pressedwidth;
  final double pressedheight;
  final String title;

  const SimpleImageButton({
    Key key,
    @required this.normalImage,
    @required this.pressedImage,
    @required this.onPressed,
    @required this.normalwidth,
    @required this.normalheight,
    @required this.pressedwidth,
    @required this.pressedheight,
    this.title,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SimpleImageButtonState();
  }
}

class _SimpleImageButtonState extends State<SimpleImageButton> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ImageButton(
      normalImage: Image(
        image: AssetImage(widget.normalImage),
        width: widget.normalwidth,
        height: widget.normalheight,
      ),
      pressedImage: Image(
        image: AssetImage(widget.pressedImage),
        width: widget.pressedwidth,
        height: widget.pressedheight,
      ),
      title: widget.title == null ? '' : widget.title,
      //文本是否为空
      normalStyle: TextStyle(
          color: Colors.white, fontSize: 14, decoration: TextDecoration.none),
      pressedStyle: TextStyle(
          color: Colors.white, fontSize: 14, decoration: TextDecoration.none),
      onPressed: widget.onPressed,
    );
  }
}

