


import 'package:flutter/material.dart';
import 'package:flutter_app123456/common/config/Config.dart';
import 'package:flutter_app123456/common/dao/DeliveryOrderDao.dart';
import 'package:flutter_app123456/common/dao/ResultDao.dart';
import 'package:flutter_app123456/common/model/HistoryBill.dart';
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
    final List<HistoryBill> historyBillList = new List();
    var historyBills = await DeliveryOrderDao.getHistoryBill(skipCount);
    if (historyBills != null && historyBills.result) {
      print("skipCount : " + skipCountGlobal.toString());
      print("historyBills: " + historyBills.data.toString());
      var itemList = historyBills.data["result"]["items"];
      print("historyBills's itemList: " +
          itemList.toString() +
          itemList.length.toString());
      print("historyBills itemList length: " + itemList.length.toString());
      for (int i = 0; i < itemList.length; i++) {
        var id = itemList[i]["id"].toString();
        var vehicleCode = itemList[i]["vehicleCode"].toString();
        var mainVehiclePlate = itemList[i]["mainVehiclePlate"].toString();
        var deliveryOrderCode = itemList[i]["deliveryOrderCode"].toString();
        var deliveryOrderState = itemList[i]["deliveryOrderState"].toString();
        var generateDate = itemList[i]["generateDate"].toString();
        var loadPlaceName = itemList[i]["loadPlaceName"].toString();
        var unloadPlaceName = itemList[i]["unloadPlaceName"].toString();
        var goodsName = itemList[i]["goodsName"].toString();
        var outStockGenerateDate =
        itemList[i]["outStockGenerateDate"].toString();
        var outStockNetWeigh = itemList[i]["outStockNetWeigh"];
        var weighDate = itemList[i]["weighDate"].toString();
        var skinbackDate = itemList[i]["skinbackDate"].toString();
        var inStockGrossWeigh = itemList[i]["inStockGrossWeigh"];
        var inStockNetWeigh = itemList[i]["inStockNetWeigh"];
        historyBillList.add(new HistoryBill(
            id,
            mainVehiclePlate,
            vehicleCode,
            generateDate,
            deliveryOrderState,
            deliveryOrderCode,
            goodsName,
            inStockGrossWeigh,
            inStockNetWeigh,
            loadPlaceName,
            outStockGenerateDate,
            outStockNetWeigh,
            skinbackDate,
            unloadPlaceName,
            weighDate));
      }
      return new DataResult(historyBillList, true);
    }
    if (historyBills.data == null && !historyBills.result) {
      return new DataResult("到底了", false);
    }
  }
  ///请求刷新
  @override
  requestRefresh() {
    // TODO: implement requestRefresh
    //getMessagePush();
    skipCountGlobal = 10;
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