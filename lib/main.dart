import 'package:deaf_assistant_ai/Core/Network/Local/Shared_preferences.dart';
import 'package:deaf_assistant_ai/Core/Network/Remote/dio_client.dart';
import 'package:deaf_assistant_ai/Core/Utils/Assets%20Manager.dart';
import 'package:deaf_assistant_ai/Core/Utils/extra_cubit/extra_cubit.dart';
import 'package:deaf_assistant_ai/Features/auth/presentation/view/login_screen.dart';
import 'package:deaf_assistant_ai/Features/home/presentation/view/home_view.dart';
import 'package:deaf_assistant_ai/Features/select_language/presentation/view/get_started_view.dart';
import 'package:deaf_assistant_ai/Features/select_language/presentation/view/select_language_view.dart';
import 'package:deaf_assistant_ai/Features/select_language/presentation/view/select_user_type.dart';
import 'package:deaf_assistant_ai/Features/splash/presentation/view/splash_page.dart';
import 'package:deaf_assistant_ai/firebase_options.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app.dart';
import 'bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await EasyLocalization.ensureInitialized();
  EasyLocalization.logger.enableBuildModes = [];
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();

  String? userType = CacheHelper.getData("UserType");
  bool? getStarted = CacheHelper.getData("GetStarted");
  String? userLang = CacheHelper.getData("UserLang");
  String? token = CacheHelper.getData("token");


  Widget? widgetScreen;

  if (token != null) {
    widgetScreen = HomeView();
  }
  else if (userType != null && getStarted != null && userLang != null) {
    widgetScreen = const LoginScreen();
  } else if (getStarted != null && userType == null) {
    widgetScreen = const SelectUserType();
  } else if (userType != null && userLang == null) {
    widgetScreen = const SelectLanguageView();
  } else if (userType == null && getStarted == null && userLang == null) {
    widgetScreen = const GetStartedView();
  }
  runApp(EasyLocalization(
    path: AssetsManager.translationsFolder,
    supportedLocales: const [
      Locale('en'),
      Locale('ar'),
    ],
    useOnlyLangCode: true,
    startLocale: const Locale('en'),
    fallbackLocale: const Locale('en'),
    child: BlocProvider(
      create: (context) => ExtrasCubit()..getModelUrl(),
      child: MyApp(widgetScreen: SplashPage(widgetScreen: widgetScreen)),
    ),
  ));
}
