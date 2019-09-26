import 'package:flutter/material.dart';
///自定义矩形按钮
class CustomFlexButton extends StatelessWidget{
  final String text;

  final Color color;

  final Color textColor;

  final VoidCallback onPress;

  final double fontSize;
  final int maxLines;

  final MainAxisAlignment mainAxisAlignment;

  CustomFlexButton({Key key, this.text, this.color, this.textColor, this.onPress, this.fontSize = 20.0, this.mainAxisAlignment = MainAxisAlignment.center, this.maxLines = 1})
      : super(key: key);

  @override
  Widget build(BuildContext context){
    return  new RaisedButton(
        padding: new EdgeInsets.only(left: 20.0, top: 10.0, right: 20.0, bottom: 10.0),//内边距
        textColor: textColor,
        color: color,
        child: new Flex(
          mainAxisAlignment: mainAxisAlignment,
          direction: Axis.horizontal,
          children: <Widget>[new Text(text, style: new TextStyle(fontSize: fontSize), maxLines: maxLines, overflow: TextOverflow.ellipsis)],//overflow文本溢出显示省略号
        ),
        onPressed: (){
          this.onPress?.call();
        },
      )
      ;
  }
}