import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app123456/Page/HistoryBillDetailPage.dart';
import 'package:flutter_app123456/widget/CustomListState.dart';
import 'package:flutter_app123456/widget/HistoryBillItem.dart';

abstract class BaseHistoryBillState<T extends StatefulWidget> extends State<T> with AutomaticKeepAliveClientMixin<T>, CustomListState<T>{
  ///渲染item
  @protected
  renderItem(index, VoidCallback refreshCallBack){
    return new HistoryBillItem(HistoryBillItemViewModel.fromMap(pullLoadWidgetControl.dataList[index]), onPressed: () async{
      //历史提货单不跳转详情，直接列表显示
      //跳转详情
      Navigator.push(context, new CupertinoPageRoute(builder: (context){
        return new HistoryBillDetailPage(HistoryBillItemViewModel.fromMap(pullLoadWidgetControl.dataList[index]));
      }));

    },);

  }

  @override
  bool get wantKeepAlive => true;

  @override
  bool get isRefreshFirst => false;

  @override
  bool get needHeader => false;

}