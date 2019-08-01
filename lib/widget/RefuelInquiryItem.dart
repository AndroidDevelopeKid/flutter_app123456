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
          border: TableBorder.all(
              color: Color(CustomColors.tableBorderColor), width: 2.0, style: BorderStyle.solid),
          children: <TableRow>[
            TableRow(children: <Widget>[
              Text("加油时间：", style: CustomConstant.normalTextBlack),
              Text(refuelInquiryItemViewModel.refuelTime == null ? "无" : refuelInquiryItemViewModel.vehicleCode, style: CustomConstant.normalTextBlack),
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
  String vehicleCode;//车辆编号
  String mainVehiclePlate;//车牌号
  String refuelTime;//加油时间

  RefuelInquiryItemViewModel.fromMap(Refuel refuel) {
    vehicleCode = refuel.vehicleCode;
    mainVehiclePlate = refuel.mainVehiclePlate;
    refuelTime = refuel.refuelTime;
  }

}