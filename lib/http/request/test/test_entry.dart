import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_app/http/request/learnWidget/learn_widget.dart';
import 'package:flutter_app/http/request/net_test.dart';

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
      body: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            var key = keys[index];
            return hashMap[key];
          },
          separatorBuilder: SeparatorLine,
          itemCount: hashMap.length),
    );
  }

  Widget SeparatorLine(BuildContext context,int index){
    return  Container(height: 0.2, width: 1000, color: Colors.grey);
  }
}
