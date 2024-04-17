
import 'package:dartz/dartz.dart';
import 'package:deaf_assistant_ai/Core/Network/Remote/dio_exception.dart';
import 'package:deaf_assistant_ai/Features/home/data/models/text_to_video_english_response_model.dart';
import 'package:deaf_assistant_ai/Features/home/data/web_services/home_web_service.dart';
import 'package:dio/dio.dart';
import '../models/video_to_text_english_response_model.dart';
class HomeRepository {
  late final HomeWebService homeWebService;
  HomeRepository(this.homeWebService);

  Future<Either<Failure, VideoToTextEnglishResponseModel>> videoToTextEnglish(
  FormData  requestBody , String endPoint , url) async {
    try {
      final actionItem = await homeWebService.videoToTextEnglish(requestBody , endPoint ,url);
      return right(VideoToTextEnglishResponseModel.fromJson(actionItem));
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  Future<Either<Failure, TextToVideoResponseModel>> textToVideoEnglish(
      FormData  requestBody , String endPoint ,url) async {
    try {
      final actionItem = await homeWebService.textToVideoEnglish(requestBody , endPoint , url);
      print(actionItem);
      return right(TextToVideoResponseModel.fromJson(actionItem));
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

}
