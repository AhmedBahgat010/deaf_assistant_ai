

import '../../data/models/SocialUserModel.dart';

abstract class LoginStates {}

class LoginInitialState extends LoginStates {}
class LoginLoadingState extends LoginStates {}
class LoginSuccessState extends LoginStates {
  late String uId;
  LoginSuccessState(this.uId);
}
class LoginErrorState extends LoginStates {
  final String error;
  LoginErrorState(this.error);
}
class ChangeShowPasswordState extends LoginStates {
}

class CreateUserLoadingState extends LoginStates {}
class CreateUserSuccessState extends LoginStates {
  late SocialUserModel socialUserModel;
  CreateUserSuccessState(this.socialUserModel);
}
class RegistrationLoadingState extends LoginStates {}
class RegistrationSuccessState extends LoginStates {
  late String uId;
  RegistrationSuccessState(this.uId);
}
class RegistrationErrorState extends LoginStates {
  final String error;
  RegistrationErrorState(this.error);
}

class CreateUserErrorState extends LoginStates {
  final String error;
  CreateUserErrorState(this.error);
}