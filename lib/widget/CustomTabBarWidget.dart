
import 'package:flutter/material.dart';
///支持顶部和底部的TabBar控件
///配合AutomaticKeepAliveClientMixin可以keep
class CustomTabBarWidget extends StatefulWidget{
  ///底部模式type
  static const int BOTTOM_TAB = 1;
  ///顶部模式type
  static const int TOP_TAB = 2;

  final int type;

  final List<Widget> tabItems;

  final List<Widget> tabViews;

  final Color backgroundColor;

  final Color indicatorColor;

  final Widget title;

  final Widget drawer;

  final Widget floatingActionButton;

  final TarWidgetControl tarWidgetControl;

  final PageController topPageControl;

  final ValueChanged<int> onPageChanged;

  CustomTabBarWidget({
    Key key,
    this.type,
    this.tabItems,
    this.tabViews,
    this.backgroundColor,
    this.indicatorColor,
    this.title,
    this.drawer,
    this.floatingActionButton,
    this.tarWidgetControl,
    this.topPageControl,
    this.onPageChanged
  }) : super(key: key);

  _CustomTabBarState createState() => new _CustomTabBarState(
    type,
    tabViews,
    indicatorColor,
    title,
    drawer,
    floatingActionButton,
    tarWidgetControl,
    topPageControl,
    onPageChanged,
  );
}

class _CustomTabBarState extends State<CustomTabBarWidget> with SingleTickerProviderStateMixin{

  final int _type;

  final List<Widget> _tabViews;

  final Color _indicatorColor;

  final Widget _title;

  final Widget _drawer;

  final Widget _floatingActionButton;

  final TarWidgetControl _tarWidgetControl;

  final PageController _pageController;

  final ValueChanged<int> _onPageChanged;

  _CustomTabBarState(
      this._type,
      this._tabViews,
      this._indicatorColor,
      this._title,
      this._drawer,
      this._floatingActionButton,
      this._tarWidgetControl,
      this._pageController,
      this._onPageChanged,
      ) : super();

  TabController _tabController;

  @override
  void initState(){
    super.initState();
    _tabController = new TabController(length: widget.tabItems.length, vsync: this);
  }
  ///整个页面dispose时，控制器也应dispose，释放内存
  @override
  void dispose(){
    _tabController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context){
    if(this._type == CustomTabBarWidget.TOP_TAB){
      return new Scaffold(
        floatingActionButton: _floatingActionButton,
        persistentFooterButtons: _tarWidgetControl == null ? [] : _tarWidgetControl.footerButton,
        appBar: new AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: _title,
          bottom: new TabBar(
              controller: _tabController,
              tabs: widget.tabItems,
              indicatorColor: _indicatorColor,
          ),
        ),
        body: new PageView(
          controller: _pageController,
          children: _tabViews,
          onPageChanged: (index){
            _tabController.animateTo(index);
            _onPageChanged?.call(index);
          },
        ),
      );
    }
    ///底部tabbar
    return new Scaffold(
      drawer: _drawer,
      appBar: new AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: _title,
      ),
      body: new TabBarView(//TabBarView呈现内容，所以放到body中
        controller: _tabController,//配置控制器
        children: _tabViews,
      ),
      bottomNavigationBar: new Material(
        //为了适配主题风格，套一层material实现风格
        color: Theme.of(context).primaryColor,
        child: new TabBar(
          //TabBar导航标签，底部导航放到Scaffold的bottomNavigationBar中
          controller: _tabController,
          tabs: widget.tabItems,
          indicatorColor: _indicatorColor,//tab标签下划线颜色
        ),//导航栏底部颜色
      ),
    );
  }
}

class TarWidgetControl{
  List<Widget> footerButton = [];
}