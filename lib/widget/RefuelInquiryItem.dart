import 'package:flutter/material.dart';
import 'package:flutter_app123456/common/model/HistoryBill.dart';
import 'package:flutter_app123456/common/model/Refuel.dart';
import 'package:flutter_app123456/common/style/CustomStyle.dart';
import 'package:flutter_app123456/widget/CustomCardItem.dart';

import 'CustomTableRowWidget.dart';

class RefuelInquiryItem extends StatelessWidget {
  final RefuelInquiryItemViewModel refuelInquiryItemViewModel;
  final VoidCallback onPressed;

  RefuelInquiryItem(this.refuelInquiryItemViewModel, {this.onPressed})
      : super();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 5.0, top: 5.0),
      child: Container(
        child: Padding(
          padding: EdgeInsets.only(
            left: 10.0,
            top: 15.0,
          ),
          child: Table(
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: <TableRow>[
              TableRow(children: <Widget>[
                Padding(padding: EdgeInsets.only(bottom: 10.0),child:
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: 13.0,
                      height: 14.0,
                      child: Image.asset(CustomIcons.FORM),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child: Text(
                        refuelInquiryItemViewModel.refuelTime == null ? "加油时间" : refuelInquiryItemViewModel.refuelTime.substring(0,10),
                        style: TextStyle(fontSize: 12.0),
                      ),
                    )
                  ],
                ),)
              ]),
              TableRow(children: <Widget>[
                CustomTableRowWidget(
                    "加油车辆编号",
                    refuelInquiryItemViewModel.refuelVehicleCode == null
                        ? "无"
                        : refuelInquiryItemViewModel.refuelVehicleCode),
              ]),
              TableRow(children: <Widget>[
                CustomTableRowWidget(
                  "加油升数",
                  refuelInquiryItemViewModel.refuelLitres == null
                      ? "0.0"
                      : refuelInquiryItemViewModel.refuelLitres.toString(),
                ),
              ]),
              TableRow(children: <Widget>[
                CustomTableRowWidget(
                  "油品",
                  refuelInquiryItemViewModel.fuelText == null
                      ? "无"
                      : refuelInquiryItemViewModel.fuelText,
                ),
              ]),
              TableRow(children: <Widget>[
                CustomTableRowWidget(
                  "加油站",
                  refuelInquiryItemViewModel.fillingStationText == null
                      ? "无"
                      : refuelInquiryItemViewModel.fillingStationText,
                ),
              ]),
            ],
          ),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2.0),
          border: Border.all(
            color: Color(0xffFefefef),
            width: 1.0,
            style: BorderStyle.solid,
          ),
        ),
      ),
    );
  }
}

class RefuelInquiryItemViewModel {
  String id;
  String refuelTime; //加油时间
  double refuelLitres; //加油升数
  int fuel; //油品
  String fuelText; //油品显示文本
  String refuelVehicleCode; //加油车辆编号
  int fillingStation; //加油站
  String fillingStationText; //加油站显示文本
  int flag; //加油标识

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
