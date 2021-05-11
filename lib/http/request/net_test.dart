import 'dart:collection';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import 'http_manage.dart';

class NetTestPage extends StatelessWidget {
  var baseUrl = "https://wanandroid.com/";

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: ElevatedButton(
          onPressed: _testRequest,
          child: Text("网络请求1"),
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
      logger.e(response);
    } catch (e) {
      print("HHHH:" + e.toString());
    }
  }

  //post请求
  void _postRequest() async {
    try {
      HashMap<String, String> map = new HashMap();
      map['username'] = "yangqing11211";
      map['password'] = "yangqing971121";
      var response = await WanApiHttpRequest.request(
          "user/login",
          method: HttpMethod.POST,
          params: map);
      logger.e(response);
    } catch (e) {
      logger.e(e.toString());
    }
  }
}
