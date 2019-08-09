


import 'package:flutter/material.dart';
import 'package:flutter_app123456/common/config/Config.dart';
import 'package:flutter_app123456/common/dao/RefuelDao.dart';
import 'package:flutter_app123456/common/dao/ResultDao.dart';
import 'package:flutter_app123456/common/model/Refuel.dart';
import 'package:flutter_app123456/common/style/CustomStyle.dart';
import 'package:flutter_app123456/widget/BaseRefuelInquiryState.dart';
import 'package:flutter_app123456/widget/CustomFlexButton.dart';
import 'package:flutter_app123456/widget/CustomPullLoadWidget.dart';

class RefuelInquiryPage extends StatefulWidget{
  static final String name = "RefuelInquiry";

  RefuelInquiryPage({Key key}) : super(key:key);

  _RefuelInquiryPage createState() => _RefuelInquiryPage();
}

class _RefuelInquiryPage extends BaseRefuelInquiryState<RefuelInquiryPage>{


  ///消息颜色
  Color refuelColor = const Color(CustomColors.subLightTextColor);

  int skipCountGlobal = 10;
  int skipCountInit = 0;

  var _dateBegin = DateTime.now().subtract(new Duration(days: 3)).toString().substring(0,10);
  var _dateEnd = DateTime.now().add(new Duration(days: 1)).toString().substring(0,10);
  var _dateBeginNext = "";
  var _dateEndNext = "";

  var _isExpanded = false;

  final CustomPullLoadWidgetControl pullLoadWidgetControl =
  new CustomPullLoadWidgetControl();

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
      _dateBegin = _picker.toString();
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
      _dateEnd = _picker.toString();
    });
  }

  _refreshNotify() {
    if (isShow) {
      setState(() {
        refuelColor = Colors.green;
      });
    }
  }


  ///获取数据
  _getData(dateBegin, dateEnd, skipCount) async {
    final List<Refuel> refuelList = new List();
    var refuels = await RefuelDao.getRefuelInquiry(dateBegin, dateEnd, skipCount);
    if (refuels != null && refuels.result) {
      print("skipCount : " + skipCountGlobal.toString());
      print("refuels: " + refuels.data.toString());
      var itemList = refuels.data["result"]["items"];
      print("refuels's itemList: " +
          itemList.toString() +
          itemList.length.toString());
      print("refuels itemList length: " + itemList.length.toString());
      for (int i = 0; i < itemList.length; i++) {
        var id = itemList[i]["id"];
        var refuelTime = itemList[i]["refuelTime"];
        var refuelLitres = itemList[i]["refuelLitres"];
        var fuel = itemList[i]["fuel"];
        var fuelText = itemList[i]["fuelText"];
        var refuelVehicleCode = itemList[i]["refuelVehicleCode"];
        var fillingStation = itemList[i]["fillingStation"];
        var fillingStationText = itemList[i]["fillingStationText"];
        var flag = itemList[i]["flag"];
        refuelList.add(new Refuel(refuelTime, id, fillingStation, fillingStationText, flag, fuel, fuelText, refuelLitres, refuelVehicleCode));
      }
      return new DataResult(refuelList, true);
    }
    if (refuels.data == null && !refuels.result) {
      return new DataResult("到底了", false);
    }
  }

  ///请求刷新
  @override
  requestRefresh() {
    // TODO: implement requestRefresh
    //getMessagePush();
    skipCountGlobal = 10;
    print("查询参数： " +
        _dateBegin.toString() +
        "--" +
        _dateEnd.toString());
    return _getData(
        _dateBegin, _dateEnd, skipCountInit);
  }

  ///请求加载更多
  @override
  requestLoadMore() async {
    // TODO: implement requestLoadMore
    var dataLoadMore = await _getData(_dateBeginNext.trim(), _dateEndNext.trim(),
        skipCountGlobal);
    if (dataLoadMore.result) {
      skipCountGlobal = skipCountGlobal + Config.PAGE_SIZE;
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



  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("加油查询"),
      ),
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          new ExpansionPanelList(
            children: <ExpansionPanel>[
              ExpansionPanel(
                headerBuilder: (context, isExpanded){
                  return new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Padding(padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0, bottom: 5.0),
                        child: new OutlineButton(
                          child: new Text("查询"),
                          borderSide: new BorderSide(color: Colors.blue),
                          //color: Colors.blueAccent,
                          //text: '查询',
                          onPressed: () {
                            handleRefresh();
                            _dateBeginNext = _dateBegin;
                            _dateEndNext = _dateEnd;
                          },
                        ),
                      ),

                      new Center(child: new Text("点击展开查询条件"),)
                    ],

                  );
                },
                body: new Column(
                  children: <Widget>[
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Expanded(
                          child: new OutlineButton(
                            child: new Padding(
                              padding: new EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                              child: new Text(
                                _dateBegin == ""
                                    ? DateTime.now().subtract(new Duration(days: 3)).toString().substring(0,10)
                                    : _dateBegin.toString().substring(0, 10),
                                style: CustomConstant.hintText,
                              ),
                            ),
                            color: Color(CustomColors.white),
                            borderSide: new BorderSide(color: Colors.grey),
                            onPressed: () => _showDatePickerBegin(),
                          ),
                        ),
                        //new Text("-->"),
                        new Padding(padding: EdgeInsets.all(5.0)),
                        Expanded(
                            child: new OutlineButton(
                              child: new Padding(
                                padding: new EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                                child: new Text(
                                    _dateEnd == ""
                                        ? DateTime.now().toString().substring(0,10)
                                        : _dateEnd.toString().substring(0, 10),
                                    style: CustomConstant.hintText),
                              ),
                              borderSide: new BorderSide(color: Colors.grey),
                              onPressed: () => _showDatePickerEnd(),
                            ))
                      ],
                    ),
                    new Padding(padding: EdgeInsets.all(5.0)),

                  ],
                ),
                isExpanded: _isExpanded,
                canTapOnHeader: true,

              )
            ],
            expansionCallback: (panelIndex, isExpanded){
              setState(() {
                _isExpanded = !isExpanded;
              });
            },
            animationDuration: Duration(milliseconds: 500),
          ),

          new Padding(padding: EdgeInsets.all(2.0)),
          new Expanded(
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
    );
  }


}