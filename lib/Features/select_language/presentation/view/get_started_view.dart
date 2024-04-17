import 'package:animate_do/animate_do.dart';
import 'package:deaf_assistant_ai/Core/Network/Local/Shared_preferences.dart';
import 'package:deaf_assistant_ai/Core/Utils/App%20Colors.dart';
import 'package:deaf_assistant_ai/Core/Utils/App%20Textstyle.dart';
import 'package:deaf_assistant_ai/Core/Utils/Assets%20Manager.dart';
import 'package:deaf_assistant_ai/Core/Utils/Shared%20Methods.dart';
import 'package:deaf_assistant_ai/Features/select_language/presentation/view/select_language_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class GetStartedView extends StatefulWidget {
  const GetStartedView({super.key});

  @override
  _GetStartedViewState createState() => _GetStartedViewState();
}

class _GetStartedViewState extends State<GetStartedView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(height: 50),
            FadeInRight(
              duration: const Duration(milliseconds: 1500),
              child: Image.asset(
                AssetsManager.signLanguage,
                fit: BoxFit.cover,
              ),
            ),
            FadeInUp(
              duration: const Duration(milliseconds: 1000),
              delay: const Duration(milliseconds: 500),
              child: Container(
                  padding: const EdgeInsets.only(
                      left: 40, top: 40, right: 40, bottom: 20),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xffFFC3A6).withOpacity(0.5),
                        offset: const Offset(0, -5),
                        blurRadius: 20,
                      ),
                    ],
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FadeInUp(
                          duration: const Duration(milliseconds: 1000),
                          delay: const Duration(milliseconds: 1000),
                          from: 50,
                          child: const Text(
                            'Choose Your Preferred \nLanguage Of Communication ',
                            // textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        FadeInUp(
                          duration: const Duration(milliseconds: 1000),
                          delay: const Duration(milliseconds: 1000),
                          from: 60,
                          child: Text(
                            'Our platform offers seamless communication bridging sign language and spoken language.',
                            textAlign: TextAlign.start,
                            maxLines: 2,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade400,
                            ),
                          ),
                        ),
                        const SizedBox(height: 35),
                        FadeInUp(
                          duration: const Duration(milliseconds: 1000),
                          delay: const Duration(milliseconds: 1000),
                          from: 70,
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: TextButton(
                              style: const ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(
                                      AppColors.white)),
                              onPressed: () {
                                CacheHelper.saveData("GetStarted", true)
                                    ?.then((value) {
                                  navigateAndFinished(
                                      context, const SelectLanguageView());
                                }).catchError((error) {
                                  if (kDebugMode) {
                                    print(error);
                                  }
                                });
                              },
                              child: Text('   GET STARTED  ',
                                  style: AppTextStyles.w800
                                      .copyWith(fontSize: 14)),
                            ),
                          ),
                        )
                      ])),
            ),
          ],
        ),
      ),
    );
  }
}
