import 'package:deaf_assistant_ai/Core/Network/Local/Shared_preferences.dart';
import 'package:deaf_assistant_ai/Core/Utils/App%20Colors.dart';
import 'package:deaf_assistant_ai/Core/Utils/App%20Textstyle.dart';
import 'package:deaf_assistant_ai/Core/Utils/Assets%20Manager.dart';
import 'package:deaf_assistant_ai/Core/Utils/Core%20Components.dart';
import 'package:deaf_assistant_ai/Core/Utils/Responsive.dart';
import 'package:deaf_assistant_ai/Core/Utils/Shared%20Methods.dart';
import 'package:deaf_assistant_ai/Core/Utils/top_snackbars.dart';
import 'package:deaf_assistant_ai/Features/auth/presentation/manger/login_cubit.dart';
import 'package:deaf_assistant_ai/Features/auth/presentation/manger/login_state.dart';
import 'package:deaf_assistant_ai/Features/auth/presentation/view/signup_view.dart';
import 'package:deaf_assistant_ai/Features/auth/presentation/view/widget/checkbox_input.dart';
import 'package:deaf_assistant_ai/Features/home/presentation/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static const routeName = '/login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? _dropDownVal;
  final formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return LoginCubit();
      },
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            TopSnackbars().success(context: context, message:  "Login successful! Welcome!");
            CacheHelper.saveData("token", state.uId)?.then((value){
              print(state.uId);
              navigateAndFinished(context,  HomeView());
            }).catchError((onError){

            });

          }
          if (state is LoginErrorState) {
            TopSnackbars()
                .error(context: context, message: state.error.toString());
          }
        },
        builder: (context, state) {
          final loginCubit = context.read<LoginCubit>();

          return Scaffold(
            body: SingleChildScrollView(
              child: SafeArea(
                child: Stack(
                  children: [
                    Positioned(
                        top: MediaQueryHelper.sizeFromHeight(context, 15.5),
                        right: -40,
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
                    FormBuilder(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(
                                24,
                                50 + MediaQuery.of(context).padding.top,
                                24,
                                15),
                            child: Column(
                              children: [
                                Hero(
                                  tag: "logo",
                                  child: Image.asset(
                                    AssetsManager.logo,
                                    width: MediaQueryHelper.sizeFromWidth(
                                        context, 2.15),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text('Log in to your account',
                                    style: AppTextStyles.w800
                                        .copyWith(fontSize: 20)),
                                const SizedBox(height: 8),
                                Text('Welcome back! Enter your information',
                                    style: AppTextStyles.w600.copyWith(
                                        color: AppColors.darkGrey,
                                        fontSize: 14)),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 10),
                                TextFieldTemplate(
                                  name: 'Email',
                                  label: 'Enter your Email',
                                  leadingIcon: Icons.email_outlined,
                                  boolleadingIcon: true,
                                  leadingIconColor: AppColors.greenYellow,
                                  enableFocusBorder: false,
                                  titel: "Email",
                                  validator: FormBuilderValidators.compose([
                                    FormBuilderValidators.required(),
                                  ]),
                                ),
                                const SizedBox(height: 15),
                                TextFieldTemplate(
                                  titel: "Password",
                                  name: 'Password',
                                  label: 'Password',
                                  // leadingIcon: Iconsax.lock_1,
                                  inputType: TextInputType.visiblePassword,
                                  leadingIconColor: AppColors.greenYellow,
                                  enableFocusBorder: false,
                                  validator: FormBuilderValidators.compose([
                                    FormBuilderValidators.required(),
                                  ]),
                                ),
                                const SizedBox(height: 16),
                                Row(
                                  children: [
                                    const Expanded(
                                      flex: 2,
                                      child: CheckboxInput(
                                        name: 'rememberMe',
                                        label: 'Remember me \n for 30 days',
                                        initialValue: true,
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        navigateTo(context, const SignUp());
                                      },
                                      style: TextButton.styleFrom(
                                        foregroundColor: AppColors.black,
                                      ),
                                      child: Text(
                                          "Ready to sign up?\nLet's begin!",
                                          style: AppTextStyles.lrTitles
                                              .copyWith(
                                                  fontSize: 13,
                                                  color:
                                                      AppColors.primaryColor)),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 25),
                                ButtonTemplate(
                                  width: MediaQueryHelper.sizeFromWidth(
                                      context, 1),
                                  colorText: AppColors.white,
                                  color: AppColors.primaryColor,
                                  text1: 'Login',
                                  isLoading: state is LoginLoadingState,
                                  onPressed: () {
                                    bool valid = formKey.currentState
                                            ?.saveAndValidate() ??
                                        false;
                                    if (valid) {
                                      loginCubit.loginUser(
                                          formKey.currentState!.fields["Email"]!
                                              .value
                                              .toString(),
                                          formKey.currentState!
                                              .fields["Password"]!.value
                                              .toString());
                                    }
                                  },
                                ),
                                const SizedBox(height: 20),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
