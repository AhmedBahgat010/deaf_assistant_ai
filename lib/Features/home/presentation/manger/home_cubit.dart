
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deaf_assistant_ai/Features/auth/data/models/SocialUserModel.dart';
import 'package:deaf_assistant_ai/Features/home/data/models/text_to_video_english_response_model.dart';
import 'package:deaf_assistant_ai/Features/home/data/models/video_to_text_english_response_model.dart';

import 'package:deaf_assistant_ai/Features/home/data/repositories/home_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepository homeRepository;
  HomeCubit(this.homeRepository) : super(HomeInitial());


  String initialValue = "English";
  bool isVideoToText = true;

  changeVideoToText (){
    isVideoToText = !isVideoToText;
    emit(ChangeVideoToTextState());
  }

  VideoToTextEnglishResponseModel? responseModel;

  Future<void> videoToTextEnglish({ required FormData  requestBody , required String endPoint ,required String url}) async {
    emit(VideoToTextEnglishLoadingState());
    var actionItems = await homeRepository.videoToTextEnglish(requestBody ,endPoint ,url );
    actionItems.fold((failure) {
      if (kDebugMode) {
        print(failure.message);
      }
      emit(VideoToTextEnglishErrorState(failure.message));
    }, (updatedResponse) {
      responseModel = updatedResponse;
      print("value");
      print(updatedResponse);
      emit(VideoToTextEnglishLoadedState());
    });
  }

  TextToVideoResponseModel? textToVideoResponseModel;

  Future<void> textToVideoEnglish({
    required FormData  requestBody , required String endPoint , required String url}) async {
    print("======================");

    emit(TextToVideoLoadingState());
    var actionItems = await homeRepository.textToVideoEnglish(requestBody ,endPoint ,url);
    actionItems.fold((failure) {
      if (kDebugMode) {
        print(failure.message);
      }
      emit(TextToVideoErrorState(failure.message));
    }, (updatedResponse) {
      print(updatedResponse);
      print("======================");
      textToVideoResponseModel = updatedResponse;
      print("object");
      print(textToVideoResponseModel?.data);
      emit(TextToVideoLoadedState());
    });
  }



  SocialUserModel? userModel;
  void getUserData(uid) {
    print("sfasf");
    emit(GetUserDataLoadingState());
    FirebaseFirestore.instance
        .collection("Users")
        .doc(uid)
        .get()
        .then((DocumentSnapshot<Map<String, dynamic>> documentSnapshot) {
      if (documentSnapshot.exists) {
        userModel = SocialUserModel.fromJson(documentSnapshot.data()!);
        emit(GetUserDataSuccessState());
      } else {
        emit(GetUserDataErrorState("User not found"));
      }
    }).catchError((onError) {
      emit(GetUserDataErrorState(onError.toString()));
    });
  }
}
