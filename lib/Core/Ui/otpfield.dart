
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '../Utils/App Colors.dart';

class OtpInputField extends StatelessWidget {
  final int length;
  final void Function(String)? onChanged;

  const OtpInputField({
    super.key,
    required this.length,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      decoration: BoxDecoration(
        color: AppColors.lightGrey,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: AppColors.mediumGrey.withOpacity(0.25),
        ),
      ),
      textStyle: const TextStyle(
        color: AppColors.black,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    );

    return Pinput(
      length: length,
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: defaultPinTheme.copyDecorationWith(
        border: Border.all(
          color: AppColors.primarySwatch,
        ),
      ),
      preFilledWidget: const Text(
        '*',
        style: TextStyle(
          color: AppColors.mediumGrey,
          fontSize: 20,
          fontWeight: FontWeight.w600,
          height: 3.2,
        ),
      ),
      onChanged: onChanged,
    );
  }
}
