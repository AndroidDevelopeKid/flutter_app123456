import 'package:flutter/material.dart';

///颜色
class CustomColors{
  static const int cardWhite = 0xFFFFFFFF;
  static const int textWhite = 0xFFFFFFFF;
  static const int white = 0xFFFFFFFF;
  static const int black = 0xFF000000;
  static const int blue = 0xFF3399FF;
  static const int lightBlue = 0xFF00FFFF;
  static const int primaryDarkValue = 0xFF121917;
  static const int subLightTextColor = 0xffc4c4c4;

  static const int displayUsernameBackground = 0xFFF44336;
  static const int displayCardBackground = 0xFFFFFFFF;//0xFFF5F5DC;
  static const int tableBorderColor = 0XFF7F7F7F;
  static const Color listBackground = Colors.blue;

  static const String toastBackgroundColor = "#63CA6C";
  static const String toastTextColor = "#ffffff";

  static const int mainTextColor = primaryDarkValue;
  static const int textColorWhite = white;
  static const int textColorBlack = black;
  static const int textColorBlue = blue;

  static const int loginButtonColor = 0xFF4C88FF;

  //static const int defaultColor =
}
///图标
class CustomIcons{
  static const String MY_FONT = "MyIcons";
  static const String FONT_FAMILY = 'MaterialIcons';

  static const String DEFAULT_USER_ICON = 'lib/static/images/logo.jpg';
  static const String WELCOME_ICON= "lib/static/images/welcome01.jpg";

  static const String ARROW_ICON = "lib/static/images/ic_arrow_right.png";

  ///首页image 图标
  static const String HISTORY_BILL_IMAGE = "lib/static/images/historybill.ico";
  static const String FREIGHT_INQUIRY_IMAGE = "lib/static/images/freight.ico";
  static const String REFUEL_INQUIRY_IMAGE = "lib/static/images/refuel.ico";
  static const String TOLL_INQUIRY_IMAGE = "lib/static/images/toll.ico";
  static const String MAINTENANCE_FEE_INQUIRY_IMAGE = "lib/static/images/maintenancefee.ico";
  static const String OTHER_COST_INQUIRY_IMAGE = "lib/static/images/othercost.ico";
  static const String CURRENT_ASSIGN_CUSTOMER_IMAGE = "lib/static/images/currentassgincustomer.ico";
  static const String MESSAGE_IMAGE = "lib/static/images/message32.ico";
  static const String LOGIN_BACKGROUND_IMAGE = "lib/static/images/welcome04.jpeg";
  static const String BANNER_IMAGE_01 = "lib/static/images/banner01.jpeg";
  static const String BANNER_IMAGE_02 = "lib/static/images/banner02.jpeg";
  static const String HISTORY_BILL_SUB = "lib/static/images/historybillsub.ico";
  ///列表左侧小图标
  static const String LEFT_DISPLAY_IMAGE = "lib/static/images/leftdisplay02.ico";

  ///登录页图标
  static const String LOGIN_IMAGE = "lib/static/images/login_ic.ico";

  //新界面
  static const String LOGIN_BACKGROUND = "assets/images/loginbackground.png";
  static const String BANNER = "assets/images/banner.png";
  static const String LOGO = "assets/images/logo.png";
  static const String STATE_LOGO = "assets/images/statelogo.png";
  static const String CLOUD = "assets/images/yixincloud.png";
  static const String COST = "assets/images/cost.png";
  static const String CUSTOMER = "assets/images/current-customer.png";
  static const String FREIGHT = "assets/images/freight.png";
  static const String HISTORY = "assets/images/history-bill.png";
  static const String MAINTENANCE = "assets/images/maintenance.png";
  static const String REFUEL = "assets/images/refuel.png";
  static const String RIGHT = "assets/images/right.png";
  static const String TOLL = "assets/images/toll.png";
  static const String WELCOME = "assets/images/welcome.png";
  static const String READ = "assets/images/read.png";
  static const String READ_PRESSED = "assets/images/readpressed.png";
  static const String UNREAD = "assets/images/unread.png";
  static const String UNREAD_PRESSED = "assets/images/unreadpressed.png";
  static const String SET_ALL_READ = "assets/images/setallread.png";
  static const String MESSAGE_READ = "assets/images/icon_msg.png";
  static const String MESSAGE_UNREAD = "assets/images/messageunread.png";
  static const String NO_MORE = "assets/images/nomore.png";
  static const String MY_BACKGROUND = "assets/images/mybackground.png";
  static const String FORM = "assets/images/form.png";
  static const String QUERY = "assets/images/query.png";
  static const String DAIRY = "assets/images/dairy.png";

  
  static const IconData USER_NAME = const IconData(0xe624, fontFamily: CustomIcons.MY_FONT);
  static const IconData PASSWORD = const IconData(0xe625, fontFamily: CustomIcons.MY_FONT);
  static const IconData BACK = const IconData(0xe610, fontFamily: CustomIcons.MY_FONT);

  static const IconData HOME_HOME = const IconData(0xe612, fontFamily: CustomIcons.MY_FONT);
  static const IconData HOME_HOME_ON = const IconData(0xe611, fontFamily: CustomIcons.MY_FONT);
  static const IconData HOME_TAKE_ORDER = const IconData(0xe620, fontFamily: CustomIcons.MY_FONT);
  static const IconData HOME_TAKE_ORDER_ON = const IconData(0xe618, fontFamily: CustomIcons.MY_FONT);
  static const IconData HOME_MESSAGE = const IconData(0xe61b, fontFamily: CustomIcons.MY_FONT);
  static const IconData HOME_MESSAGE_ON = const IconData(0xe613, fontFamily:  CustomIcons.MY_FONT);
  static const IconData HOME_MY = const IconData(0xe616, fontFamily: CustomIcons.MY_FONT);
  static const IconData HOME_MY_ON = const IconData(0xe617, fontFamily: CustomIcons.MY_FONT);

  static const IconData QUEUE_INFO = const IconData(0xe61a, fontFamily: CustomIcons.MY_FONT);
  static const IconData LASTED_BILL = const IconData(0xe615, fontFamily: CustomIcons.MY_FONT);
  static const IconData ENTRY = const IconData(0xe61f, fontFamily: CustomIcons.MY_FONT);
  
  static const IconData MY_BARCODE = const IconData(0xe614, fontFamily: CustomIcons.MY_FONT);
  static const IconData USER_FILE = const IconData(0xe61e, fontFamily: CustomIcons.MY_FONT);
  static const IconData VEHICLE_FILE = const IconData(0xe61d, fontFamily: CustomIcons.MY_FONT);
  static const IconData USER_STATE = const IconData(0xe621, fontFamily: CustomIcons.MY_FONT);
  static const IconData VEHICLE_STATE = const IconData(0xe622, fontFamily: CustomIcons.MY_FONT);

  //新界面结束



  static const IconData LOGIN_COMPANY = const IconData(0xe84f, fontFamily: CustomIcons.FONT_FAMILY);
  static const IconData LOGIN_PW = const IconData(0xe312, fontFamily: CustomIcons.FONT_FAMILY);
  static const IconData LOGIN_USER = const IconData(0xe851, fontFamily: CustomIcons.FONT_FAMILY);
  static const IconData LOGIN_FACE = const IconData(59516, fontFamily: CustomIcons.FONT_FAMILY);
  static const String LOGIN_FACE_IMAGE = "lib/static/images/user.ico";
  static const String LOGIN_FACE_IMAGE_MY = "lib/static/images/userformy02.ico";


  ///首页九宫格图标
  static const IconData HISTORY_BILL = const IconData(59485, fontFamily: CustomIcons.FONT_FAMILY);
  static const IconData FREIGHT_INQUIRY = const IconData(58712, fontFamily: CustomIcons.FONT_FAMILY);
  static const IconData REFUEL_INQUIRY = const IconData(58694, fontFamily: CustomIcons.FONT_FAMILY);
  static const IconData TOLL_INQUIRY = const IconData(58725, fontFamily: CustomIcons.FONT_FAMILY);
  static const IconData MAINTENANCE_FEE_INQUIRY = const IconData(59497, fontFamily: CustomIcons.FONT_FAMILY);
  static const IconData OTHER_COST_INQUIRY = const IconData(57955, fontFamily: CustomIcons.FONT_FAMILY);
  static const IconData CURRENT_ASSIGN_CUSTOMER = const IconData(59389, fontFamily: CustomIcons.FONT_FAMILY);

  ///接单页面图标
  static const IconData MANUAL_RECEIPT = const IconData(57672, fontFamily: CustomIcons.FONT_FAMILY);
  static const IconData CANCEL_QUEUE = const IconData(58825, fontFamily: CustomIcons.FONT_FAMILY);
  static const IconData QUEUE_REFRESH = const IconData(59491, fontFamily: CustomIcons.FONT_FAMILY);

  static const String MANUAL_RECEIPT_IMAGE = "lib/static/images/manualreceipt.ico";
  static const String CANCEL_QUEUE_IMAGE = "lib/static/images/cancelqueue.ico";
  static const String QUEUE_REFRESH_IMAGE = "lib/static/images/queuerefresh.ico";


  //static const IconData HOME_HOME = const IconData(58819, fontFamily: CustomIcons.FONT_FAMILY);
  static const IconData HOME_NOTICE = const IconData(0xe0b7, fontFamily: CustomIcons.FONT_FAMILY);
  static const IconData HOME_GRAB_SHEET = const IconData(0xe147, fontFamily: CustomIcons.FONT_FAMILY);
  static const IconData HOME_FINANCE = const IconData(0xe870, fontFamily: CustomIcons.FONT_FAMILY);
  //static const IconData HOME_MY = const IconData(0xe853, fontFamily: CustomIcons.FONT_FAMILY);
  
  static const IconData USER_NOTIFY = const IconData(0xe87f, fontFamily: CustomIcons.FONT_FAMILY);


}

class CustomConstant{
  static const normalTextSize = 18.0;
  static const minTextSize = 12.0;
  static const smallTextSize = 14.0;
  static const listFieldTextSize = 15.0;
  static const listFieldResultTextSize = 11.0;

  static const hintText = TextStyle(
      color: Color(0xff000000),
      fontSize: 12.0,
  );

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

  static const normalTextBlue = TextStyle(
    color: Color(CustomColors.textColorBlue),
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
  static const listFieldStyle = TextStyle(
    color: Color(0xff4C88FF),
    fontSize: listFieldTextSize,
  );
  static const listFieldResultStyle = TextStyle(
    color: Color(0xff000000),
    fontSize: listFieldResultTextSize,
  );
}