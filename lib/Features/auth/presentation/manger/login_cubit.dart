import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deaf_assistant_ai/Features/auth/data/models/SocialUserModel.dart';
import 'package:deaf_assistant_ai/Features/auth/presentation/manger/login_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  void loginUser(String email, String password) {
    emit(LoginLoadingState());
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      emit(LoginSuccessState(value.user!.uid));
      print(value.user!.uid);
    }).catchError((onError) {
      emit(LoginErrorState(onError.message.toString()));
    });
  }

  bool obscureText = false;
  void showPassword() {
    obscureText = (!obscureText);
    if (kDebugMode) {
      print(obscureText);
    }
    emit(ChangeShowPasswordState());
  }

  final formKey = GlobalKey<FormBuilderState>();

  final formKey2 = GlobalKey<FormBuilderState>();

  Map<String, dynamic>? getFormData() {
    final formState = formKey.currentState;

    if (formState == null) return null;
    if (formState.saveAndValidate() == false) return null;

    return formState.value;
  }

  Map<String, dynamic>? getFormData2(formKey2) {
    final formState = formKey2.currentState;

    if (formState == null) return null;
    if (formState.saveAndValidate() == false) return null;

    return formState.value;
  }

  Future<void> createUser(
      {required String email,
      required String password,
      required String name,
      required String uid,
      required String userType}) async {
    SocialUserModel model = SocialUserModel(
      email: email,
      name: name,
      uId: uid,
      userType: userType
    );
    FirebaseFirestore.instance
        .collection("Users")
        .doc(uid)
        .set(model.toMap())
        .then((value) {
      emit(CreateUserSuccessState(model));
    }).catchError((onError) {
      emit(CreateUserErrorState(onError.message.toString()));
    });
  }

  void registrationUser(
      {required String email,
      required String password,
      required String name,
      required String userType}) {
    emit(RegistrationLoadingState());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) async {
      await createUser(
          email: email,
          password: password,
          name: name,
          uid: value.user!.uid,
          userType: userType);
      emit(RegistrationSuccessState(value.user!.uid));
    }).catchError((onError) {
      emit(RegistrationErrorState(onError.message.toString()));
    });
  }
}
