import 'package:dio/dio.dart';

import '../../../../Core/Network/Remote/dio_client.dart';
import '../../../../Core/Utils/Api Constances.dart';

class HomeWebService {
  late String ee;

  Map<String, dynamic>? getHeaders() {
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
    return headers;
  }

  Future<Map<String, dynamic>> videoToTextEnglish(
      FormData  requestBody , String endPoint ,url) async {
    DioHelper.dio.options.headers = getHeaders();
    DioHelper.dio.options.baseUrl = url;
    print(DioHelper.dio.options.baseUrl);
    print(url);
    var response =
        await DioHelper.dio.post(endPoint, data: requestBody);
    print("object");
    return response.data[0];
  }

  Future<Map<String, dynamic>> textToVideoEnglish(
      FormData  requestBody , String endPoint , url) async {
    DioHelper.dio.options.headers = getHeaders();
    DioHelper.dio.options.baseUrl = url;
    print(DioHelper.dio.options.baseUrl);
    print(url);

    var response =
    await DioHelper.dio.post(endPoint, data: requestBody);
    print("object");
    print(response);
    return response.data[0];
  }


}
