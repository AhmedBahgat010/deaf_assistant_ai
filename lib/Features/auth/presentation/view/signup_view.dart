import 'package:deaf_assistant_ai/Core/Network/Local/Shared_preferences.dart';
import 'package:deaf_assistant_ai/Core/Utils/Responsive.dart';
import 'package:deaf_assistant_ai/Core/Utils/Shared%20Methods.dart';
import 'package:deaf_assistant_ai/Features/auth/presentation/manger/login_cubit.dart';
import 'package:deaf_assistant_ai/Features/auth/presentation/manger/login_state.dart';
import 'package:deaf_assistant_ai/Features/home/presentation/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:deaf_assistant_ai/Core/Utils/App%20Textstyle.dart';
import 'package:deaf_assistant_ai/Core/Utils/Assets%20Manager.dart';
import 'package:deaf_assistant_ai/Core/Utils/Core%20Components.dart';
import '../../../../Core/Utils/App Colors.dart';
import '../../../../Core/Utils/top_snackbars.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final formKey = GlobalKey<FormBuilderState>();


  @override
  Widget build(BuildContext context) {
    String userType = CacheHelper.getData("UserType");

    print(userType);
    AppBar appBar = AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: Container(),
    );
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final mediaQueryWidth = MediaQuery.of(context).size.width;
    final mediaQueryTop = MediaQuery.of(context).padding.top;
    final mediaQuery =
        (mediaQueryHeight - appBar.preferredSize.height - mediaQueryTop);
    return BlocProvider(
      create: (context) {
        return LoginCubit();
      },
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (BuildContext context, state) {
          if (state is RegistrationSuccessState) {
            TopSnackbars().success(
                context: context,
                message: "Sign up successful! Welcome to our community!");
            CacheHelper.saveData("token", state.uId)?.then((value){
              print(state.uId);
              navigateAndFinished(context,  HomeView());
            }).catchError((onError){

            });

          }
          if (state is CreateUserErrorState) {
            TopSnackbars()
                .error(context: context, message: state.error.toString());
          }
          if (state is RegistrationErrorState) {
            TopSnackbars()
                .error(context: context, message: state.error.toString());
          }
        },
        builder: (BuildContext context, state) {
          var cubit = context.read<LoginCubit>();
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
                                40 + MediaQuery.of(context).padding.top,
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
                                Text('Create Your Account',
                                    style: AppTextStyles.w800
                                        .copyWith(fontSize: 20)),
                                const SizedBox(height: 8),
                                Text('Start Your Journey with Us Today!',
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
                                  name: 'Username',
                                  label: 'Enter your Username',
                                  leadingIcon: Icons.person,
                                  boolleadingIcon: true,
                                  leadingIconColor: AppColors.greenYellow,
                                  enableFocusBorder: false,
                                  titel: "Username",
                                  validator: FormBuilderValidators.compose([
                                    FormBuilderValidators.required(),
                                  ]),
                                ),
                                const SizedBox(height: 15),
                                TextFieldTemplate(
                                  name: 'Email',
                                  label: 'Enter your Email',
                                  leadingIcon: Icons.email,
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
                                const SizedBox(height: 25),
                                ButtonTemplate(
                                  width: MediaQueryHelper.sizeFromWidth(
                                      context, 1),
                                  colorText: AppColors.white,
                                  color: AppColors.primaryColor,
                                  isLoading:
                                      state is RegistrationLoadingState ||
                                          state is CreateUserLoadingState,
                                  text1: 'Sign Up',
                                  onPressed: () {
                                    bool valid = formKey.currentState
                                            ?.saveAndValidate() ??
                                        false;
                                    if (valid) {
                                      final formData =
                                          cubit.getFormData2(formKey);
                                      cubit.registrationUser(
                                          email: formData?["Email"],
                                          name: formData?["Username"],
                                          password: formData?["Password"],
                                          userType: userType);
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
