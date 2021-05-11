import 'package:flutter/material.dart';
import 'package:flutter_app/http/request/learnWidget/learn_widget.dart';
import 'package:flutter_app/http/request/net_test.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: MyHomePage(),
      home: getTestWidget(),
    );
  }

  Widget getTestWidget(){
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("测试界面"),),),
      body: CustomItem(),
    );
  }

}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("测试")),
      ),
      body: NetTestPage(),
    );
  }
}
