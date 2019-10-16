import 'package:flutter/material.dart';
import 'package:flutter_app123456/common/style/CustomStyle.dart';
import 'package:flutter_app123456/widget/CustomTableRowWidget.dart';
import 'package:flutter_app123456/widget/HistoryBillItem.dart';

class HistoryBillDetailPage extends StatefulWidget {
  static final String name = "historyBillDetail";

  final HistoryBillItemViewModel model;

  HistoryBillDetailPage(this.model, {Key key}) : super(key: key);

  _HistoryBillDetailPage createState() => _HistoryBillDetailPage(model);
}

class _HistoryBillDetailPage extends State<HistoryBillDetailPage> {
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
        appBar: AppBar(
          leading: IconButton(
              iconSize: 15.0,
              icon: Icon(CustomIcons.BACK, color: Color(0xff4C88FF)),
              onPressed: () {
                Navigator.pop(context, true);
                return Future.value(false);
              }),
          brightness: Brightness.light,
          backgroundColor: Colors.white,
          title: Text("历史提货单详情",
              style: TextStyle(fontSize: 18.0, color: Colors.black)),
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 10.0),
          child: Container(
            child: Padding(
              padding: EdgeInsets.only(
                  top: 15.0, left: 25.0, right: 25.0, bottom: 15.0),
              child: Table(
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                children: <TableRow>[
                  TableRow(children: <Widget>[
                    CustomTableRowWidget(
                      "车辆编号",
                      model.vehicleCode ?? "无",
                    ),
                  ]),
                  TableRow(children: <Widget>[
                    CustomTableRowWidget(
                      "车牌号",
                      model.mainVehiclePlate ?? "无",
                    ),
                  ]),
                  TableRow(children: <Widget>[
                    CustomTableRowWidget(
                      "提货单号",
                      model.deliveryOrderCode ?? "无",
                    ),
                  ]),
                  TableRow(children: <Widget>[
                    CustomTableRowWidget(
                      "提货单状态",
                      model.deliveryOrderStateText ?? "无",
                    ),
                  ]),
                  TableRow(children: <Widget>[
                    CustomTableRowWidget(
                      "提货单生成时间",
                      model.generateDate == "null" ? "无" : model.generateDate,
                    ),
                  ]),
                  TableRow(children: <Widget>[
                    CustomTableRowWidget(
                      "装地-提货点",
                      model.loadPlaceName ?? "无",
                    ),
                  ]),
                  TableRow(children: <Widget>[
                    CustomTableRowWidget(
                      "卸地-采购方",
                      model.unloadPlaceName ?? "无",
                    ),
                  ]),
                  TableRow(children: <Widget>[
                    CustomTableRowWidget(
                      "货物名-煤种",
                      model.goodsName ?? "无",
                    ),
                  ]),
                  TableRow(children: <Widget>[
                    CustomTableRowWidget(
                      "提货点称重时间",
                      model.outStockGenerateDate ?? "无",
                    ),
                  ]),
                  TableRow(children: <Widget>[
                    CustomTableRowWidget(
                      "提货点净重",
                      model.outStockNetWeigh == null ? "0.0" : model.outStockNetWeigh.toString(),
                    ),
                  ]),
                  TableRow(children: <Widget>[
                    CustomTableRowWidget(
                      "采购方称重时间",
                      model.weighDate ?? "无",
                    ),
                  ]),
                  TableRow(children: <Widget>[
                    CustomTableRowWidget(
                      "采购方回皮时间",
                      model.skinbackDate ?? "无",
                    ),
                  ]),
                  TableRow(children: <Widget>[
                    CustomTableRowWidget(
                      "采购方毛重",
                      model.inStockGrossWeigh == null ? "0.0" : model.inStockGrossWeigh.toString(),
                    ),
                  ]),
                  TableRow(children: <Widget>[
                    CustomTableRowWidget(
                      "采购方净重",
                      model.inStockNetWeigh == null ? "0.0" : model.inStockNetWeigh.toString(),
                    ),
                  ]),
                ],
              ),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2.0),
              border: Border.all(
                color: Color(0xffF9FBFF),
                width: 1.0,
                style: BorderStyle.solid,
              ),
            ),
          ),
        ),
      ),
      onWillPop: _onBack,
    );
  }

  Future<bool> _onBack() {
    try {} catch (e) {} finally {}
    Navigator.pop(context, true);
    return Future.value(false);
  }
}
