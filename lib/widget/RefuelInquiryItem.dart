import 'package:flutter/material.dart';
import 'package:flutter_app123456/common/model/HistoryBill.dart';
import 'package:flutter_app123456/common/model/Refuel.dart';
import 'package:flutter_app123456/common/style/CustomStyle.dart';
import 'package:flutter_app123456/widget/CustomCardItem.dart';

class RefuelInquiryItem extends StatelessWidget{
  final RefuelInquiryItemViewModel refuelInquiryItemViewModel;
  final VoidCallback onPressed;

  RefuelInquiryItem(this.refuelInquiryItemViewModel,{this.onPressed}) : super();

  @override
  Widget build(BuildContext context) {
    return new Card(
      color: Color(CustomColors.displayCardBackground),
      margin: EdgeInsets.only(top: 6.0, bottom: 6.0, left: 4.0, right: 4.0),
      elevation: 8.0,
      child: new Container(
        child: new Table(
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          //border: TableBorder.all(color: Color(CustomColors.tableBorderColor), width: 2.0, style: BorderStyle.solid),
          children: <TableRow>[
            TableRow(children: <Widget>[
              Text("加油时间：", style: CustomConstant.normalTextBlue),
              Text(refuelInquiryItemViewModel.refuelTime == null ? "无" : refuelInquiryItemViewModel.refuelTime, style: CustomConstant.normalTextBlack),
            ]),
            TableRow(children: <Widget>[
              Text("加油车辆编号：", style: CustomConstant.normalTextBlue),
              Text(refuelInquiryItemViewModel.refuelVehicleCode == null ? "无" : refuelInquiryItemViewModel.refuelVehicleCode, style: CustomConstant.normalTextBlack),
            ]),
            TableRow(children: <Widget>[
              Text("加油升数：", style: CustomConstant.normalTextBlue),
              Text(refuelInquiryItemViewModel.refuelLitres == null ? "无" : refuelInquiryItemViewModel.refuelLitres.toString(), style: CustomConstant.normalTextBlack),
            ]),
            TableRow(children: <Widget>[
              Text("油品：", style: CustomConstant.normalTextBlue),
              Text(refuelInquiryItemViewModel.fuelText == null ? "无" : refuelInquiryItemViewModel.fuelText, style: CustomConstant.normalTextBlack),
            ]),
            TableRow(children: <Widget>[
              Text("加油站：", style: CustomConstant.normalTextBlue),
              Text(refuelInquiryItemViewModel.fillingStationText == null ? "无" : refuelInquiryItemViewModel.fillingStationText, style: CustomConstant.normalTextBlack),
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
  }
}

class RefuelInquiryItemViewModel {
  String id;
  String refuelTime;//加油时间
  double refuelLitres;//加油升数
  int fuel;//油品
  String fuelText;//油品显示文本
  String refuelVehicleCode;//加油车辆编号
  int fillingStation;//加油站
  String fillingStationText;//加油站显示文本
  int flag;//加油标识

  RefuelInquiryItemViewModel.fromMap(Refuel refuel) {
    id = refuel.id;
    refuelTime = refuel.refuelTime;
    refuelLitres = refuel.refuelLitres;
    fuel = refuel.fuel;
    fuelText = refuel.fuelText;
    refuelVehicleCode = refuel.refuelVehicleCode;
    fillingStation = refuel.fillingStation;
    fillingStationText = refuel.fillingStationText;
    flag = refuel.flag;
  }

}