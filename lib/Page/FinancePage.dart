

import 'package:flutter/material.dart';

class FinancePage extends StatefulWidget{
  _FinancePageState createState() => _FinancePageState();
}

class _FinancePageState extends State<FinancePage>{
  @override
  Widget build(BuildContext context){
    return new Scaffold(

      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text("Hi！这里可以看到你赚的银子！"),
          ],
        ),
      ),
    );
  }
}