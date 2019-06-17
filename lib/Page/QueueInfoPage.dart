


import 'dart:convert';

import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app123456/common/config/Config.dart';
import 'package:flutter_app123456/common/dao/GrabSheetDao.dart';
import 'package:flutter_app123456/common/local/LocalStorage.dart';
import 'package:flutter_app123456/common/model/Queue.dart';
import 'package:flutter_app123456/common/style/CustomStyle.dart';

class QueueInfoPage extends StatefulWidget{
  static final String name = "QueueInfo";

  QueueInfoPage({Key key}) : super(key:key);

  _QueueInfoPage createState() => _QueueInfoPage();
}

class _QueueInfoPage extends State<QueueInfoPage>{

  Future<Queue> queue;

  Future<Queue> fetchData() async {
    var queueInfo =  await LocalStorage.get(Config.QUEUE_INFO);
    if(queueInfo == null){
      var queueInfoCallInterface = await GrabSheetDao.getCurrentQueueInfo();
      if(queueInfoCallInterface != null && queueInfoCallInterface.result){
        if(queueInfoCallInterface.data == null){
          var dataNull = new Queue(null, null, null, null, null, null, null, null, null, null, null);
          return dataNull;
        }
        return Queue.fromJson(queueInfoCallInterface.data["result"]);
      }
      if(!queueInfoCallInterface.result){
        if(queueInfoCallInterface.data != null){
          var dataNull = new Queue(null, null, null, null, null, null, null, null, null, null, queueInfoCallInterface.data.toString());
          return dataNull;
        }
//        else{
//          var dataNull = new Queue(null, null, null, null, null, null, null, null, null, null, null);
//          return dataNull;
//        }
        //return Queue.fromJson(queueInfoCallInterface.data["error"]);
      }
//      if(queueInfoCallInterface == null){
//        var dataNull = new Queue(null, null, null, null, null, null, null, null, null, null, null);
//        return dataNull;
//      }
    }else{
      Queue queueData = Queue.fromJson(json.decode(queueInfo));
      return queueData;
    }

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    queue = fetchData();
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: CustomColors.listBackground,
      appBar: new AppBar(
        title: new Text("排队信息"),
      ),

      body:
      new Card(
        color: Color(CustomColors.displayCardBackground),
        //margin: const EdgeInsets.only(left: 20.0, top: 30.0, right: 20.0, bottom: 30),
        margin: EdgeInsets.only(top: 6.0, bottom: 6.0, left: 4.0, right: 4.0),
        elevation: 8.0,
        child: new Container(
          child: FutureBuilder<Queue>(
            future: queue,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                //return Text(snapshot.data.vehicleCode);
                return new Table(
//                columnWidths: {
//                  0: FixedColumnWidth(100.0),
//                  1: FixedColumnWidth(100.0)
//                },
                  border: TableBorder.all(color: Color(CustomColors.tableBorderColor), width: 2.0, style: BorderStyle.solid),
                  children: <TableRow>[
                    TableRow(
                        children: <Widget>[
                          Text("车辆编号：", style: CustomConstant.normalTextBlack),
                          Text(snapshot.data.vehicleCode == null ? "无" : snapshot.data.vehicleCode, style: CustomConstant.normalTextBlack),
                        ]
                    ),
                    TableRow(
                        children: <Widget>[
                          Text("车牌号：", style: CustomConstant.normalTextBlack),
                          Text(snapshot.data.mainVehiclePlate == null ? "无" : snapshot.data.mainVehiclePlate, style: CustomConstant.normalTextBlack),
                        ]
                    ),
                    TableRow(
                        children: <Widget>[
                          Text("司机身份证号：", style: CustomConstant.normalTextBlack),
                          Text(snapshot.data.driverIDCardNumber == null ? "无" : snapshot.data.driverIDCardNumber, style: CustomConstant.normalTextBlack),
                        ]
                    ),
                    TableRow(
                        children: <Widget>[
                          Text("排队时间：", style: CustomConstant.normalTextBlack),
                          Text(snapshot.data.queueDateTime == null ? "00-00 00:00" : TimelineUtil.formatByDateTime(DateTime.parse(snapshot.data.queueDateTime), dayFormat: DayFormat.Full), style: CustomConstant.normalTextBlack),
                        ]
                    ),
                    TableRow(
                        children: <Widget>[
                          Text("排队状态：", style: CustomConstant.normalTextBlack),
                          Text(snapshot.data.queueState == null ? "无" : snapshot.data.queueState, style: CustomConstant.normalTextBlack),
                        ]
                    ),
                    TableRow(
                        children: <Widget>[
                          Text("还需等待内部车辆排队数量：", style: CustomConstant.normalTextBlack),
                          Text(snapshot.data.frontInnerQueueVehicleAmount == null ? "无" : snapshot.data.frontInnerQueueVehicleAmount.toString(), style: CustomConstant.normalTextBlack),
                        ]
                    ),
                    TableRow(
                        children: <Widget>[
                          Text("还需等待全部车辆排队数量：", style: CustomConstant.normalTextBlack),
                          Text(snapshot.data.frontTotalQueueVehicleAmount == null ? "无" : snapshot.data.frontTotalQueueVehicleAmount.toString(), style: CustomConstant.normalTextBlack),
                        ]
                    ),
                    TableRow(
                        children: <Widget>[
                          Text("排队来源：", style: CustomConstant.normalTextBlack),
                          Text(snapshot.data.queueSource == null ? "无" : snapshot.data.queueSource, style: CustomConstant.normalTextBlack),
                        ]
                    ),
                    TableRow(
                        children: <Widget>[
                          Text("排队变化时间：", style: CustomConstant.normalTextBlack),
                          Text(snapshot.data.queueChangeDateTime == null ? "00-00 00:00" : TimelineUtil.formatByDateTime(DateTime.parse(snapshot.data.queueChangeDateTime), dayFormat: DayFormat.Full), style: CustomConstant.normalTextBlack)
                        ]
                    ),
                    TableRow(
                        children: <Widget>[
                          Text("备注：", style: CustomConstant.normalTextBlack),
                          Text(snapshot.data.message == null ? "无" : snapshot.data.message, style: CustomConstant.normalTextBlack)
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
          padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 12.0, bottom: 12.0),
        ),

      ),
    );
  }


}