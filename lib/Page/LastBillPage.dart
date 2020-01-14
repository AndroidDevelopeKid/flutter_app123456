import 'package:flutter/material.dart';
import 'package:flutter_app123456/common/dao/DeliveryOrderDao.dart';
import 'package:flutter_app123456/common/model/DeliveryOrder.dart';
import 'package:flutter_app123456/common/style/CustomStyle.dart';
import 'package:flutter_app123456/common/utils/CommonUtils.dart';
import 'package:flutter_app123456/common/utils/NavigatorUtils.dart';
import 'package:flutter_app123456/widget/CustomErrorReturnWidget.dart';
import 'package:flutter_app123456/widget/CustomTableRowWidget.dart';
import 'package:qr/qr.dart';
import 'package:qr_flutter/qr_flutter.dart';

class LastBillPage extends StatefulWidget {
  static final String name = "LastBill";

  LastBillPage({Key key}) : super(key: key);

  _LastBillPage createState() => _LastBillPage();
}

class _LastBillPage extends State<LastBillPage> {
  Future<DeliveryOrder> deliveryOrder;

  Future<DeliveryOrder> fetchData() async {
    var lastedDeliveryOrder =
        await DeliveryOrderDao.getLastedDeliveryOrderRecords();
    if (lastedDeliveryOrder != null && lastedDeliveryOrder.result) {
      if (lastedDeliveryOrder.data["result"] == null) {
        var dataNull = new DeliveryOrder(
            null,
            null,
            null,
            null,
            null,
            null,
            null,
            null,
            null,
            null,
            null,
            null,
            null,
            null,
            null,
            null,
            null,
            null,
            null,
            null,
            "当前无最新提货单");
        return dataNull;
      }
      return DeliveryOrder.fromJson(lastedDeliveryOrder.data["result"]);
    }
    if (!lastedDeliveryOrder.result) {
      if (lastedDeliveryOrder.data != null) {
        var dataNull = new DeliveryOrder(
            null,
            null,
            null,
            null,
            null,
            null,
            null,
            null,
            null,
            null,
            null,
            null,
            null,
            null,
            null,
            null,
            null,
            null,
            null,
            null,
            lastedDeliveryOrder.data["error"]["message"]);
        return dataNull;
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    deliveryOrder = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        leading: IconButton(
            iconSize: 15.0,
            icon: Icon(CustomIcons.BACK, color: Color(0xff4C88FF)),
            onPressed: () {
              Navigator.of(context).pop();
            }),
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        title: Text("最新提货单",
            style: TextStyle(fontSize: 18.0, color: Colors.black)),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
        child: Container(
          child: FutureBuilder<DeliveryOrder>(
            future: deliveryOrder,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var image = new QrImage(
                    data: snapshot.data.barcode == null
                        ? ""
                        : snapshot.data.barcode,
                    size: 350.0,
                    version: 9,
                    errorCorrectionLevel: QrErrorCorrectLevel.H);
                return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2.0)),
                        child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 17.5),
                            child: Text(
                              "点击查看二维码",
                              style: TextStyle(
                                  fontSize: 15.0, color: Colors.white),
                            )),
                        color: Color(0xff4C88FF),
                        onPressed: () {
                          if(snapshot.data.barcode == null){
                            CommonUtils.showShort("没有可用的二维码");
                          }
                          else{
                            NavigatorUtils.goBarCodeEnlarge(context, image);
                          }

                        },
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: 15.0, left: 11.0, right: 11.0, bottom: 15.0),
                        child: Table(
                          defaultVerticalAlignment:
                              TableCellVerticalAlignment.middle,
                          children: <TableRow>[
                            TableRow(children: <Widget>[
                              CustomTableRowWidget(
                                "车辆编号",
                                snapshot.data.vehicleCode == null
                                    ? "无"
                                    : snapshot.data.vehicleCode,
                              ),
                            ]),
                            TableRow(children: <Widget>[
                              CustomTableRowWidget(
                                "车牌号",
                                snapshot.data.mainVehiclePlate == null
                                    ? "无"
                                    : snapshot.data.mainVehiclePlate,
                              ),
                            ]),
                            TableRow(children: <Widget>[
                              CustomTableRowWidget(
                                "提货单号",
                                snapshot.data.deliveryOrderCode == null
                                    ? "无"
                                    : snapshot.data.deliveryOrderCode,
                              ),
                            ]),
                            TableRow(children: <Widget>[
                              CustomTableRowWidget(
                                "提货单状态",
                                snapshot.data.deliveryOrderStateText == null
                                    ? "无"
                                    : snapshot.data.deliveryOrderStateText,
                              ),
                            ]),
                            TableRow(children: <Widget>[
                              CustomTableRowWidget(
                                "提货单时间",
                                snapshot.data.generateDate == null
                                    ? "无"
                                    : snapshot.data.generateDate,
                              ),
                            ]),
                            TableRow(children: <Widget>[
                              CustomTableRowWidget(
                                "装地-提货点",
                                snapshot.data.loadPlaceName == null
                                    ? "无"
                                    : snapshot.data.loadPlaceName,
                              ),
                            ]),
                            TableRow(children: <Widget>[
                              CustomTableRowWidget(
                                "卸地-采购方",
                                snapshot.data.unloadPlaceName == null
                                    ? "无"
                                    : snapshot.data.unloadPlaceName,
                              ),
                            ]),
                            TableRow(children: <Widget>[
                              CustomTableRowWidget(
                                "煤种",

                                snapshot.data.coalText != null && snapshot.data.coalCode != null
                                   ? snapshot.data.coalCode.toString() + "-" + snapshot.data.coalText.toString()
                                    : "无",
                              )
                            ]),
                            TableRow(children: <Widget>[
                              CustomTableRowWidget(
                                "备注",
                                snapshot.data.message == null
                                    ? "无"
                                    : snapshot.data.message,
                              )
                            ]),
                          ],
                        ),
                      ),
                    ]);
              } else if (snapshot.hasError) {
                return CustomErrorReturnWidget();
              }
              return SizedBox(height: 2.0, child: LinearProgressIndicator());
            },
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
    );
  }
}
