import 'package:dio/dio.dart';

abstract class Failure {
  final String message;

  Failure(this.message);
}

class ServerFailure extends Failure {
  ServerFailure(super.message);

  factory ServerFailure.fromDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection TimeOut with API Server');

      case DioExceptionType.sendTimeout:
        return ServerFailure('Send TimeOut with API Server');

      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive TimeOut with API Server');

      case DioExceptionType.badCertificate:
        return ServerFailure('Bad Certificate with API Server');

      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            e.response!.statusCode!, e.response!.data);

      case DioExceptionType.cancel:
        return ServerFailure('Request to API Server Cancelled');

      case DioExceptionType.connectionError:
        return ServerFailure('No Internet Connection');

      case DioExceptionType.unknown:
        if (e.error!.toString().contains('SocketException')) {
          return ServerFailure('No Internet Connection');
        } else {
          return ServerFailure('Ops, There was an Error, Please Try Again');
        }
    }
  }

  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == 404) {
      return ServerFailure('Your Request was not Found');
    } else if (statusCode == 500) {
      print(response);
      return ServerFailure(
          'There is a Problem with Sever, Please try again Later');
    } else if (statusCode == 400 ||
        statusCode == 401 ||
        statusCode == 403 ||
        statusCode == 422) {
      return ServerFailure(response['message']);
    } else {
      return ServerFailure(
          'There Was an Error +${statusCode.toString()}, Try Again');
    }
  }
}
