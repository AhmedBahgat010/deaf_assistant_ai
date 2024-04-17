import 'package:bloc/bloc.dart';
import 'package:deaf_assistant_ai/Core/Utils/Assets%20Manager.dart';
import 'package:meta/meta.dart';

part 'select_language_state.dart';

class SelectLanguageCubit extends Cubit<SelectLanguageState> {
  SelectLanguageCubit() : super(SelectLanguageInitial());

  int? selectedIndex ;

  void changeSelectedIndex (index){
    selectedIndex = index;
    emit(ChangeCurrentIndex());
  }

  List<Language> languages =[
    Language(
      imgAsset: AssetsManager.usa,
      title: "English"
    ),
    Language(
        imgAsset: AssetsManager.egypt,
        title: "Arabic"
    )
  ];
}

class Language {
  String title;
  String imgAsset;

  Language({required this.imgAsset, required this.title});
}
