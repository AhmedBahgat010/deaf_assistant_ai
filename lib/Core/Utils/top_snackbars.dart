import 'package:deaf_assistant_ai/Core/Utils/App%20Colors.dart';
import 'package:deaf_assistant_ai/Core/Utils/App%20Colors.dart';
import 'package:deaf_assistant_ai/Core/Utils/App%20Colors.dart';
import 'package:deaf_assistant_ai/Core/Utils/snackbars.dart';
import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

// TODO: Implement the snackbars in the UI
class TopSnackbars implements Snackbars {
  @override
  void success({required BuildContext context, required String message}) {
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.success(
        boxShadow: const [],
        backgroundColor: AppColors.lightGreen,
        message: message,
      ),
    );
  }

  @override
  void error({required BuildContext context, required String message}) {
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.error(
        boxShadow: const [],
        backgroundColor: AppColors.red,
        message: message,
      ),
    );
  }

  @override
  void info({required BuildContext context, required String message}) {
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.info(
        boxShadow: const [],
        backgroundColor: AppColors.orange,
        message: message,
      ),
    );
  }
}
