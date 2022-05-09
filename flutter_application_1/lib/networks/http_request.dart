
import 'package:dio/dio.dart';

import 'http_config.dart';

/// 网络请求
class HttpRequest {
  // 1.创建实例对象
  static final BaseOptions baseOptions =
      BaseOptions(connectTimeout: HTTPConfig.timeout);
  static final Dio dio = Dio(baseOptions);

  static Future<T> request<T>(String url,
      {String method = "get", Map<String, dynamic>? params, Interceptor? inter}) async {
    // 请求的单独配置
    final options = Options(method: method);

    // 默认拦截器
    Interceptor defaultInter = InterceptorsWrapper(
      onRequest: (RequestOptions opts, RequestInterceptorHandler handler) { // 拦截了请求
         return handler.next(opts); // continue
     // 如果你想完成请求并返回一些自定义数据，你可以resolve一个Response对象 `handler.resolve(response)`。
     // 这样请求将会被终止，上层then会被调用，then中返回的数据将是你的自定义response.
     //
     // 如果你想终止请求并触发一个错误,你可以返回一个`DioError`对象,如`handler.reject(error)`，
     // 这样请求将被中止并触发异常，上层catchError会被调用。
      },
      onResponse: (Response response, ResponseInterceptorHandler handler) { // 拦截了响应
          return handler.next(response); // continue

          // 如果你想终止请求并触发一个错误,你可以 reject 一个`DioError`对象,如`handler.reject(error)`，
          // 这样请求将被中止并触发异常，上层catchError会被调用。

      },
      onError: (DioError error, ErrorInterceptorHandler handler) { // 拦截了错误
         return  handler.next(error);//continue
         // 如果你想完成请求并返回一些自定义数据，可以resolve 一个`Response`,如`handler.resolve(response)`。
        // 这样请求将会被终止，上层then会被调用，then中返回的数据将是你的自定义response.
      }
    );
    List<Interceptor> inters = [defaultInter];
    if (inter != null) {
      inters.add(inter);
    }
    dio.interceptors.addAll(inters);

    // 网络请求
    try {
      Response response =
          await dio.request(url, queryParameters: params, options: options);
      return response.data;
    } on DioError catch (e) {
      return Future.error(e);
    }
  }

  /// get请求
  static Future<T> getRequest<T>(String url,
      {Map<String, dynamic>? params, Interceptor? inter}) {
        return request(url, params: params, inter: inter);
  }

  /// post请求
  static Future<T> postRequest<T>(String url,
      {Map<String, dynamic>? params, Interceptor? inter}) {
        return request(url, method: "post",params: params, inter: inter);
  }
}

  
