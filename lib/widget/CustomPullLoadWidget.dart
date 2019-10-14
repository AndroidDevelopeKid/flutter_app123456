import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app123456/common/config/Config.dart';
import 'package:flutter_app123456/common/style/CustomStyle.dart';
import 'package:flutter_app123456/common/utils/CommonUtils.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

///通用上下刷新控件
class CustomPullLoadWidget extends StatefulWidget {
  ///item渲染
  final IndexedWidgetBuilder itemBuilder;

  ///加载更多回调
  final RefreshCallback onLoadMore;

  ///下拉刷新回调
  final RefreshCallback onRefresh;

  ///控制器，数据和配置
  final CustomPullLoadWidgetControl control;

  final Key refreshKey;

  CustomPullLoadWidget(
      this.control, this.itemBuilder, this.onRefresh, this.onLoadMore,
      {this.refreshKey});

  @override
  _CustomPullLoadWidgetState createState() => _CustomPullLoadWidgetState(
        this.control,
        this.itemBuilder,
        this.onRefresh,
        this.onLoadMore,
        this.refreshKey,
      );
}

class _CustomPullLoadWidgetState extends State<CustomPullLoadWidget> {
  final CustomPullLoadWidgetControl control;

  final IndexedWidgetBuilder itemBuilder;

  final RefreshCallback onLoadMore;

  final RefreshCallback onRefresh;

  final Key refreshKey;

  _CustomPullLoadWidgetState(this.control, this.itemBuilder, this.onRefresh,
      this.onLoadMore, this.refreshKey);

  final ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    ///增加滑动监听
    _scrollController.addListener(() {
      ///判断当前滑动位置是不是到达底部，触发加载更多回调
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        if (this.control.needLoadMore) {
          this.onLoadMore?.call();
        }
      }
    });
    super.initState();
  }

  ///根据配置状态返回实际列表数量
  ///这里可以根据需要做更多的处理，不如加头部，是否需要空页面，是否需要显示加载更多
  _getListCount() {
    ///是否需要头部
    if (control.needHeader) {
      ///如果需要头部，用item 0 的Widget 作为ListView的头部
      ///列表数量大于0时，因为头部和底部加载选项，需要对列表数量总数 + 2
      return (control.dataList.length > 0)
          ? control.dataList.length + 2
          : control.dataList.length + 1;
    } else {
      ///如果不需要头部，在没有数据时，固定返回数量1用于空页面呈现
      if (control.dataList.length == 0) {
        return 1;
      }

      ///如果有数据，因为底部加载数据选项，需要对列表数据总数 + 1
      return (control.dataList.length > 0)
          ? control.dataList.length + 1
          : control.dataList.length;
    }
  }

  ///根据配置状态返回实际列表渲染Item
  _getItem(int index) {
    if (!control.needHeader &&
        index == control.dataList.length &&
        control.dataList.length != 0) {
      ///如果不需要头部，并且数据不为0，当index等于数据长度时，渲染加载更多Item（因为index是从0开始的）
      return _buildProgressIndicator(index);
    } else if (control.needHeader &&
        index == _getListCount() - 1 &&
        control.dataList.length != 0) {
      ///如果需要头部，并且数据不为0，当index等于实际渲染长度 - 1 时，渲染加载更多Item（因为index从0开始）
      return _buildProgressIndicator(index);
    } else if (!control.needHeader && control.dataList.length == 0) {
      ///如果不需要头部，并且数据为0，渲染空页面
      return _buildEmpty();
    } else {
      ///回调外部正常渲染Item,如果这里有需要，可以直接返回相对位置的index
      return itemBuilder(context, index);
    }
  }

  @override
  Widget build(BuildContext context) {
    return new RefreshIndicator(
      ///GlobalKey,用户外部获取RefreshIndicator的state，做显示刷新
      key: refreshKey,

      ///下拉刷新触发，返回的是future
      onRefresh: onRefresh,
      child: new ListView.builder(
        ///保持ListView任何情况下都能滚动，解决在RefreshIndicator的兼容问题
        physics: const AlwaysScrollableScrollPhysics(),

        ///根据状态返回子控件
        itemBuilder: (context, index) {
          return _getItem(index);
        },

        ///根据状态返回数量
        itemCount: _getListCount(),

        ///滑动监听
        controller: _scrollController,
      ),
    );
  }

  ///空页面
  Widget _buildEmpty() {
    return new Container(
      height: MediaQuery.of(context).size.height - 100,
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: 99.0,
            height: 73.0,
            child: Image.asset(CustomIcons.NO_MORE),
          ),
          SizedBox(
            width: 99.0,
            height: 10.0,
          ),
          Text(
            "什么也没有",
            style: TextStyle(color: Color(0xff4C88FF), fontSize: 15.0),
          )
        ],
      ),
    );
  }

  ///上拉加载更多
  Widget _buildProgressIndicator(int index) {
    Widget bottomWidget;
    if (control.needLoadMore) {
      bottomWidget = Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new SpinKitWave(
            color: Color(0xff4C88FF),
            size: 15.0,
          ),
          new Container(
            width: 5.0,
          ),
          new Text(
            CommonUtils.getLocale(context).loadMoreText,
            style: TextStyle(
              color: Color(0xff4C88FF),
              fontSize: 15.0,
            ),
          )
        ],
      );
    }
    if (!control.needLoadMore &&
        _scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent && index > Config.PAGE_SIZE) {
      bottomWidget = Container(
        child: Text(
          "没有更多了...",
          style: TextStyle(color: Color(0xff4C88FF), fontSize: 15.0),
        ),
      );
    }
    return new Padding(
      padding: const EdgeInsets.all(20.0),
      child: new Center(
        child: bottomWidget,
      ),
    );
  }
}

class CustomPullLoadWidgetControl {
  ///数据，对齐增减，不能替换
  List dataList = new List();

  ///是否需要加载更多
  bool needLoadMore = true;

  ///是否需要头部
  bool needHeader = false;

  int total = 0;

  //判断到底后显示没有更多widget
  bool isEnd = false;
}
