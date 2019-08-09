

import 'package:flutter/material.dart';
import 'package:flutter_app123456/common/style/CustomStyle.dart';
import 'package:flutter_app123456/widget/HistoryBillItem.dart';

class HistoryBillDetailPage extends StatefulWidget{
  static final String name = "historyBillDetail";

  final HistoryBillItemViewModel model;

  HistoryBillDetailPage(this.model, {Key key}) : super(key:key);

  _HistoryBillDetailPage createState() => _HistoryBillDetailPage(model);
}

class _HistoryBillDetailPage extends State<HistoryBillDetailPage>{

  final HistoryBillItemViewModel model;
  _HistoryBillDetailPage(this.model);


  @override
  void initState() {
    super.initState();
  }
  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        //resizeToAvoidBottomPadding: false, //键盘弹出覆盖，不重新布局
          backgroundColor: CustomColors.listBackground,
          appBar: new AppBar(
            title: new Text("历史提货单详情"),
          ),

          body:new SingleChildScrollView(child: new Card(
            color: Color(CustomColors.displayCardBackground),
            //margin: const EdgeInsets.only(left: 20.0, top: 30.0, right: 20.0, bottom: 30),
            margin: EdgeInsets.only(top: 6.0, bottom: 6.0, left: 4.0, right: 4.0),
            elevation: 8.0,
            child: new Container(
              child:new Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  //new Expanded(child:
                  new Table(
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    //border: TableBorder.all(color: Color(CustomColors.tableBorderColor), width: 2.0, style: BorderStyle.solid),
                    children:
                    <TableRow>[
                      TableRow(
                          children: <Widget>[
                            Text("车辆编号：", style: CustomConstant.normalTextBlue),
                            Text(model.vehicleCode ?? "无", style: CustomConstant.normalTextBlack),
                          ]
                      ),
                      TableRow(
                          children: <Widget>[
                            Text("车牌号：", style: CustomConstant.normalTextBlue),
                            Text(model.mainVehiclePlate ?? "无", style: CustomConstant.normalTextBlack),
                          ]
                      ),
                      TableRow(
                          children: <Widget>[
                            Text("提货单号：", style: CustomConstant.normalTextBlue),
                            Text(model.deliveryOrderCode ?? "无", style: CustomConstant.normalTextBlack),
                          ]
                      ),
                      TableRow(
                          children: <Widget>[
                            Text("提货单状态：", style: CustomConstant.normalTextBlue),
                            Text(model.deliveryOrderStateText ?? "无", style: CustomConstant.normalTextBlack),
                          ]
                      ),
                      TableRow(
                          children: <Widget>[
                            Text("提货单生成时间：", style: CustomConstant.normalTextBlue),
                            Text(model.generateDate == "null" ? "无" : model.generateDate, style: CustomConstant.normalTextBlack),
                          ]
                      ),
                      TableRow(
                          children: <Widget>[
                            Text("装地-提货点：", style: CustomConstant.normalTextBlue),
                            Text(model.loadPlaceName ?? "无", style: CustomConstant.normalTextBlack),
                          ]
                      ),
                      TableRow(
                          children: <Widget>[
                            Text("卸地-采购方：", style: CustomConstant.normalTextBlue),
                            Text(model.unloadPlaceName ?? "无", style: CustomConstant.normalTextBlack),
                          ]
                      ),
                      TableRow(
                          children: <Widget>[
                            Text("货物名-煤种：", style: CustomConstant.normalTextBlue),
                            Text(model.goodsName ?? "无" , style: CustomConstant.normalTextBlack),
                          ]
                      ),
                      TableRow(
                          children: <Widget>[
                            Text("提货点称重时间：", style: CustomConstant.normalTextBlue),
                            Text(model.outStockGenerateDate == "null" ? "无" : model.outStockGenerateDate, style: CustomConstant.normalTextBlack),
                          ]
                      ),
                      TableRow(
                          children: <Widget>[
                            Text("提货点净重：", style: CustomConstant.normalTextBlue),
                            Text(model.outStockNetWeigh.toString() ?? "无", style: CustomConstant.normalTextBlack),
                          ]
                      ),
                      TableRow(
                          children: <Widget>[
                            Text("采购方称重时间：", style: CustomConstant.normalTextBlue),
                            Text(model.weighDate == "null" ? "无" : model.skinbackDate, style: CustomConstant.normalTextBlack),
                          ]
                      ),
                      TableRow(
                          children: <Widget>[
                            Text("采购方回皮时间：", style: CustomConstant.normalTextBlue),
                            Text(model.skinbackDate == "null" ? "无" : model.skinbackDate, style: CustomConstant.normalTextBlack),
                          ]
                      ),
                      TableRow(
                          children: <Widget>[
                            Text("采购方毛重：", style: CustomConstant.normalTextBlue),
                            Text(model.inStockGrossWeigh.toString() ?? "无" , style: CustomConstant.normalTextBlack),
                          ]
                      ),
                      TableRow(
                          children: <Widget>[
                            Text("采购方净重：", style: CustomConstant.normalTextBlue),
                            Text(model.inStockNetWeigh.toString() ?? "无" , style: CustomConstant.normalTextBlack),
                          ]
                      ),
                    ],
                  ),
                ],
              ),

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(
                  color: CustomColors.listBackground,
                  width: 0.7,
                  style: BorderStyle.solid,
                ),
              ),
              padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 12.0, bottom: 12.0),
            ),

          ),)


      ),
      onWillPop: _onBack,
    );
  }
  Future<bool> _onBack(){
    try{}catch(e){}finally{}
    Navigator.pop(context, true);
    return Future.value(false);
  }
}