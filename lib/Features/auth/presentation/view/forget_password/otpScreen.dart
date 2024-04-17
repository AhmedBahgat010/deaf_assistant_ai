import 'package:deaf_assistant_ai/Core/Utils/App%20Colors.dart';
import 'package:deaf_assistant_ai/Core/Utils/App%20Textstyle.dart';
import 'package:deaf_assistant_ai/Core/Utils/Assets%20Manager.dart';
import 'package:deaf_assistant_ai/Core/Utils/Core%20Components.dart';
import 'package:deaf_assistant_ai/Core/Utils/Responsive.dart';
import 'package:deaf_assistant_ai/Features/auth/presentation/manger/forget_password/cubit/forget_password_cubit.dart';
import 'package:deaf_assistant_ai/Features/auth/presentation/view/widget/otpfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OtpInputView extends StatelessWidget {
  const OtpInputView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForgetPasswordCubit, ForgetPasswordState>(
      builder: (context, state) {
        final cubit = context.read<ForgetPasswordCubit>();
        return Scaffold(
          body: SingleChildScrollView(
            child: SafeArea(
              child: Stack(
                children: [
                  Positioned(
                    right: 10,
                    top: 10,
                    child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.arrow_back_ios_new_outlined,
                          color: AppColors.primaryColor,
                        )),
                  ),
                  Positioned(
                      top: MediaQueryHelper.sizeFromHeight(context, 13.5),
                      right: -35,
                      child: Hero(
                        tag: "Circle1",
                        child: CircleAvatar(
                          backgroundColor: AppColors.primaryColor,
                          radius: 30,
                        ),
                      )),
                  Positioned(
                      top: MediaQueryHelper.sizeFromHeight(context, 3.5),
                      left: -40,
                      child: Hero(
                        tag: "Circle2",
                        child: const CircleAvatar(
                          backgroundColor: AppColors.primaryColor,
                          radius: 35,
                        ),
                      )),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(24,
                            70 + MediaQuery.of(context).padding.top, 24, 15),
                        child: Column(
                          children: [
                            Hero(
                              tag: "logo",
                              child: Image.asset(
                                AssetsManager.logoPrimerColor,
                                width: 120,
                              ),
                            ),
                            SizedBox(height: 20),
                            Text('أدخل الكود المرسل إليك',
                                style: AppTextStyles.bold
                                    .copyWith(fontSize: 24)),
                            SizedBox(height: 8),
                            Text('قم بادخال بريك الالكتروني لتسعيد كلمة مرورك',
                                textAlign: TextAlign.center,
                                style: AppTextStyles.w600.copyWith(
                                    color: AppColors.darkGrey, fontSize: 16)),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(22),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 24),
                            const Align(
                              alignment: Alignment.center,
                              child: Directionality(
                                textDirection: TextDirection.ltr,
                                child: OtpInputField(
                                  length: 5,
                                ),
                              ),
                            ),
                            const SizedBox(height: 32),
                            Row(children: [
                              const Text(
                                'لم يصلك الكود بعد؟',
                                style: TextStyle(
                                  color: AppColors.black,
                                  fontSize: 13,
                                ),
                              ),
                              TextButton(
                                onPressed: state.allowResendOtp
                                    ? () {}: null,
                                style: TextButton.styleFrom(
                                  visualDensity: VisualDensity.compact,
                                  foregroundColor: AppColors.primaryColor,
                                ),
                                child: const Text(
                                  'إعادة إرسال',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 17,
                                  ),
                                ),
                              ),
                            ]),
                            const SizedBox(height: 20),
                            ButtonTemplate(
                              width: MediaQueryHelper.sizeFromWidth(context, 1),
                              colorText: AppColors.white,
                              isLoading: state.isVerifyingOtp,
                              color: AppColors.primaryColor,
                              text1: 'تأكيد',
                              onPressed: (){},
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
    //   Scaffold(
    //   body: SafeArea(
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         const Text(
    //           'أدخل الكود المرسل إليك',
    //           style: TextStyle(
    //             color: AppColors.black,
    //             fontSize: 16,
    //             fontWeight: FontWeight.w600,
    //           ),
    //         ),
    //         const SizedBox(height: 40),
    //         Align(
    //           alignment: Alignment.center,
    //           child: Directionality(
    //             textDirection: TextDirection.ltr,
    //             child: OtpInputField(
    //               length: 55,
    //               onChanged: (String) {},
    //             ),
    //           ),
    //         ),
    //         const SizedBox(height: 24),
    //         Text(
    //           // 'لقد تم إرسال كود للاستخدام لمرة الواحدة على البريد الالكتروني:\n${cubit.email}',
    //           'لقد تم إرسال كود للاستخدام لمرة الواحدة على البريد الالكتروني:\n}',
    //           style: const TextStyle(
    //             color: AppColors.black,
    //             fontSize: 12,
    //           ),
    //         ),
    //         const SizedBox(height: 24),
    //         Row(
    //           children: [
    //             const Text(
    //               'لم يصلك الكود بعد؟',
    //               style: TextStyle(
    //                 color: AppColors.black,
    //                 fontSize: 12,
    //               ),
    //             ),
    //             TextButton(
    //               onPressed: () {},
    //               // nPressed: state.allowResendOtp
    //               //     ? () => cubit.sendOtp(resend: true)
    //               //     : null,   o
    //               style: TextButton.styleFrom(
    //                 visualDensity: VisualDensity.compact,
    //                 foregroundColor: AppColors.red,
    //               ),
    //               child: const Text(
    //                 'إعادة إرسال',
    //                 style: TextStyle(
    //                   fontWeight: FontWeight.w600,
    //                   fontSize: 12,
    //                 ),
    //               ),
    //             ),
    //             const Spacer(),
    //             Text(
    //               // state.timerText,
    //               "dddddd",
    //               style: const TextStyle(
    //                 color: AppColors.black,
    //                 fontWeight: FontWeight.w600,
    //                 fontSize: 12,
    //               ),
    //             )
    //           ],
    //         ),
    //         const SizedBox(height: 48),
    //         ButtonTemplate(
    //           // isLoading: state.isVerifyingOtp,
    //           onPressed: (){},
    //           text1: 'تأكيد',
    //           // onPressed: state.otpCodeEntered ? cubit.verifyOtp : null,
    //           color: AppColors.primaryColor,
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
