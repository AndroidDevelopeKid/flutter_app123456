


import 'package:flutter/material.dart';
import 'package:flutter_app123456/common/config/Config.dart';
import 'package:flutter_app123456/common/style/CustomStyle.dart';
import 'package:flutter_app123456/widget/BaseHistoryBillState.dart';
import 'package:flutter_app123456/widget/CustomPullLoadWidget.dart';

class HistoryBillPage extends StatefulWidget{
  static final String name = "HistoryBill";

  HistoryBillPage({Key key}) : super(key:key);

  _HistoryBillPage createState() => _HistoryBillPage();
}

class _HistoryBillPage extends BaseHistoryBillState<HistoryBillPage>{
  ///消息颜色
  Color planColor = const Color(CustomColors.subLightTextColor);
  int skipCountGlobal = 10;
  int skipCountInit = 0;
  _refreshNotify(){
    if(isShow){
      setState((){
        planColor = Colors.green;
      });
    }

  }
  final CustomPullLoadWidgetControl pullLoadWidgetControl = new CustomPullLoadWidgetControl();
  ///获取数据
  _getData(skipCount) async {
//    final List<Driver> driverList = new List();
//    var drivers = await DriverDao.getDriverQuery(idNumber, name, phone, vehicleCode, 5, skipCount);
//    if(drivers != null && drivers.result){
//      print("skipCount : " + skipCountGlobal.toString());
//      print("drivers: " + drivers.data.toString());
//      var itemList = drivers.data["result"]["items"];
//      print("drivers's itemList: " + itemList.toString() + itemList.length.toString());
//      print("drivers itemList length: " + itemList.length.toString());
//      for(int i = 0; i < itemList.length; i++){
//        var id = itemList[i]["id"].toString();
//        var ouDisplayName = itemList[i]["ouDisplayName"].toString();
//        var vehicleCode = itemList[i]["vehicleCode"].toString();
//        var driverIDNumber = itemList[i]["driverIDNumber"].toString();
//        var driverName = itemList[i]["driverName"].toString();
//        var driverPhone = itemList[i]["driverPhone"].toString();
//        var personTypeText = itemList[i]["personTypeText"].toString();
//        var personStateText = itemList[i]["personStateText"].toString();
//        var buckupContactPerson = itemList[i]["buckupContactPerson"].toString();
//        var buckupContactPersonAddress = itemList[i]["buckupContactPersonAddress"].toString();
//        var buckupContactPersonPhone = itemList[i]["buckupContactPersonPhone"].toString();
//        var driverLicenseID = itemList[i]["driverLicenseID"].toString();
//        var certificateEndDate = itemList[i]["certificateEndDate"].toString();
//        var dlCertificateEndDate = itemList[i]["dlCertificateEndDate"].toString();
//        driverList.add(new Driver(id, ouDisplayName, vehicleCode, driverIDNumber, driverName, driverPhone, personTypeText, personStateText, buckupContactPerson, buckupContactPersonAddress, buckupContactPersonPhone, driverLicenseID, certificateEndDate, dlCertificateEndDate));
//      }
//      //return new DataResult(driverList, true);
//    }
//    if(drivers.data == null && !drivers.result){
//      //return new DataResult("到底了", false);
//    }
  }
  ///请求刷新
  @override
  requestRefresh() {
    // TODO: implement requestRefresh
    //getMessagePush();
    print("parameters: " + skipCountInit.toString());
    return _getData(skipCountInit);
  }
  ///请求加载更多
  @override
  requestLoadMore() async {
    // TODO: implement requestLoadMore
    var dataLoadMore = await _getData(skipCountGlobal);
    if(dataLoadMore.result){
      skipCountGlobal = skipCountGlobal + Config.NOTICE_PAGE_SIZE;
      print("skipCountGlobal : " + skipCountGlobal.toString());
    }
    return dataLoadMore;
  }
  ///tab切换防止页面重置
  @override
  bool get wantKeepAlive => true;
  @override
  bool get needHeader => false;
  @override
  void initState() {
    pullLoadWidgetControl.needHeader = true;
    super.initState();
  }
  ///initState后调用，在didChangeDependencies中，可以跨组件拿到数据。
  @override
  void didChangeDependencies(){
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      //backgroundColor: CustomColors.listBackground,
      appBar: new AppBar(
        title: new Text("历史提货单"),
      ),

      body: new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          new Expanded(
              child: new CustomPullLoadWidget(
                pullLoadWidgetControl,
                    (BuildContext context, int index) => renderItem(index,(){
                  _refreshNotify();
                }),
                handleRefresh,
                onLoadMore,
                refreshKey: refreshIndicatorKey,
              )
          ),

        ],
      ),
    );
  }


}