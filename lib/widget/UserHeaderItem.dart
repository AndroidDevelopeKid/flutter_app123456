

import 'package:flutter/material.dart';
import 'package:flutter_app123456/common/model/User.dart';
import 'package:flutter_app123456/common/model/UserOrg.dart';
import 'package:flutter_app123456/common/style/CustomStyle.dart';

class UserHeaderItem extends StatelessWidget{
  final User userInfo;

  final String beStaredCount;

  final Color notifyColor;

  final Color themeColor;

  final VoidCallback refreshCallBack;

  final List<UserOrg> orgList;

  UserHeaderItem(this.userInfo, this.beStaredCount, this.themeColor, {this.notifyColor, this.refreshCallBack, this.orgList});
  ///底部状态栏
  _getBottomItem(String title, var value, onPressed){
    String data = value == null ? "" : value.toString();
    TextStyle valueStyle = (value != null && value.toString().length > 6) ? CustomConstant.minText : CustomConstant.smallSubLightText;
    TextStyle titleStyle = (title != null && title.toString().length > 6) ? CustomConstant.minText : CustomConstant.smallSubLightText;

    return new Expanded(
      child: new Center(
        child: new RawMaterialButton(
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          padding: EdgeInsets.only(top: 5.0),
          constraints: const BoxConstraints(minWidth: 0.0, minHeight: 0.0),
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(text: title, style: titleStyle),
                TextSpan(text: "\n", style: valueStyle),
                TextSpan(text: data, style: valueStyle)
              ],
            ),
          ),
          onPressed: onPressed,
        ),
      ),

    );
  }

  ///通知Icon
  _getNotifyIcon(BuildContext context, Color color){
    if(notifyColor == null){
      return Container();
    }
    return new RawMaterialButton(//无主题button
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,//目标尺寸缩小到材料规格提供的最小值
      padding: const EdgeInsets.only(top: 0.0, right: 5.0, left: 5.0),
      constraints: const BoxConstraints(minWidth: 0.0, minHeight: 0.0),
      child: new ClipOval(
        child: new Icon(
          CustomIcons.USER_NOTIFY,
          color: color,
          size: 18.0,
        ),
      ),//圆形裁剪
      onPressed: (){
//        NavigatorUtils.goNotifyPage(context).then((res){
//          refreshCallBack?.call();
//        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[

        new Container(
            child: new Text(
              "message"
            ),
           ),

      ],
    );
  }


}