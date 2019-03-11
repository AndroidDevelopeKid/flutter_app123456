import 'package:flutter/material.dart';

///颜色
class CustomColors{
  static const int cardWhite = 0xFFFFFFFF;
  static const int textWhite = 0xFFFFFFFF;
  static const int white = 0xFFFFFFFF;
  static const int black = 0xFF000000;
  static const int lightBlue = 0xFF00FFFF;
  static const int primaryDarkValue = 0xFF121917;
  static const int subLightTextColor = 0xffc4c4c4;

  static const int displayUsernameBackground = 0xFFF44336;

  static const String toastBackgroundColor = "#63CA6C";
  static const String toastTextColor = "#ffffff";

  static const int mainTextColor = primaryDarkValue;
  static const int textColorWhite = white;
  static const int textColorBlack = black;

  //static const int defaultColor =
}
///图标
class CustomIcons{
  static const String FONT_FAMILY = 'MaterialIcons';

  static const String DEFAULT_USER_ICON = 'lib/static/images/logo.jpg';
  static const String WELCOME_ICON= "lib/static/images/welcome.jpg";

  static const String ARROW_ICON = "lib/static/images/ic_arrow_right.png";


  static const IconData LOGIN_COMPANY = const IconData(0xe84f, fontFamily: CustomIcons.FONT_FAMILY);
  static const IconData LOGIN_PW = const IconData(0xe312, fontFamily: CustomIcons.FONT_FAMILY);
  static const IconData LOGIN_USER = const IconData(0xe851, fontFamily: CustomIcons.FONT_FAMILY);
  static const IconData LOGIN_FACE = const IconData(59516, fontFamily: CustomIcons.FONT_FAMILY);

  ///首页九宫格图标
  static const IconData HISTORY_BILL = const IconData(59485, fontFamily: CustomIcons.FONT_FAMILY);
  static const IconData FREIGHT_INQUIRY = const IconData(58712, fontFamily: CustomIcons.FONT_FAMILY);
  static const IconData REFUEL_INQUIRY = const IconData(58694, fontFamily: CustomIcons.FONT_FAMILY);
  static const IconData TOLL_INQUIRY = const IconData(58725, fontFamily: CustomIcons.FONT_FAMILY);
  static const IconData MAINTENANCE_FEE_INQUIRY = const IconData(59497, fontFamily: CustomIcons.FONT_FAMILY);
  static const IconData OUTHER_COST_INQUIRY = const IconData(57955, fontFamily: CustomIcons.FONT_FAMILY);
  static const IconData CURRENT_ASSIGN_CUSTOMER = const IconData(59389, fontFamily: CustomIcons.FONT_FAMILY);
  
  static const IconData HOME_HOME = const IconData(58819, fontFamily: CustomIcons.FONT_FAMILY);
  static const IconData HOME_NOTICE = const IconData(0xe0b7, fontFamily: CustomIcons.FONT_FAMILY);
  static const IconData HOME_GRAB_SHEET = const IconData(0xe147, fontFamily: CustomIcons.FONT_FAMILY);
  static const IconData HOME_FINANCE = const IconData(0xe870, fontFamily: CustomIcons.FONT_FAMILY);
  static const IconData HOME_MY = const IconData(0xe853, fontFamily: CustomIcons.FONT_FAMILY);
  
  static const IconData USER_NOTIFY = const IconData(0xe87f, fontFamily: CustomIcons.FONT_FAMILY);
}

class CustomConstant{
  static const normalTextSize = 18.0;
  static const minTextSize = 12.0;
  static const smallTextSize = 14.0;

  static const smallTextBold = TextStyle(
    color: Color(CustomColors.mainTextColor),
    fontSize: smallTextSize,
    fontWeight: FontWeight.bold,
  );

  static const normalTextWhite = TextStyle(
    color: Color(CustomColors.textColorWhite),
    fontSize: normalTextSize,
  );

  static const normalTextBlack = TextStyle(
    color: Color(CustomColors.textColorBlack),
    fontSize: normalTextSize,
  );

  static const normalText = TextStyle(
    color: Color(CustomColors.mainTextColor),
    fontSize: normalTextSize
  );

  static const minText = TextStyle(
    color: Color(CustomColors.subLightTextColor),
    fontSize: minTextSize,
  );

  static const smallSubLightText = TextStyle(
    color: Color(CustomColors.subLightTextColor),
    fontSize: smallTextSize,
  );
}