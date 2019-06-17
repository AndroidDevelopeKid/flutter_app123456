import 'package:flutter/material.dart';
import 'package:flutter_app123456/common/model/HistoryBill.dart';
import 'package:flutter_app123456/common/style/CustomStyle.dart';
import 'package:flutter_app123456/widget/CustomCardItem.dart';

class HistoryBillItem extends StatelessWidget{
  final HistoryBillItemViewModel historyBillItemViewModel;
  final VoidCallback onPressed;

  HistoryBillItem(this.historyBillItemViewModel,{this.onPressed}) : super();

  @override
  Widget build(BuildContext context) {
    return new Card(
      color: Color(CustomColors.displayCardBackground),
      margin: EdgeInsets.only(top: 6.0, bottom: 6.0, left: 4.0, right: 4.0),
      elevation: 8.0,
      child: new Container(
        child: new Table(
          border: TableBorder.all(
              color: Color(CustomColors.tableBorderColor), width: 2.0, style: BorderStyle.solid),
          children: <TableRow>[
            TableRow(children: <Widget>[
              Text("车辆编号：", style: CustomConstant.normalTextBlack),
              Text(historyBillItemViewModel.vehicleCode == null ? "无" : historyBillItemViewModel.vehicleCode, style: CustomConstant.normalTextBlack),
            ]),
            TableRow(children: <Widget>[
              Text("车牌号：", style: CustomConstant.normalTextBlack),
              Text(historyBillItemViewModel.mainVehiclePlate == null ? "无" : historyBillItemViewModel.mainVehiclePlate, style: CustomConstant.normalTextBlack),
            ]),
            TableRow(children: <Widget>[
              Text("提货单号：", style: CustomConstant.normalTextBlack),
              Text(historyBillItemViewModel.deliveryOrderCode == null ? "无" : historyBillItemViewModel.deliveryOrderCode, style: CustomConstant.normalTextBlack),
            ]),
            TableRow(children: <Widget>[
              Text("提货单状态：", style: CustomConstant.normalTextBlack),
              Text(historyBillItemViewModel.deliveryOrderState == null ? "无" : historyBillItemViewModel.deliveryOrderState, style: CustomConstant.normalTextBlack),
            ]),
            TableRow(children: <Widget>[
              Text("提货单时间：", style: CustomConstant.normalTextBlack),
              Text(historyBillItemViewModel.generateDate == null ? "0000-00-00" : historyBillItemViewModel.generateDate.substring(0,10), style: CustomConstant.normalTextBlack),
            ]),
            TableRow(children: <Widget>[
              Text("装地-提货点：", style: CustomConstant.normalTextBlack),
              Text(historyBillItemViewModel.loadPlaceName == null ? "无" : historyBillItemViewModel.loadPlaceName, style: CustomConstant.normalTextBlack),
            ]),
            TableRow(children: <Widget>[
              Text("卸地-采购方：", style: CustomConstant.normalTextBlack),
              Text(historyBillItemViewModel.unloadPlaceName == null ? "无" : historyBillItemViewModel.unloadPlaceName, style: CustomConstant.normalTextBlack),
            ]),
            TableRow(children: <Widget>[
              Text("货物名-煤种：", style: CustomConstant.normalTextBlack),
              Text(historyBillItemViewModel.goodsName == null ? "无" : historyBillItemViewModel.goodsName, style: CustomConstant.normalTextBlack, maxLines: 3,),
            ]),
            TableRow(children: <Widget>[
              Text("提货点称重时间：", style: CustomConstant.normalTextBlack),
              Text(historyBillItemViewModel.outStockGenerateDate == null ? "0000-00-00" : historyBillItemViewModel.outStockGenerateDate.substring(0,10), style: CustomConstant.normalTextBlack, maxLines: 3,),
            ]),
            TableRow(children: <Widget>[
              Text("提货点净重：", style: CustomConstant.normalTextBlack),
              Text(historyBillItemViewModel.outStockNetWeigh == null ? "无" : historyBillItemViewModel.outStockNetWeigh.toString(), style: CustomConstant.normalTextBlack, maxLines: 3,),
            ]),
            TableRow(children: <Widget>[
              Text("采购方称重时间：", style: CustomConstant.normalTextBlack),
              Text(historyBillItemViewModel.weighDate == null ? "0000-00-00" : historyBillItemViewModel.weighDate.substring(0,10), style: CustomConstant.normalTextBlack, maxLines: 3,),
            ]),
            TableRow(children: <Widget>[
              Text("采购方回皮时间：", style: CustomConstant.normalTextBlack),
              Text(historyBillItemViewModel.skinbackDate == null ? "0000-00-00" : historyBillItemViewModel.skinbackDate.substring(0,10), style: CustomConstant.normalTextBlack, maxLines: 3,),
            ]),
            TableRow(children: <Widget>[
              Text("采购方毛重：", style: CustomConstant.normalTextBlack),
              Text(historyBillItemViewModel.inStockGrossWeigh == null ? "无" : historyBillItemViewModel.inStockGrossWeigh.toString(), style: CustomConstant.normalTextBlack, maxLines: 3,),
            ]),
            TableRow(children: <Widget>[
              Text("采购方净重：", style: CustomConstant.normalTextBlack),
              Text(historyBillItemViewModel.inStockNetWeigh == null ? "无" : historyBillItemViewModel.inStockNetWeigh.toString(), style: CustomConstant.normalTextBlack, maxLines: 3,),
            ]),
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
        padding:
        EdgeInsets.only(left: 10.0, right: 10.0, top: 12.0, bottom: 12.0),
      ),
    );
//    return new Container(
//      child: new CustomCardItem(
//        child: new FlatButton(
//          onPressed: onPressed,
//          child:
//          new Container(
//            padding: const EdgeInsets.all(10.0),
//            child: new Column(
//              children: [
//                new Row(
//                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                  crossAxisAlignment: CrossAxisAlignment.center,
//                  children: <Widget>[
//                    new Image.asset(CustomIcons.HISTORY_BILL_SUB),
//                    new Text(''
//                      //vehicleItemViewModel.vehicleCode ?? "车辆编号",
//                    ),
//                  ],
//                ),
//                new Padding(padding: EdgeInsets.all(10.0)),
//                new Row(
//                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                  crossAxisAlignment: CrossAxisAlignment.center,
//                  children: <Widget>[
//                    new Text(''
//                      //vehicleItemViewModel.vehicleStateText ?? "车辆状态",
//                    ),
//                    new Text(''
//                      //vehicleItemViewModel.mainVehiclePlate ?? "车牌号",
//                    ),
//                  ],),
//              ],
//            ),
//          ),
//        ),
//      ),
//
//    );
  }
}

class HistoryBillItemViewModel {
  String vehicleCode;//车辆编号
  String mainVehiclePlate;//车牌号
  String deliveryOrderCode;//提货单号
  String deliveryOrderState;//提货单状态
  String generateDate;//提货单生成日期
  String loadPlaceName;//装地-提货点
  String unloadPlaceName;//卸地-采购方
  String goodsName;//货物名-煤种
  String outStockGenerateDate;//提货点称重时间
  double outStockNetWeigh;//提货点净重
  String weighDate;//采购方称重时间
  String skinbackDate;//采购方回皮时间
  double inStockGrossWeigh;//采购方毛重
  double inStockNetWeigh;//采购方净重

  HistoryBillItemViewModel.fromMap(HistoryBill historyBill) {
    vehicleCode = historyBill.vehicleCode;
    mainVehiclePlate = historyBill.mainVehiclePlate;
    deliveryOrderCode = historyBill.deliveryOrderCode;
    deliveryOrderState = historyBill.deliveryOrderState;
    generateDate = historyBill.generateDate;
    loadPlaceName = historyBill.loadPlaceName;
    unloadPlaceName = historyBill.unloadPlaceName;
    goodsName = historyBill.goodsName;
    outStockGenerateDate = this.outStockGenerateDate;
    outStockNetWeigh = this.outStockNetWeigh;
    weighDate = this.weighDate;
    skinbackDate = this.skinbackDate;
    inStockGrossWeigh = this.inStockGrossWeigh;
    inStockNetWeigh = this.inStockNetWeigh;
  }

}