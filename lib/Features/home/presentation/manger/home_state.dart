part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class ChangeVideoToTextState extends HomeState {}

class GetUserDataSuccessState extends HomeState {}

class GetUserDataErrorState extends HomeState {
  final String errorMsg;
  GetUserDataErrorState(this.errorMsg);
}
class GetUserDataLoadingState extends HomeState {}


class VideoToTextEnglishLoadedState extends HomeState {}

class VideoToTextEnglishErrorState extends HomeState {
  final String errorMsg;
  VideoToTextEnglishErrorState(this.errorMsg);
}
class VideoToTextEnglishLoadingState extends HomeState {}


class TextToVideoLoadedState extends HomeState {}

class TextToVideoErrorState extends HomeState {
  final String errorMsg;
  TextToVideoErrorState(this.errorMsg);
}
class TextToVideoLoadingState extends HomeState {}
