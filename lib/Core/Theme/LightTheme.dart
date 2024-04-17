import 'package:deaf_assistant_ai/Core/Utils/App%20Textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../Utils/App Colors.dart';

ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: AppColors.white,
  platform: TargetPlatform.iOS,
  fontFamily: "Cairo",
  primaryColor: AppColors.primarySwatch,
  canvasColor: Colors.transparent,
  iconTheme: const IconThemeData(color: AppColors.primaryColor, size: 25),
  primarySwatch: Colors.orange,
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.white,
    toolbarHeight: 50,
    elevation: 0,
    surfaceTintColor: AppColors.white,
// color: AppColors.white,
    centerTitle: true,
    iconTheme: const IconThemeData(color: AppColors.black),
    titleTextStyle: AppTextStyles.bold.copyWith(
      color: AppColors.black,
      fontFamily: "Cairo",
    ),
    // systemOverlayStyle: SystemUiOverlayStyle(
    //     // statusBarColor: AppColors.primaryColor,
    //     statusBarIconBrightness: Brightness.light)
  ),
);
