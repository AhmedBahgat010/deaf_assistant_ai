

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deaf_assistant_ai/Core/Utils/Api%20Constances.dart';
import 'package:deaf_assistant_ai/Core/Utils/App%20Constances.dart';
import 'package:deaf_assistant_ai/Features/home/data/repositories/home_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'extra_state.dart';

class ExtrasCubit extends Cubit<ExtrasState> {
  ExtrasCubit() : super(ExtrasStateInitial());

  String? model;
  void getModelUrl() {
    emit(GetModelResponseLoadingState());
    FirebaseFirestore.instance
        .collection("Models")
        .doc("model_1")
        .get()
        .then((DocumentSnapshot<Map<String, dynamic>> documentSnapshot) {
      if (documentSnapshot.exists) {
        model=  documentSnapshot.data()!["url"];
        APIConstances().baseUrl = model!;
        print(APIConstances().baseUrl);
        emit(GetModelResponseLoadedState());
      } else {
        emit(GetModelResponseErrorState("-----"));
      }
    }).catchError((onError) {
      print(onError.toString());
      emit(GetModelResponseErrorState(onError.toString()));
    });
  }






}
