


import 'dart:convert';

import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app123456/common/config/Config.dart';
import 'package:flutter_app123456/common/dao/GrabSheetDao.dart';
import 'package:flutter_app123456/common/local/LocalStorage.dart';
import 'package:flutter_app123456/common/model/Queue.dart';
import 'package:flutter_app123456/common/style/CustomStyle.dart';
import 'package:flutter_app123456/common/utils/CommonUtils.dart';

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
        if(queueInfoCallInterface.data["result"] == null){
          var dataNull = new Queue(null, null, null, null, null, null, null, null, null, null, null, null, null);
          return dataNull;
        }
        return Queue.fromJson(queueInfoCallInterface.data["result"]);
      }
      if(!queueInfoCallInterface.result){
        if(queueInfoCallInterface.data != null){
          var dataNull = new Queue(null, null, null, null, null, null, null, null, null, null, queueInfoCallInterface.data["error"]["message"],null, null);
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
                return new Container(
                  child: Column(
                    children: <Widget>[
                      new Table(
                        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                        //border: TableBorder.all(color: Color(CustomColors.tableBorderColor), width: 2.0, style: BorderStyle.solid),
                        children: <TableRow>[
                          TableRow(
                              children: <Widget>[
                                Text("车辆编号：", style: CustomConstant.normalTextBlue),
                                Text(snapshot.data.vehicleCode == null ? "无" : snapshot.data.vehicleCode, style: CustomConstant.normalTextBlack),
                              ]
                          ),
                          TableRow(
                              children: <Widget>[
                                Text("车牌号：", style: CustomConstant.normalTextBlue),
                                Text(snapshot.data.mainVehiclePlate == null ? "无" : snapshot.data.mainVehiclePlate, style: CustomConstant.normalTextBlack),
                              ]
                          ),
                          TableRow(
                              children: <Widget>[
                                Text("司机身份证号：", style: CustomConstant.normalTextBlue),
                                Text(snapshot.data.driverIDCardNumber == null ? "无" : snapshot.data.driverIDCardNumber, style: CustomConstant.normalTextBlack),
                              ]
                          ),
                          TableRow(
                              children: <Widget>[
                                Text("排队时间：", style: CustomConstant.normalTextBlue),
                                Text(snapshot.data.queueDateTime == null ? "无" : TimelineUtil.formatByDateTime(DateTime.parse(snapshot.data.queueDateTime), dayFormat: DayFormat.Full), style: CustomConstant.normalTextBlack),
                              ]
                          ),
                          TableRow(
                              children: <Widget>[
                                Text("排队状态：", style: CustomConstant.normalTextBlue),
                                Text(snapshot.data.queueStateText == null ? "无" : snapshot.data.queueStateText, style: CustomConstant.normalTextBlack),
                              ]
                          ),
                          TableRow(
                              children: <Widget>[
                                Text("还需等待内部车辆排队数量：", style: CustomConstant.normalTextBlue),
                                Text(snapshot.data.frontInnerQueueVehicleAmount == null ? "无" : snapshot.data.frontInnerQueueVehicleAmount.toString(), style: CustomConstant.normalTextBlack),
                              ]
                          ),
                          TableRow(
                              children: <Widget>[
                                Text("还需等待全部车辆排队数量：", style: CustomConstant.normalTextBlue),
                                Text(snapshot.data.frontTotalQueueVehicleAmount == null ? "无" : snapshot.data.frontTotalQueueVehicleAmount.toString(), style: CustomConstant.normalTextBlack),
                              ]
                          ),
                          TableRow(
                              children: <Widget>[
                                Text("排队来源：", style: CustomConstant.normalTextBlue),
                                Text(snapshot.data.organizationTypeText == null ? "无" : snapshot.data.organizationTypeText, style: CustomConstant.normalTextBlack),
                              ]
                          ),
                          TableRow(
                              children: <Widget>[
                                Text("排队变化时间：", style: CustomConstant.normalTextBlue),
                                Text(snapshot.data.queueChangeDateTime == null ? "无" : TimelineUtil.formatByDateTime(DateTime.parse(snapshot.data.queueChangeDateTime), dayFormat: DayFormat.Full), style: CustomConstant.normalTextBlack)
                              ]
                          ),
                          TableRow(
                              children: <Widget>[
                                Text("备注：", style: CustomConstant.normalTextBlue),
                                Text(snapshot.data.message == null ? "无" : snapshot.data.message, style: CustomConstant.normalTextBlack)
                              ]
                          ),
                        ],
                      ),
                      Padding(padding: EdgeInsets.all(20.0)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          new Column(
                            children: <Widget>[
                              new IconButton(
                                icon: new Image.asset(CustomIcons.QUEUE_REFRESH_IMAGE),
                                iconSize: Config.ICON_SIZE,
                                //new Icon(CustomIcons.QUEUE_REFRESH, size: Config.ICON_SIZE),
                                onPressed: () {
                                  GrabSheetDao.getCurrentQueueInfo().then((res){
                                    if(res != null && res.result){
                                      setState(() {
                                        queue = fetchData();
                                      });
                                      new Future.delayed(const Duration(milliseconds: 100), (){
                                        CommonUtils.showShort("刷新排队成功");
                                        return true;
                                      });
                                    }
                                    if(res != null && !res.result){
                                      setState(() {
                                        queue = fetchData();
                                      });
                                      new Future.delayed(const Duration(milliseconds: 100), (){
                                        CommonUtils.showShort("" + res.data["error"]["message"].toString());
                                        return true;
                                      });
                                    }
                                  });
                                },
                                tooltip: "排队刷新",
                                //padding: EdgeInsets.only(right: 40.0, bottom: 45.0),
                              ),
                              new Text("排队刷新"),
                            ],
                          ),
                          new Column(
                              children: <Widget>[
                                 new IconButton(
                              icon: new Image.asset(CustomIcons.CANCEL_QUEUE_IMAGE),
                              iconSize: Config.ICON_SIZE,
                              //new Icon(CustomIcons.CANCEL_QUEUE, size: Config.ICON_SIZE),
                              onPressed: () {

                                GrabSheetDao.cancelQueue().then((res){
                                  if(res != null && res.result){
                                    setState(() {
                                      queue = fetchData();
                                    });
                                    new Future.delayed(const Duration(milliseconds: 100), (){
                                      CommonUtils.showShort("取消排队成功");

                                      return true;
                                    });
                                  }
                                  if(res != null && !res.result){
                                    setState(() {
                                      queue = fetchData();
                                    });
                                    new Future.delayed(const Duration(milliseconds: 100), (){
                                      CommonUtils.showShort("" + res.data["error"]["message"].toString());
                                      return true;
                                    });
                                  }
                                });
                              },
                              tooltip: "取消排队",
                              //padding: EdgeInsets.only(right: 40.0, bottom: 45.0),
                            ),
                                 new Text("取消排队"),
                          ],
                        ),

                      ],),
                    ],
                  ),

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