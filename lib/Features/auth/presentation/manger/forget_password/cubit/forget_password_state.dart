part of 'forget_password_cubit.dart';

class ForgetPasswordState {
  final bool isSendingOtp;
  final bool otpSent;
  final bool hasError;
  final String message;
  final String timerText;
  final bool allowResendOtp;
  final bool otpCodeEntered;
  final bool isVerifyingOtp;
  final bool otpVerified;
  final bool isResettingPassword;
  final bool passwordReset;

  ForgetPasswordState({
    required this.isSendingOtp,
    required this.otpSent,
    required this.hasError,
    required this.message,
    required this.timerText,
    required this.allowResendOtp,
    required this.otpCodeEntered,
    required this.isVerifyingOtp,
    required this.otpVerified,
    required this.isResettingPassword,
    required this.passwordReset,
  });

  ForgetPasswordState.initial()
      : this(
    isSendingOtp: false,
    otpSent: false,
    hasError: false,
    message: '',
    timerText: '01:00',
    allowResendOtp: false,
    otpCodeEntered: false,
    isVerifyingOtp: false,
    otpVerified: false,
    isResettingPassword: false,
    passwordReset: false,
  );

  ForgetPasswordState copyWith({
    bool? isSendingOtp,
    bool? otpSent,
    bool? hasError,
    String? message,
    String? timerText,
    bool? allowResendOtp,
    bool? otpCodeEntered,
    bool? isVerifyingOtp,
    bool? otpVerified,
    bool? isResettingPassword,
    bool? passwordReset,
  }) {
    return ForgetPasswordState(
      isSendingOtp: isSendingOtp ?? this.isSendingOtp,
      otpSent: otpSent ?? this.otpSent,
      hasError: hasError ?? this.hasError,
      message: message ?? this.message,
      timerText: timerText ?? this.timerText,
      allowResendOtp: allowResendOtp ?? this.allowResendOtp,
      otpCodeEntered: otpCodeEntered ?? this.otpCodeEntered,
      isVerifyingOtp: isVerifyingOtp ?? this.isVerifyingOtp,
      otpVerified: otpVerified ?? this.otpVerified,
      isResettingPassword: isResettingPassword ?? this.isResettingPassword,
      passwordReset: passwordReset ?? this.passwordReset,
    );
  }
}
