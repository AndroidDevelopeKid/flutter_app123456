import 'package:flutter/material.dart';
///带图标的输入框
class CustomInputWidget extends StatefulWidget{
  final bool obscureText;//是否是密码

  final String hintText;//普通的placeholder，输入后就不显示了

  final IconData iconData;

  final ValueChanged<String> onChanged;

  final TextStyle textStyle;//文本样式

  final TextEditingController controller;//编辑框

  CustomInputWidget({Key key, this.hintText, this.iconData, this.onChanged, this.textStyle, this.controller, this.obscureText = false}) : super(key: key);

  @override
  _CustomInputWidgetState createState() => new _CustomInputWidgetState();
}
///State for [CustomInputWidget] widget
class _CustomInputWidgetState extends State<CustomInputWidget>{
  _CustomInputWidgetState() : super();

  @override
  Widget build(BuildContext context){
    return new TextField(
      controller: widget.controller,
      //style: new TextStyle(color: Colors.white),
      onChanged: widget.onChanged,
      obscureText: widget.obscureText,
      decoration: new InputDecoration(
        hintText: widget.hintText,
        icon: widget.iconData == null ? null : new Icon(widget.iconData),
      ),
    );
  }
}
