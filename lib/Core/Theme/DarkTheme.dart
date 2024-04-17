
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../Utils/App Colors.dart';

ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: Colors.grey.shade900,
  primaryColor: Colors.black,
  colorScheme: ColorScheme.dark(),
  iconTheme: IconThemeData(color: Colors.purple.shade200, opacity: 0.8),  platform: TargetPlatform.iOS,
  primarySwatch: Colors.green,
  appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.white,
      toolbarHeight: 50,
      elevation: 0,

      centerTitle: true,
      iconTheme: IconThemeData(color: AppColors.black),
      titleTextStyle: TextStyle(
        color: AppColors.black,
        fontSize: 25,
        fontWeight: FontWeight.w500,
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: AppColors.primarySwatch,
          statusBarIconBrightness: Brightness.light)),
);