import 'package:flutter/material.dart';
import 'package:flutter_app/http/request/test/net_test.dart';
import 'package:flutter_app/http/request/test/test_entry.dart';

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
      home: MyHomePage(),
    );
  }

}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("首页")),
      ),
      body: Stack(
        children: [
          Positioned(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return TestEntry();
                }));
              },
              child: Text("测试入口"),
            ),
            bottom: 40,
            left: 20,
          )
        ],
      ),
    );
  }
}
