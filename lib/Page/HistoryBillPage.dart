import 'package:flutter/material.dart';
import 'package:flutter_app123456/common/config/Config.dart';
import 'package:flutter_app123456/common/dao/DeliveryOrderDao.dart';
import 'package:flutter_app123456/common/dao/ResultDao.dart';
import 'package:flutter_app123456/common/model/HistoryBill.dart';
import 'package:flutter_app123456/common/style/CustomStyle.dart';
import 'package:flutter_app123456/widget/BaseHistoryBillState.dart';
import 'package:flutter_app123456/widget/CustomPullLoadWidget.dart';
import 'package:flutter_app123456/widget/SimpleImageButton.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class HistoryBillPage extends StatefulWidget {
  static final String name = "HistoryBill";

  HistoryBillPage({Key key}) : super(key: key);

  _HistoryBillPage createState() => _HistoryBillPage();
}

class _HistoryBillPage extends BaseHistoryBillState<HistoryBillPage> {
  ///消息颜色
  Color planColor = const Color(CustomColors.subLightTextColor);
  int skipCountGlobal = 10;
  int skipCountInit = 0;

  _refreshNotify() {
    if (isShow) {
      setState(() {
        planColor = Colors.green;
      });
    }
  }

  var _dateBegin =
      DateTime.now().add(new Duration()).toString().substring(0, 10);
  var _dateEnd =
      DateTime.now().add(new Duration(days: 1)).toString().substring(0, 10);
  var _dateBeginNext = "";
  var _dateEndNext = "";

  var _isExpanded = false;

  final CustomPullLoadWidgetControl pullLoadWidgetControl =
      new CustomPullLoadWidgetControl();

  ///获取数据
  _getData(dateBegin, dateEnd, skipCount) async {
    final List<HistoryBill> historyBillList = new List();
    var historyBills =
        await DeliveryOrderDao.getHistoryBill(dateBegin, dateEnd, skipCount);
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
        var deliveryOrderStateText = itemList[i]["deliveryOrderStateText"];
        var generateDate = itemList[i]["generateDate"].toString();
        var loadPlaceId = itemList[i]["loadPlaceId"];
        var loadPlaceName = itemList[i]["loadPlaceName"];
        var unloadPlaceId = itemList[i]["unloadPlaceId"];
        var unloadPlaceName = itemList[i]["unloadPlaceName"];
        var goodsId = itemList[i]["goodsId"];
        var goodsName = itemList[i]["goodsName"];
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
            weighDate,
            deliveryOrderStateText,
            goodsId,
            loadPlaceId,
            unloadPlaceId));
      }
      return new DataResult(historyBillList, true, historyBills.code);
    }
    if (historyBills.data == null && !historyBills.result) {
      return new DataResult("到底了", false, historyBills.code);
    }
  }

  ///请求刷新
  @override
  requestRefresh() {
    // TODO: implement requestRefresh
    //getMessagePush();
    skipCountGlobal = 10;
    print("parameters: " + skipCountInit.toString());
    return _getData(_dateBegin, _dateEnd, skipCountInit);
  }

  ///请求加载更多
  @override
  requestLoadMore() async {
    // TODO: implement requestLoadMore
    var dataLoadMore = await _getData(
        _dateBeginNext.trim(), _dateEndNext.trim(), skipCountGlobal);
    if (dataLoadMore.result) {
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
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
  }

  _showDatePickerBegin() async {
    DateTime _picker = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime.now().subtract(new Duration(days: 3000)),
      // 减 30 天
      lastDate: new DateTime.now().add(new Duration(days: 30)), // 加 30 天
    );
    if (_picker == null) return;
    setState(() {
      _dateBegin = _picker.toString().substring(0, 10);
    });
  }

  _showDatePickerEnd() async {
    DateTime _picker = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime.now().subtract(new Duration(days: 3000)),
      // 减 30 天
      lastDate: new DateTime.now().add(new Duration(days: 30)), // 加 30 天
    );
    if (_picker == null) return;
    setState(() {
      _dateEnd = _picker.toString().substring(0, 10);
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
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
        title: Text("历史提货单",
            style: TextStyle(fontSize: 18.0, color: Colors.black)),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: 10.0,
          right: 10.0,
          top: 10.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
//            ExpansionPanelList(
//              children: <ExpansionPanel>[
//                ExpansionPanel(
//                  headerBuilder: (context, isExpanded) {
//                    return new Row(
//                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                      children: <Widget>[
//                        new Padding(
//                          padding: EdgeInsets.only(
//                              left: 10.0, right: 10.0, top: 5.0, bottom: 5.0),
//                          child: new SimpleImageButton(
//                            normalwidth: 75.0,
//                            normalheight: 30.0,
//                            pressedheight: 30.0,
//                            pressedwidth: 75.0,
//                            normalImage: CustomIcons.QUERY,
//                            pressedImage: CustomIcons.QUERY,
//                            onPressed: () {
//                              handleRefresh();
//                              _dateBeginNext = _dateBegin;
//                              _dateEndNext = _dateEnd;
//                            },
//                          ),
//                        ),
//                        Text(
//                          "点击展开查询条件",
//                          style: TextStyle(
//                              fontSize: 15.0, color: Color(0xff4C88FF)),
//                        ),
//                      ],
//                    );
//                  },
//                  body: Padding(
//                    padding: EdgeInsets.only(
//                      left: 10.0,
//                      right: 10.0,
//                      bottom: 10.0,
//                    ),
//                    child: Row(
//                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                      children: <Widget>[
//                        Expanded(
//                          child: new OutlineButton(
//                            child: Row(
//                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                              children: <Widget>[
//                                SizedBox(
//                                  height: 15.0,
//                                  width: 15.0,
//                                  child: Image.asset(CustomIcons.DAIRY),
//                                ),
//                                Padding(
//                                  padding: EdgeInsets.only(left: 7.0),
//                                ),
//                                Text(
//                                  _dateBegin == ""
//                                      ? DateTime.now()
//                                          .toString()
//                                          .substring(0, 10)
//                                      : _dateBegin.toString().substring(0, 10),
//                                  style: CustomConstant.hintText,
//                                ),
//                              ],
//                            ),
//                            borderSide:
//                                new BorderSide(color: Color(0xff4C88FF)),
//                            onPressed: () => _showDatePickerBegin(),
//                          ),
//                        ),
//                        Padding(
//                          padding: EdgeInsets.symmetric(horizontal: 23.0),
//                        ),
//                        Expanded(
//                            child: new OutlineButton(
//                          child: Row(
//                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                            children: <Widget>[
//                              SizedBox(
//                                height: 15.0,
//                                width: 15.0,
//                                child: Image.asset(CustomIcons.DAIRY),
//                              ),
//                              Padding(
//                                padding: EdgeInsets.only(left: 7.0),
//                              ),
//                              Text(
//                                  _dateEnd == ""
//                                      ? DateTime.now()
//                                          .toString()
//                                          .substring(0, 10)
//                                      : _dateEnd.toString().substring(0, 10),
//                                  style: CustomConstant.hintText),
//                            ],
//                          ),
//                          borderSide: new BorderSide(color: Color(0xff4C88FF)),
//                          onPressed: () => _showDatePickerEnd(),
//                        ))
//                      ],
//                    ),
//                  ),
//                  isExpanded: _isExpanded,
//                  canTapOnHeader: true,
//                )
//              ],
//              expansionCallback: (panelIndex, isExpanded) {
//                setState(() {
//                  _isExpanded = !isExpanded;
//                });
//              },
//              animationDuration: Duration(milliseconds: 500),
//            ),
            Container(
              height: 65.0,
              child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: new OutlineButton(
                          padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 10.0, bottom: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(
                                height: 15.0,
                                width: 15.0,
                                child: Image.asset(CustomIcons.DAIRY),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 7.0),
                              ),
                              Text(
                                _dateBegin == ""
                                    ? DateTime.now().toString().substring(0, 10)
                                    : _dateBegin.toString().substring(0, 10),
                                style: CustomConstant.hintText,
                              ),
                            ],
                          ),
                          borderSide: new BorderSide(color: Color(0xff4C88FF)),
                          //onPressed: () => _showDatePickerBegin(),
                          onPressed: (){
                            DatePicker.showDatePicker(context, showTitleActions: true,
                              maxTime: DateTime.now().add(Duration(days: 30)),
                              minTime: DateTime(1900, 1, 1),
                              currentTime: DateTime.now(),
                              locale: LocaleType.zh,
                              onConfirm: (date){
                              setState(() {
                                _dateBegin = date.toString();
                              });
                            }
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.0),
                      ),
                      Expanded(
                          child: new OutlineButton(
                            padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 10.0, bottom: 10.0),
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              height: 15.0,
                              width: 15.0,
                              child: Image.asset(CustomIcons.DAIRY),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 7.0),
                            ),
                            Text(
                                _dateEnd == ""
                                    ? DateTime.now().toString().substring(0, 10)
                                    : _dateEnd.toString().substring(0, 10),
                                style: CustomConstant.hintText),
                          ],
                        ),
                        borderSide: new BorderSide(color: Color(0xff4C88FF)),
                        //onPressed: () => _showDatePickerEnd(),
                            onPressed: (){
                              DatePicker.showDatePicker(context, showTitleActions: true,
                                  maxTime: DateTime.now().add(Duration(days: 30)),
                                  minTime: DateTime(1900, 1, 1),
                                  currentTime: DateTime.now(),
                                  locale: LocaleType.zh,
                                  onConfirm: (date){
                                    setState(() {
                                      _dateEnd = date.toString();
                                    });
                                  }
                              );
                            },
                      )),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                      ),
                      SizedBox(width: 75, height: 30,child: RaisedButton(
                        padding: EdgeInsets.all(0.0),
                        child: Image.asset(CustomIcons.QUERY, fit: BoxFit.cover,),
                        onPressed: () {
                          handleRefresh();
                          _dateBeginNext = _dateBegin;
                          _dateEndNext = _dateEnd;
                        },
                      ),),
//                      SimpleImageButton(
//                        normalwidth: 75.0,
//                        normalheight: 30.0,
//                        pressedheight: 30.0,
//                        pressedwidth: 75.0,
//                        normalImage: CustomIcons.QUERY,
//                        pressedImage: CustomIcons.QUERY,
//                        onPressed: () {
//                          handleRefresh();
//                          _dateBeginNext = _dateBegin;
//                          _dateEndNext = _dateEnd;
//                        },
//                      ),
                    ],
                  )),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2.0),
                border: Border.all(
                  color: Color(0xffefefef),
                  width: 1.0,
                  style: BorderStyle.solid,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 7.0),
            ),
            Expanded(
                child: new CustomPullLoadWidget(
              pullLoadWidgetControl,
              (BuildContext context, int index) => renderItem(index, () {
                _refreshNotify();
              }),
              handleRefresh,
              onLoadMore,
              refreshKey: refreshIndicatorKey,
            )),
          ],
        ),
      ),
    );
  }
}
