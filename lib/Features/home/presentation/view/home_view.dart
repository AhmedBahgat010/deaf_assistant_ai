import 'package:deaf_assistant_ai/Core/Network/Local/Shared_preferences.dart';
import 'package:deaf_assistant_ai/Core/Ui/input_fields/dropdown_input.dart';
import 'package:deaf_assistant_ai/Core/Ui/message_widget.dart';
import 'package:deaf_assistant_ai/Core/Utils/App%20Colors.dart';
import 'package:deaf_assistant_ai/Core/Utils/App%20Textstyle.dart';
import 'package:deaf_assistant_ai/Core/Utils/Assets%20Manager.dart';
import 'package:deaf_assistant_ai/Core/Utils/Core%20Components.dart';
import 'package:deaf_assistant_ai/Core/Utils/Responsive.dart';
import 'package:deaf_assistant_ai/Core/Utils/Shared%20Methods.dart';
import 'package:deaf_assistant_ai/Features/home/data/repositories/home_repository.dart';
import 'package:deaf_assistant_ai/Features/home/data/web_services/home_web_service.dart';
import 'package:deaf_assistant_ai/Features/home/presentation/manger/home_cubit.dart';
import 'package:deaf_assistant_ai/Features/home/presentation/widgets/custom_card_widget.dart';
import 'package:deaf_assistant_ai/Features/settings/presentation/view/settings_view.dart';
import 'package:deaf_assistant_ai/Features/sign_to_text_video/presentation/upload_video_view.dart';
import 'package:deaf_assistant_ai/Features/sign_to_text_video/presentation/video_recording_view.dart';
import 'package:deaf_assistant_ai/Features/speech_to_sign_language/presentation/speech_to_text_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class HomeView extends StatelessWidget {
   HomeView({super.key});
  final formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    String token = CacheHelper.getData("token");
    return BlocProvider(
      create: (context) => HomeCubit(HomeRepository(HomeWebService()))..getUserData(token),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          HomeCubit cubit = context.read<HomeCubit>();
          print(cubit.userModel?.userType);
          print(cubit.userModel?.name);
          print(cubit.userModel?.email);
          print(cubit.userModel?.uId);


          return Scaffold(
              body: state is GetUserDataLoadingState
                  ? const LoadingWidget(color: AppColors.primaryColor,)
                  :  state is GetUserDataErrorState
                  ?  MessageWidget(message: state.errorMsg)
                  : Column(children: [
            FormBuilder(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 330,
                    child: Stack(
                      children: [
                        Positioned(
                          top: 0,
                          child: Container(
                            width: MediaQueryHelper.sizeFromWidth(context, 1),
                            height: 280,
                            decoration: const BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.vertical(
                                bottom: Radius.circular(20),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 52,
                          right: 4,
                          child: Row(
                            children: [
                              SizedBox(
                                  height: MediaQueryHelper.sizeFromHeight(
                                      context, 12),
                                  child: InkWell(
                                      onTap: () {
                                        navigateTo(context, BlocProvider.value(
                                            value: cubit,
                                            child: const SettingsView()));
                                      },
                                      child: Image.asset(
                                          AssetsManager.notification))),
                            ],
                          ),
                        ),
                    Positioned(
                      top: 135,
                      left: 20,
                      right: 20,
                      child:  SizedBox(
                        height: 60,
                        width: MediaQueryHelper.sizeFromWidth(context, 1),
                        child: DropdownInput<String>(
                          name: 'Language',
                          label: 'Language',
                          leadingIcon: Icons.language_outlined,
                          initialValue: cubit.initialValue,
                          leadingIconColor: AppColors.primaryColor,
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                          ]),
                          items: ["English","Arabic"].map((type) {
                            return DropdownMenuItem(
                              value: type,
                              child: Text(
                                type,
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                        Positioned(
                            top: 47,
                            left: 4,
                            child: SizedBox(
                              width: 300,
                              child: ListTile(
                                title: Text(
                                  "Welcome Back !",
                                  style: AppTextStyles.w600.copyWith(
                                      fontSize: 12, color: AppColors.white),
                                ),
                                subtitle: Text(
                                  cubit.userModel!.name.toString(),
                                  style: AppTextStyles.w700.copyWith(
                                      fontSize: 16, color: AppColors.white),
                                ),
                                leading: CircleAvatar(
                                  radius: 21,
                                  backgroundColor: AppColors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.asset(
                                      AssetsManager.person,
                                    ),
                                  ),
                                ),
                              ),
                            )),
                        Positioned(
                          height: MediaQueryHelper.sizeFromHeight(context, 7.5),
                          bottom: 10,
                          left: 20,
                          right: 20,
                          child: Container(
                            decoration: const BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(20),
                                bottom: Radius.circular(20),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 20.0,
                                  // shadow
                                  spreadRadius: .5,
                                  // set effect of extending the shadow
                                  offset: Offset(
                                    0.0,
                                    -0.01,
                                  ),
                                )
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CircleAvatar(
                                      radius: 20,
                                      backgroundColor:
                                          Color(0xFFfacb27).withOpacity(0.3),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Image.asset(
                                          AssetsManager.deaf,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "Video To Speech",
                                      style: AppTextStyles.boldtitles
                                          .copyWith(fontSize: 12),
                                    ),
                                  ],
                                ),
                                InkWell(
                                  onTap: () {
                                    cubit.changeVideoToText();
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        cubit.isVideoToText == true
                                            ? Icons.arrow_forward_outlined
                                            : Icons.arrow_back,
                                        size: 24,
                                        color: Color(0xFFfacb27),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Icon(
                                        cubit.isVideoToText == false
                                            ? Icons.arrow_forward_outlined
                                            : Icons.arrow_back,
                                        size: 24,
                                        color: Color(0xFF583f7b),
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CircleAvatar(
                                      radius: 20,
                                      backgroundColor: const Color(0xFF583f7b)
                                          .withOpacity(0.3),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Image.asset(
                                          AssetsManager.person,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "Speech To Video",
                                      style: AppTextStyles.boldtitles
                                          .copyWith(fontSize: 12),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                children: [
                  if (cubit.isVideoToText == true) ...[
                    CustomWidget(
                      primaryColor: AppColors.primaryColor,
                      containerColor: const Color(0xff5c3c7c).withOpacity(0.3),
                      textColor: AppColors.black,
                      title: "Now Translate Sign Language\nUsing Your Camera",
                      subtitle: "Sign Language\nTo Text",
                      buttonText: "Try Now",
                      imgPath: AssetsManager.video,
                      onPressed: () {
                        navigateTo(context, BlocProvider.value(
                            value: cubit,
                            child: const VideoRecordingView()));
                      },
                    ),
                    CustomWidget(
                      primaryColor: AppColors.primaryColorYellow,
                      containerColor: const Color(0xFFfacb27).withOpacity(0.3),
                      textColor: AppColors.black,
                      title:
                          "Real-time Sign Language\nTranslation via Video Upload",
                      subtitle: "Transforming Communication",
                      buttonText: "Try Now",
                      imgPath: AssetsManager.video_2,
                      onPressed: () {
                        navigateTo(context, BlocProvider.value(
                            value: cubit,
                            child:  AddPicturePage(language: formKey.currentState!.fields["Language"]!
                                .value
                                .toString(),)));
                      },
                    ),
                  ] else
                    ...[
                      CustomWidget(
                        primaryColor: AppColors.primaryColor,
                        containerColor: const Color(0xff5c3c7c).withOpacity(0.3),
                        textColor: AppColors.black,
                        title: "Signs of Speech Translating\nWords into Actions",
                        subtitle: "Speech into Sign\nLanguage",
                        buttonText: "Try Now",
                        imgPath: AssetsManager.speech,
                        onPressed: () {
                          print(formKey.currentState!.fields["Language"]!
                              .value
                              .toString());
                          print("-----------------------------------------------------------");
                          if(formKey.currentState!.fields["Language"]!
                              .value
                              .toString() == "Arabic") {
                            navigateTo(context,
                                BlocProvider.value(
                                    value: cubit,
                                    child:const SpeechToTextView(isArabic: true,)));
                          }else {
                            navigateTo(context,
                                BlocProvider.value(
                                    value: cubit,
                                    child: const SpeechToTextView(isArabic: false,)));
                          }
                        },
                      ),
                    ]
                ],
              ),
            )
          ]));
        },
      ),
    );
  }
}
