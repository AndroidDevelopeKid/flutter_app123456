import 'package:flutter/material.dart';
import 'package:flutter_app123456/common/model/HistoryBill.dart';
import 'package:flutter_app123456/common/model/Refuel.dart';
import 'package:flutter_app123456/common/model/Toll.dart';
import 'package:flutter_app123456/common/style/CustomStyle.dart';
import 'package:flutter_app123456/widget/CustomCardItem.dart';

import 'CustomTableRowWidget.dart';

class TollInquiryItem extends StatelessWidget {
  final TollInquiryItemViewModel tollInquiryItemViewModel;
  final VoidCallback onPressed;

  TollInquiryItem(this.tollInquiryItemViewModel, {this.onPressed}) : super();

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
                Padding(
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        width: 13.0,
                        height: 14.0,
                        child: Image.asset(CustomIcons.FORM),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 15.0),
                        child: Text(
                          tollInquiryItemViewModel.happenDate == null
                              ? "发生时间"
                              : tollInquiryItemViewModel.happenDate
                                  .substring(0, 10),
                          style: TextStyle(fontSize: 12.0),
                        ),
                      )
                    ],
                  ),
                )
              ]),
              TableRow(children: <Widget>[
                CustomTableRowWidget(
                  "车辆编号",
                  tollInquiryItemViewModel.vehicleCode == null
                      ? "无"
                      : tollInquiryItemViewModel.vehicleCode,
                ),
              ]),
              TableRow(children: <Widget>[
                CustomTableRowWidget(
                  "司机姓名",
                  tollInquiryItemViewModel.driverName == null
                      ? "无"
                      : tollInquiryItemViewModel.driverName,
                ),
              ]),
              TableRow(children: <Widget>[
                CustomTableRowWidget(
                  "含税金额",
                  tollInquiryItemViewModel.taxAmount == null
                      ? "无"
                      : tollInquiryItemViewModel.taxAmount.toString(),
                ),
              ]),
              TableRow(children: <Widget>[
                CustomTableRowWidget(
                  "费用客户",
                  tollInquiryItemViewModel.customerIdName == null
                      ? "无"
                      : tollInquiryItemViewModel.customerIdName,
                ),
              ]),
            ],
          ),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2.0),
          border: Border.all(
            color: Color(0xffefefeF),
            width: 1.0,
            style: BorderStyle.solid,
          ),
        ),
      ),
    );
  }
}

class TollInquiryItemViewModel {
  String happenDate; //发生过路费时间
  String vehicleCode; //车辆编号
  String driverName; //司机姓名
  double taxAmount; //含税金额
  int customerId; //费用客户
  String customerIdName; //费用客户名称

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
