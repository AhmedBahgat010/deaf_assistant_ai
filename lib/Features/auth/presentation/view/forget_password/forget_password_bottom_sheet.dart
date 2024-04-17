

import 'package:deaf_assistant_ai/Core/Utils/App%20Colors.dart';
import 'package:deaf_assistant_ai/Core/Utils/App%20Textstyle.dart';
import 'package:deaf_assistant_ai/Core/Utils/Assets%20Manager.dart';
import 'package:deaf_assistant_ai/Core/Utils/Core%20Components.dart';
import 'package:deaf_assistant_ai/Core/Utils/Responsive.dart';
import 'package:deaf_assistant_ai/Core/Utils/Shared%20Methods.dart';
import 'package:deaf_assistant_ai/Features/auth/presentation/manger/forget_password/cubit/forget_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'new_password_input_view.dart';
import 'otpScreen.dart';



class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({super.key});
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgetPasswordCubit(),
      child: BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
        listener: (context, state) {
          if (state.hasError == false && state.message.isNotEmpty) {
            // ServiceLocator.instance<Snackbars>().success(
            //   context: context,
            //   message: state.message,
            // );
          } else if (state.hasError == true && state.message.isNotEmpty) {
            // ServiceLocator.instance<Snackbars>().error(
            //   context: context,
            //   message: state.message,
            // );
          }

          if (state.passwordReset == true) {
            // ServiceLocator.instance<Snackbars>().success(
            //   context: context,
            //   message: state.message,
            // );
          }
        },
        builder: (context, state) {
          final cubit = context.read<ForgetPasswordCubit>();

          return state.otpSent == false
              ? Scaffold(
            body: SingleChildScrollView(
              child: SafeArea(
                child: FormBuilder(
                  key: cubit.formKey,
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
                          ),
                        ),
                      ),
                      Positioned(
                          top: MediaQueryHelper.sizeFromHeight(context, 15.5),
                          right: -35,
                          child: const Hero(
                            tag: "Circle1",
                            child: CircleAvatar(
                              backgroundColor: AppColors.primaryColor,
                              radius: 30,
                            ),
                          )),
                      Positioned(
                          top: MediaQueryHelper.sizeFromHeight(context, 5.5),
                          left: -40,
                          child: const Hero(
                            tag: "Circle2",
                            child: CircleAvatar(
                              backgroundColor: AppColors.primaryColor,
                              radius: 35,
                            ),
                          )),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(
                              24,
                              70 + MediaQuery.of(context).padding.top,
                              24,
                              15,
                            ),
                            child: Column(
                              children: [
                                Hero(
                                  tag: "logo",
                                  child: Image.asset(
                                    AssetsManager.logo,
                                    width: MediaQueryHelper.sizeFromWidth(
                                        context, 2),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Text(
                                  'Reset Password',
                                  style: AppTextStyles.w800.copyWith(fontSize: 22),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'Enter your email to reset your password',
                                  textAlign: TextAlign.center,
                                  style: AppTextStyles.w600.copyWith(
                                    color: AppColors.darkGrey,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(22),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 14),
                                TextFieldTemplate(
                                  name: 'Phone Number',
                                  label: 'Enter your phone number',
                                  leadingIcon: Icons.phone,
                                  boolleadingIcon: true,

                                  leadingIconColor: AppColors.primaryColor,
                                  enableFocusBorder: true,
                                  validator: FormBuilderValidators.compose([
                                    FormBuilderValidators.required(),
                                    FormBuilderValidators.email(),
                                  ]),
                                ),
                                const SizedBox(height: 32),
                                ButtonTemplate(
                                  width: MediaQueryHelper.sizeFromWidth(context, 1),
                                  colorText: AppColors.white,
                                  isLoading: state.isSendingOtp,
                                  color: AppColors.primaryColor,
                                  text1: 'Reset Password',
                                  onPressed: () {},
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
            ),
          )
              : state.otpSent == true && state.otpVerified == false
                  ? navigateTo(context, const OtpInputView())
                  : navigateTo(context, const NewPasswordInputView());
        },
      ),
    );
  }
}
