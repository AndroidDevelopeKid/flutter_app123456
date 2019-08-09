import 'package:flutter/material.dart';
import 'package:flutter_app123456/widget/CustomListState.dart';
import 'package:flutter_app123456/widget/RefuelInquiryItem.dart';

abstract class BaseRefuelInquiryState<T extends StatefulWidget> extends State<T> with AutomaticKeepAliveClientMixin<T>, CustomListState<T>{
  ///渲染item
  @protected
  renderItem(index, VoidCallback refreshCallBack){
    return new RefuelInquiryItem(RefuelInquiryItemViewModel.fromMap(pullLoadWidgetControl.dataList[index]), onPressed: () async{
      //历史提货单不跳转详情，直接列表显示

    },);

  }

  @override
  bool get wantKeepAlive => true;

  @override
  bool get isRefreshFirst => false;

  @override
  bool get needHeader => false;

}