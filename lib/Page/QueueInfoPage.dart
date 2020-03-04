import 'dart:convert';

import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app123456/common/config/Config.dart';
import 'package:flutter_app123456/common/dao/GrabSheetDao.dart';
import 'package:flutter_app123456/common/local/LocalStorage.dart';
import 'package:flutter_app123456/common/model/Queue.dart';
import 'package:flutter_app123456/common/style/CustomStyle.dart';
import 'package:flutter_app123456/common/utils/CommonUtils.dart';
import 'package:flutter_app123456/widget/CustomErrorReturnWidget.dart';
import 'package:flutter_app123456/widget/CustomTableRowWidget.dart';

class QueueInfoPage extends StatefulWidget {
  static final String name = "QueueInfo";

  QueueInfoPage({Key key}) : super(key: key);

  _QueueInfoPage createState() => _QueueInfoPage();
}

class _QueueInfoPage extends State<QueueInfoPage> {
  Future<Queue> queue;

  Future<Queue> fetchData() async {
    //ar queueInfo = await LocalStorage.get(Config.QUEUE_INFO);
    //if (queueInfo == null) {
      var queueInfoCallInterface = await GrabSheetDao.getCurrentQueueInfo();
      if (queueInfoCallInterface != null && queueInfoCallInterface.result) {
        if (queueInfoCallInterface.data["result"] == null) {
          var dataNull = new Queue(null, null, null, null, null, null, null,
              null, null, null, null, null, null);
          return dataNull;
        }
        return Queue.fromJson(queueInfoCallInterface.data["result"]);
      }
      if (!queueInfoCallInterface.result) {
        if (queueInfoCallInterface.data != null) {
          var dataNull = new Queue(
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
              queueInfoCallInterface.data["error"]["message"],
              null,
              null);
          return dataNull;
        }
      }
//    } else {
//      Queue queueData = Queue.fromJson(json.decode(queueInfo));
//      return queueData;
//    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    queue = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            iconSize: 15.0,
            icon: Icon(CustomIcons.BACK, color: Color(0xff4C88FF)),
            onPressed: () {
              Navigator.of(context).pop();
            }),
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        title:
            Text("排队信息", style: TextStyle(fontSize: 18.0, color: Colors.black)),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 10.0),
        child: Container(
          child: FutureBuilder<Queue>(
            future: queue,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                //return Text(snapshot.data.vehicleCode);
                return Padding(
                  padding: EdgeInsets.only(
                      top: 15.0, left: 25.0, right: 25.0, bottom: 15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Table(
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
                              "司机身份证号",
                              snapshot.data.driverIDCardNumber == null
                                  ? "无"
                                  : snapshot.data.driverIDCardNumber,
                            ),
                          ]),
                          TableRow(children: <Widget>[
                            CustomTableRowWidget(
                              "排队时间",
                              snapshot.data.queueDateTime == null
                                  ? "无"
                                  : TimelineUtil.formatByDateTime(
                                      DateTime.parse(
                                          snapshot.data.queueDateTime),
                                      dayFormat: DayFormat.Full),
                            ),
                          ]),
                          TableRow(children: <Widget>[
                            CustomTableRowWidget(
                              "排队状态",
                              snapshot.data.queueStateText == null
                                  ? "无"
                                  : snapshot.data.queueStateText,
                            ),
                          ]),
                          TableRow(children: <Widget>[
                            CustomTableRowWidget(
                              "还需等待内部车辆排队数量",
                              snapshot.data.frontInnerQueueVehicleAmount == null
                                  ? "无"
                                  : snapshot.data.frontInnerQueueVehicleAmount
                                      .toString(),
                            ),
                          ]),
                          TableRow(children: <Widget>[
                            CustomTableRowWidget(
                              "还需等待全部车辆排队数量",
                              snapshot.data.frontTotalQueueVehicleAmount == null
                                  ? "无"
                                  : snapshot.data.frontTotalQueueVehicleAmount
                                      .toString(),
                            ),
                          ]),
                          TableRow(children: <Widget>[
                            CustomTableRowWidget(
                              "排队来源",
                              snapshot.data.organizationTypeText == null
                                  ? "无"
                                  : snapshot.data.organizationTypeText,
                            ),
                          ]),
                          TableRow(children: <Widget>[
                            CustomTableRowWidget(
                              "排队变化时间",
                              snapshot.data.queueChangeDateTime == null
                                  ? "无"
                                  : TimelineUtil.formatByDateTime(
                                      DateTime.parse(
                                          snapshot.data.queueChangeDateTime),
                                      dayFormat: DayFormat.Full),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Expanded(
                            child: FlatButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(2.0)),
                              child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 17.5),
                                  child: Text(
                                    "排队刷新",
                                    style: TextStyle(
                                        fontSize: 15.0, color: Colors.white),
                                  )),
                              color: Color(0xff4C88FF),
                              onPressed: () {
                                GrabSheetDao.getCurrentQueueInfo().then((res) {
                                  if (res != null && res.result) {
                                    setState(() {
                                      queue = fetchData();
                                    });
                                    new Future.delayed(
                                        const Duration(milliseconds: 100), () {
                                      CommonUtils.showShort("刷新排队成功");
                                      return true;
                                    });
                                  }
                                  if (res != null && !res.result) {
                                    setState(() {
                                      queue = fetchData();
                                    });
                                    new Future.delayed(
                                        const Duration(milliseconds: 100), () {
                                      CommonUtils.showShort("" +
                                          res.data["error"]["message"]
                                              .toString());
                                      return true;
                                    });
                                  }
                                });
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10.0),
                          ),
                          Expanded(
                            child: FlatButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(2.0)),
                              child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 17.5),
                                  child: Text(
                                    "取消排队",
                                    style: TextStyle(
                                        fontSize: 15.0, color: Colors.white),
                                  )),
                              color: Color(0xffFF4C4C),
                              onPressed: () {
                                GrabSheetDao.cancelQueue().then((res) {
                                  if (res != null && res.result) {
                                    setState(() {
                                      queue = fetchData();
                                    });
                                    new Future.delayed(
                                        const Duration(milliseconds: 100), () {
                                      CommonUtils.showShort("取消排队成功");

                                      return true;
                                    });
                                  }
                                  if (res != null && !res.result) {
                                    setState(() {
                                      queue = fetchData();
                                    });
                                    new Future.delayed(
                                        const Duration(milliseconds: 100), () {
                                      CommonUtils.showShort("" +
                                          res.data["error"]["message"]
                                              .toString());
                                      return true;
                                    });
                                  }
                                });
                              },
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                );
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
