import 'package:deaf_assistant_ai/Core/Theme/LightTheme.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'Core/Utils/App Strings.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.widgetScreen});
  final Widget widgetScreen;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // TODO: Localize the app name
      debugShowCheckedModeBanner: false,
      title: AppString.appName,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: lightTheme,
      home: widgetScreen,
    );
  }
}

