import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../../Utils/Api Constances.dart';
import 'dio_interceptor.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(BaseOptions(
      baseUrl: APIConstances().baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: APIConstances.connectTimeout),
      receiveTimeout: const Duration(seconds: APIConstances.receiveTimeout),
    ));
    dio.interceptors.addAll([
      // DioInterceptor(),
      PrettyDioLogger(
        requestBody: true,
      )
    ]);
  }

  static Future<Response> getData(
      {required String url,
      Map<String, dynamic>? query,
      String? token}) async {
    dio.options.headers = {
      "Accept": "application/json",
      // "Authorization": "Bearer $token",
    };
    return await dio.get(url, queryParameters: query);
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String? token,
  }) async {
    dio.options.headers = {
      "Accept": "application/json",
      // "Authorization": token != null ? "Bearer $token" : null,
    };
    return await dio.post(
      url,
      data: data,
      queryParameters: query,
    );
  }

}
