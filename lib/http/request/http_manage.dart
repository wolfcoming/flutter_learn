import 'package:dio/dio.dart';
import 'package:flutter_app/http/request/wandroid_error_interceptor.dart';

const String BASEURL = "https://wanandroid.com/";

enum HttpMethod { POST, GET }

class HTTPConfig {
  static const baseURL = BASEURL;
  static const timeout = 1000;
}

class WanApiHttpRequest {
  static final BaseOptions options = BaseOptions(
      baseUrl: HTTPConfig.baseURL, connectTimeout: HTTPConfig.timeout);
  static final Dio dio = Dio(options);

  static Future<T> request<T>(String url,
      {HttpMethod method = HttpMethod.GET,
      Map<String, dynamic>? params}) async {
    // 1.请求的单独配置
    final options = Options(method: method == HttpMethod.GET ? "get" : "post");
    // 2. 配置拦截器
    dio.interceptors.add(WanAndroidErrorInterceptor());
    // 3.发送网络请求
    try {
      Response response =
          await dio.request<T>(url, queryParameters: params, options: options);
      if (response.statusCode == 200) {
        var result = response.data;
        //处理业务码
        if (result['errorCode'] == 0) {
          return result['data'];
        } else {
          throw Exception(result["errorMsg"]);
        }
      } else {
        throw Exception(response.statusCode.toString() +
            ":" +
            response.statusMessage.toString());
      }
    } on DioError catch (e) {
      return Future.error(e);
    }
  }
}
