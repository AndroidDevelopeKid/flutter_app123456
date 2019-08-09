import 'package:flutter/material.dart';
import 'package:flutter_app123456/common/dao/DeliveryOrderDao.dart';
import 'package:flutter_app123456/common/model/DeliveryOrder.dart';
import 'package:flutter_app123456/common/style/CustomStyle.dart';
import 'package:flutter_app123456/common/utils/NavigatorUtils.dart';
import 'package:qr/qr.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:common_utils/common_utils.dart';

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
      if(lastedDeliveryOrder.data["result"] == null){
        var dataNull = new DeliveryOrder(null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, "当前无最新提货单");
        return dataNull;
      }
      return DeliveryOrder.fromJson(lastedDeliveryOrder.data["result"]);

    }
    if (!lastedDeliveryOrder.result) {
      if(lastedDeliveryOrder.data != null){
        var dataNull = new DeliveryOrder(null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, lastedDeliveryOrder.data["error"]["message"]);
        return dataNull;
      }
//      else{
//        var dataNull = new DeliveryOrder(null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
//        return dataNull;
//      }
      //return DeliveryOrder.fromJson(lastedDeliveryOrder.data["error"]);
    }
//    if(lastedDeliveryOrder = null){
//      var dataNull = new DeliveryOrder(null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, "服务器错误/没有权限");
//      return dataNull;
//    }
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
      backgroundColor: CustomColors.listBackground,
      appBar: new AppBar(
        title: new Text("最新提货单"),
      ),
      body: new Card(
        color: Color(CustomColors.displayCardBackground),
        //margin: const EdgeInsets.only(left: 20.0, top: 30.0, right: 20.0, bottom: 30),
        margin: EdgeInsets.only(top: 6.0, bottom: 6.0, left: 4.0, right: 4.0),
        elevation: 8.0,
        child: new Container(
          child: FutureBuilder<DeliveryOrder>(
            future: deliveryOrder,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                //return Text(snapshot.data.vehicleCode);
                var image = new QrImage(data: snapshot.data.barcode == null ? "" : snapshot.data.barcode,size: 350.0, version: 9, errorCorrectionLevel: QrErrorCorrectLevel.H);
                return new Table(
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
//                  border: TableBorder.all(
//                      color: Color(CustomColors.tableBorderColor),
//                      width: 2.0,
//                      style: BorderStyle.solid),
                  children: <TableRow>[
                    TableRow(children: <Widget>[
                      Text("车辆编号：", style: CustomConstant.normalTextBlue),
                      Text(
                          snapshot.data.vehicleCode == null
                              ? "无"
                              : snapshot.data.vehicleCode,
                          style: CustomConstant.normalTextBlack),
                    ]),
                    TableRow(children: <Widget>[
                      Text("车牌号：", style: CustomConstant.normalTextBlue),
                      Text(
                          snapshot.data.mainVehiclePlate == null
                              ? "无"
                              : snapshot.data.mainVehiclePlate,
                          style: CustomConstant.normalTextBlack),
                    ]),
                    TableRow(children: <Widget>[
                      Text("提货单号：", style: CustomConstant.normalTextBlue),
                      Text(
                          snapshot.data.deliveryOrderCode == null
                              ? "无"
                              : snapshot.data.deliveryOrderCode,
                          style: CustomConstant.normalTextBlack),
                    ]),
                    TableRow(children: <Widget>[
                      Text("提货单状态：", style: CustomConstant.normalTextBlue),
                      Text(
                          snapshot.data.deliveryOrderState == null
                              ? "无"
                              : snapshot.data.deliveryOrderState,
                          style: CustomConstant.normalTextBlack),
                    ]),
                    TableRow(children: <Widget>[
                      Text("提货单时间：", style: CustomConstant.normalTextBlue),
                      Text(
                          snapshot.data.generateDate == null
                              ? "无"
                              : snapshot.data.generateDate,
                          style: CustomConstant.normalTextBlack),
                    ]),
                    TableRow(children: <Widget>[
                      Text("装地-提货点：", style: CustomConstant.normalTextBlue),
                      Text(
                          snapshot.data.loadPlaceName == null
                              ? "无"
                              : snapshot.data.loadPlaceName,
                          style: CustomConstant.normalTextBlack),
                    ]),
                    TableRow(children: <Widget>[
                      Text("卸地-采购方：", style: CustomConstant.normalTextBlue),
                      Text(
                          snapshot.data.unloadPlaceName == null
                              ? "无"
                              : snapshot.data.unloadPlaceName,
                          style: CustomConstant.normalTextBlack),
                    ]),
                    TableRow(children: <Widget>[
                      Text("煤种：", style: CustomConstant.normalTextBlue),
                      Text(
                          snapshot.data.coalText == null
                              ? "无"
                              : snapshot.data.coalText,
                          style: CustomConstant.normalTextBlack)
                    ]),
                    TableRow(children: <Widget>[
                      Text("备注：", style: CustomConstant.normalTextBlue),
                      Text(
                          snapshot.data.message == null
                              ? "无"
                              : snapshot.data.message,
                          style: CustomConstant.normalTextBlack)
                    ]),
                    TableRow(children: <Widget>[
                      Text("二维码：", style: CustomConstant.normalTextBlue),
                      new Container(
                        child: GestureDetector(
                            onTap: (){
                              NavigatorUtils.goBarCodeEnlarge(context, image);
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(4.0),
                              child: Hero(
                                tag: 'image',
                                child: snapshot.data.barcode == null ? new Text("无",style: CustomConstant.normalTextBlack) : new QrImage(data: snapshot.data.barcode,size: 200.0, version: 9, errorCorrectionLevel: QrErrorCorrectLevel.H,),
                              ),
                            )
                        ),
                      ),
                    ]
                    ),


                  ],
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return CircularProgressIndicator();
            },
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
      ),
    );
  }
}
