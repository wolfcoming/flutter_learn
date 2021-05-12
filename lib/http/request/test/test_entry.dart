import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_app/http/request/test/net_test.dart';

import 'learnWidget/learn_widget.dart';

class TestEntry extends StatelessWidget {
  var hashMap = HashMap();

  @override
  Widget build(BuildContext context) {
    hashMap["widget实战页"] = ArticleListView();
    hashMap["网络请求"] = NetTestPage();
    var keys = hashMap.keys.toList();
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("测试入口"),
        ),
      ),
      body: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            var key = keys[index];
            return ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return hashMap[key];
                  }));
                },
                child: Text(key));
          },
          itemCount: keys.length),
    );
  }
}
