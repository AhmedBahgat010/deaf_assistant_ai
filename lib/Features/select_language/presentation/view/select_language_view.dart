import 'package:animate_do/animate_do.dart';
import 'package:deaf_assistant_ai/Core/Network/Local/Shared_preferences.dart';
import 'package:deaf_assistant_ai/Core/Utils/App%20Colors.dart';
import 'package:deaf_assistant_ai/Core/Utils/App%20Textstyle.dart';
import 'package:deaf_assistant_ai/Core/Utils/Assets%20Manager.dart';
import 'package:deaf_assistant_ai/Core/Utils/Shared%20Methods.dart';
import 'package:deaf_assistant_ai/Features/Ui/primary_button.dart';
import 'package:deaf_assistant_ai/Features/auth/presentation/view/login_screen.dart';
import 'package:deaf_assistant_ai/Features/select_language/presentation/manger/select_language_cubit.dart';
import 'package:deaf_assistant_ai/Features/select_language/presentation/view/select_user_type.dart';
import 'package:deaf_assistant_ai/Features/select_language/presentation/widgets/custom_language_selector.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectLanguageView extends StatelessWidget {
  const SelectLanguageView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SelectLanguageCubit(),
      child: BlocConsumer<SelectLanguageCubit, SelectLanguageState>(
        listener: (context, state) {},
        builder: (context, state) {
          SelectLanguageCubit cubit = context.read<SelectLanguageCubit>();
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor:cubit.selectedIndex != null
                  ? AppColors.primaryColor
                  : AppColors.grey,
              leading: InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child:  Icon(
                  Icons.arrow_back_ios_rounded,
                  size: 20,
                  color:  cubit.selectedIndex != null
                      ? Colors.white
                      : Colors.black,
                ),
              ),
              title:  Text("Choose The Language",
                  style: TextStyle(
                      fontSize: 18,
                      color: cubit.selectedIndex != null
                          ? Colors.white
                          : Colors.black,
                      fontWeight: FontWeight.bold)),
              centerTitle: false,
              elevation: 0,
            ),
            body: Column(
              children: [
                Expanded(
                    flex: 5,
                    child: FadeInUp(
                      duration: const Duration(milliseconds: 1000),
                      delay: const Duration(milliseconds: 400),
                      from: 50,
                      child: Image.asset(
                        AssetsManager.speechToText,
                        fit: BoxFit.contain,
                      ),
                    )),
                Expanded(
                    flex: 6,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FadeInLeft(
                          duration: const Duration(milliseconds: 1000),
                          delay: const Duration(milliseconds: 400),
                          from: 50,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 35),
                            child: Text(
                              "Choose the language\nFamiliar to you",
                              style: AppTextStyles.w700.copyWith(
                                  fontSize: 20, color: Colors.grey.shade800),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        FadeInLeft(
                          duration: const Duration(milliseconds: 1000),
                          delay: const Duration(milliseconds: 400),
                          from: 50,
                          child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 35),
                              child: SizedBox(
                                child: ListView.builder(
                                    padding: EdgeInsets.zero,
                                    itemCount: cubit.languages.length,
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10),
                                        child: CustomLanguageSelector(
                                          height: 53,
                                          width: double.infinity,
                                          textColor:
                                              cubit.selectedIndex == index
                                                  ? AppColors.primaryColor
                                                  : Colors.grey.shade400,
                                          imageAsset:
                                              cubit.languages[index].imgAsset,
                                          languageText:
                                              cubit.languages[index].title,
                                          borderColor:
                                              cubit.selectedIndex == index
                                                  ? AppColors.primaryColor
                                                  : Colors.grey.shade400,
                                          iconColor:
                                              cubit.selectedIndex == index
                                                  ? AppColors.primaryColor
                                                  : AppColors.darkGrey,
                                          onTap: () {
                                            cubit.changeSelectedIndex(index);
                                          },
                                        ),
                                      );
                                    }),
                              )),
                        ),
                        const Spacer(),
                        FadeInLeft(
                          duration: const Duration(milliseconds: 1000),
                          delay: const Duration(milliseconds: 400),
                          from: 50,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 14),
                            child: PrimaryButton(
                              label: cubit.selectedIndex != null
                                  ? "Hello! Let's get started"
                                  : "Please Select a Language",
                              foregroundColor: AppColors.white,
                              backgroundColor: cubit.selectedIndex != null
                                  ? AppColors.primaryColor
                                  : AppColors.grey,
                              onPressed: cubit.selectedIndex != null ? () {
                                CacheHelper.saveData("UserLang",cubit.languages[cubit.selectedIndex!].title )
                                    ?.then((value) {
                                  navigateTo(context, const SelectUserType());
                                }).catchError((error) {
                                  if (kDebugMode) {
                                    print(error);
                                  }
                                });
                              } : null,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        )
                      ],
                    ))
              ],
            ),
          );
        },
      ),
    );
  }
}
