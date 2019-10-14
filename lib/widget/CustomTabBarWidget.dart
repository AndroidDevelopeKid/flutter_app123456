import 'package:flutter/material.dart';

///支持顶部和底部的TabBar控件
///配合AutomaticKeepAliveClientMixin可以keep
class CustomTabBarWidget extends StatefulWidget {
  ///底部模式type
  static const int BOTTOM_TAB = 1;

  ///顶部模式type
  static const int TOP_TAB = 2;

  final int type;

  final List<List<Widget>> tabItemsList;

  final List<Widget> tabViews;

  final Color backgroundColor;

  final Color indicatorColor;

  final Widget title;

  final Widget drawer;

  final Widget floatingActionButton;

  final TarWidgetControl tarWidgetControl;

  final PageController topPageControl;

  final ValueChanged<int> onPageChanged;

  CustomTabBarWidget(
      {Key key,
      this.type,
      this.tabItemsList,
      this.tabViews,
      this.backgroundColor,
      this.indicatorColor,
      this.title,
      this.drawer,
      this.floatingActionButton,
      this.tarWidgetControl,
      this.topPageControl,
      this.onPageChanged})
      : super(key: key);

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

class _CustomTabBarState extends State<CustomTabBarWidget>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0; //选中位置

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
  List<Widget> _tabItems;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(
        length: widget.tabItemsList.first.length, vsync: this);
    _tabItems = widget.tabItemsList[0];
    _tabController.addListener(() => _onTabChanged());
  }

  ///整个页面dispose时，控制器也应dispose，释放内存
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    if (this._type == CustomTabBarWidget.TOP_TAB) {
      return Scaffold(
        floatingActionButton: _floatingActionButton,
        persistentFooterButtons:
            _tarWidgetControl == null ? [] : _tarWidgetControl.footerButton,
        appBar: new AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: _title,
          bottom: new TabBar(
            controller: _tabController,
            tabs: _tabItems,
            indicatorColor: _indicatorColor,
          ),
        ),
        body: new PageView(
          controller: _pageController,
          children: _tabViews,
          onPageChanged: (index) {
            _tabController.animateTo(index);
            _onPageChanged?.call(index);
          },
        ),
      );
    }

    ///底部tabbar
    return Scaffold(
      drawer: _drawer,
//      appBar: new AppBar(
//        elevation: 0,
//        brightness: Brightness.light,
//        backgroundColor: Colors.white,
//        title: Row(children: <Widget>[
//          Padding(
//            padding: EdgeInsets.only(left: 15.0, top: 15.0, bottom: 9.0),
//            child: Image.asset("assets/images/statelogo.png"),
//          ),
//        ],
//          ),
//      ),
      body: new TabBarView(
        //TabBarView呈现内容，所以放到body中
        controller: _tabController, //配置控制器
        children: _tabViews,
      ),
      bottomNavigationBar: new Material(
        //为了适配主题风格，套一层material实现风格
        color: Colors.white,
        child: new TabBar(
          //TabBar导航标签，底部导航放到Scaffold的bottomNavigationBar中
          controller: _tabController,
          tabs: _tabItems,
          indicatorColor: _indicatorColor,
          labelColor: Color(0xff4C88FF),
          unselectedLabelColor: Color(0xffAAAAAA), //tab标签下划线颜色
        ), //导航栏底部颜色
      ),
    );
  }

  _onTabChanged() {
    if (_tabController.indexIsChanging) {
      if (this.mounted) {
        this.setState(() {
          switch (_tabController.index) {
            case 0:
              _tabItems = widget.tabItemsList[0];
              break;
            case 1:
              _tabItems = widget.tabItemsList[1];
              break;
            case 2:
              _tabItems = widget.tabItemsList[2];
              break;
            case 3:
              _tabItems = widget.tabItemsList[3];
              break;
          }
          _currentIndex = _tabController.index;
        });
      }
    }
  }
}

class TarWidgetControl {
  List<Widget> footerButton = [];
}
