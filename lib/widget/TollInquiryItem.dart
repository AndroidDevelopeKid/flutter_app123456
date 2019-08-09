import 'package:flutter/material.dart';
import 'package:flutter_app123456/common/model/HistoryBill.dart';
import 'package:flutter_app123456/common/model/Refuel.dart';
import 'package:flutter_app123456/common/model/Toll.dart';
import 'package:flutter_app123456/common/style/CustomStyle.dart';
import 'package:flutter_app123456/widget/CustomCardItem.dart';

class TollInquiryItem extends StatelessWidget{
  final TollInquiryItemViewModel tollInquiryItemViewModel;
  final VoidCallback onPressed;

  TollInquiryItem(this.tollInquiryItemViewModel,{this.onPressed}) : super();

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
              Text("发生时间：", style: CustomConstant.normalTextBlue),
              Text(tollInquiryItemViewModel.happenDate == null ? "无" : tollInquiryItemViewModel.happenDate.substring(0, 10), style: CustomConstant.normalTextBlack),
            ]),
            TableRow(children: <Widget>[
              Text("车辆编号：", style: CustomConstant.normalTextBlue),
              Text(tollInquiryItemViewModel.vehicleCode == null ? "无" : tollInquiryItemViewModel.vehicleCode, style: CustomConstant.normalTextBlack),
            ]),
            TableRow(children: <Widget>[
              Text("司机姓名：", style: CustomConstant.normalTextBlue),
              Text(tollInquiryItemViewModel.driverName == null ? "无" : tollInquiryItemViewModel.driverName, style: CustomConstant.normalTextBlack),
            ]),
            TableRow(children: <Widget>[
              Text("含税金额：", style: CustomConstant.normalTextBlue),
              Text(tollInquiryItemViewModel.taxAmount == null ? "无" : tollInquiryItemViewModel.taxAmount.toString(), style: CustomConstant.normalTextBlack),
            ]),
            TableRow(children: <Widget>[
              Text("费用客户：", style: CustomConstant.normalTextBlue),
              Text(tollInquiryItemViewModel.customerIdName == null ? "无" : tollInquiryItemViewModel.customerIdName, style: CustomConstant.normalTextBlack),
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

class TollInquiryItemViewModel {
  String happenDate;//发生过路费时间
  String vehicleCode;//车辆编号
  String driverName;//司机姓名
  double taxAmount;//含税金额
  int customerId;//费用客户
  String customerIdName;//费用客户名称


  String id;

  TollInquiryItemViewModel.fromMap(Toll toll) {
    id = toll.id;
    happenDate = toll.happenDate;
    vehicleCode = toll.vehicleCode;
    driverName = toll.driverName;
    taxAmount = toll.taxAmount;
    customerId = toll.customerId;
    customerIdName = toll.customerIdName;
  }

}