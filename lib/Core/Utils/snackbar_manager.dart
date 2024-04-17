// import 'package:another_flushbar/flushbar.dart';
// import 'package:flutter/material.dart';
// import 'package:iconsax/iconsax.dart';
//
// import 'App Colors.dart';
//
// class FlushBarManager {
//   static void showSuccessfulFlushBar(BuildContext context, String message) {
//     _showFlushBar(
//       context,
//       message,
//       Iconsax.copy_success,
//       AppColors.lightGreen,
//       AppColors.lightGreen,
//     );
//   }
//
//   static void showFailureFlushBar(BuildContext context, String message) {
//     _showFlushBar(
//       context,
//       message,
//       Icons.error_outline,
//       AppColors.red,
//       AppColors.red,
//     );
//   }
//
//   static void _showFlushBar(
//     BuildContext context,
//     String message,
//     IconData icon,
//     Color leftBarColor,
//     Color backgroundColor,
//   ) {
//     Flushbar(
//       message: message,
//       icon: Icon(
//         icon,
//         size: 28.0,
//         color: AppColors.white,
//       ),
//       margin: const EdgeInsets.all(6.0),
//       flushbarStyle: FlushbarStyle.FLOATING,
//       flushbarPosition: FlushbarPosition.TOP,
//       textDirection: Directionality.of(context),
//       borderRadius: BorderRadius.circular(12),
//       duration: const Duration(seconds: 3),
//       leftBarIndicatorColor: leftBarColor,
//       backgroundColor: backgroundColor,
//     ).show(context).then((value) {
//       if (leftBarColor == AppColors.lightGreen) {
//         Navigator.pop(context);
//       }
//     });
//   }
// }
