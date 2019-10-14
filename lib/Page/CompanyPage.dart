import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app123456/common/dao/UserDao.dart';
import 'package:flutter_app123456/common/model/Tenant.dart';
import 'package:flutter_app123456/common/style/CustomStyle.dart';
import 'package:flutter_app123456/common/utils/NavigatorUtils.dart';
import 'package:flutter_app123456/widget/CustomErrorReturnWidget.dart';

class CompanyPage extends StatefulWidget {
  static final String sName = "company";

  @override
  _CompanyPageState createState() => _CompanyPageState();
}

class _CompanyPageState extends State<CompanyPage> {
  Future<List<Tenant>> tenants;

  Future<List<Tenant>> fetchData(skipCount) async {
    final List<Tenant> tenantList = new List();
    var tenants = await UserDao.getTenants(100, skipCount);

    if (tenants.data != null && tenants.result) {
      var itemList = tenants.data["result"]["items"];
      print("tenants's itemList: " +
          itemList.toString() +
          itemList.length.toString());
      print("tenants itemList length: " + itemList.length.toString());
      for (int i = 0; i < itemList.length; i++) {
        var id = itemList[i]["id"];
        var tenancyName = itemList[i]["tenancyName"];
        var name = itemList[i]["name"];
        var isActive = itemList[i]["isActive"];
        tenantList.add(new Tenant(isActive, id, name, tenancyName));
      }
      return tenantList;
    }
    return null;
  }

  @override
  void initState() {
    super.initState();
    tenants = fetchData(0);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    // TODO: implement build
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              IconButton(
                  iconSize: 15.0,
                  icon: Icon(CustomIcons.BACK, color: Color(0xff4C88FF)),
                  onPressed: () {
                    NavigatorUtils.goBackWithNoParams(context);
                  }),
              Text(
                "物流公司",
                style: TextStyle(fontSize: 17.0),
              ),
            ],
          ),
          FutureBuilder<List<Tenant>>(
            future: tenants,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Expanded(
                    child: ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(
                                left: 5.0, right: 5.0, top: 5.0, bottom: 5.0),
                            child: RaisedButton(
                              onPressed: () {
                                //跳转页面选择物流公司
                                NavigatorUtils.goBackWithParams(
                                    context, snapshot.data[index]);
                              },
                              child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 18.0),
                                  child: Text(
                                    snapshot.data[index].name,
                                    style: TextStyle(
                                        fontSize: 17.0, color: Colors.white),
                                  )),
                              color: Color(0xffB4CDFF),
                            ),
                          );
                        }));
              } else if (snapshot.hasError) {
                return CustomErrorReturnWidget();
              }
              return SizedBox(height: 2.0, child: LinearProgressIndicator());
            },
          ),
        ],
      ),
    ));
  }
}
