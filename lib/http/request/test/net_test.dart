import 'dart:collection';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import '../http_manage.dart';

class NetTestPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NetTestState();
  }
}

class _NetTestState extends State<NetTestPage> {
  var result = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("网络测试"),
      ),
      body: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _testRequest,
              child: Text("网络请求"),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Text(result),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _testRequest() {
    _getRequest();
    // _postRequest();
  }

  var logger = Logger();

  //测试get请求
  void _getRequest() async {
    try {
      var response = await WanApiHttpRequest.request("wxarticle/chapters/json");
      setState(() {
        result = json.encode(response);
      });
      logger.e(response);
    } catch (e) {
      print("HHHH:" + e.toString());
    }
  }

  //post请求
  //post请求
  void _postRequest() async {
    try {
      HashMap<String, String> map = new HashMap();
      map['username'] = "yangqing11211";
      map['password'] = "yangqing971121";
      var response = await WanApiHttpRequest.request("user/login",
          method: HttpMethod.POST, params: map);
      logger.e(response);
    } catch (e) {
      logger.e(e.toString());
    }
  }
}
