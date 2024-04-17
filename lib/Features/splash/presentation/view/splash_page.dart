import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:deaf_assistant_ai/Core/Ui/message_widget.dart';
import 'package:deaf_assistant_ai/Core/Utils/App%20Colors.dart';
import 'package:deaf_assistant_ai/Core/Utils/Assets%20Manager.dart';
import 'package:deaf_assistant_ai/Core/Utils/Core%20Components.dart';
import 'package:deaf_assistant_ai/Core/Utils/extra_cubit/extra_cubit.dart';
import 'package:deaf_assistant_ai/Core/Utils/extra_cubit/extra_cubit.dart';
import 'package:deaf_assistant_ai/Core/Utils/extra_cubit/extra_state.dart';
import 'package:deaf_assistant_ai/Features/select_language/presentation/view/get_started_view.dart';
import 'package:deaf_assistant_ai/Features/select_language/presentation/view/select_language_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPage extends StatelessWidget {
  final Widget? widgetScreen;

  const SplashPage({super.key, required this.widgetScreen});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ExtrasCubit, ExtrasState>(
      listener: (context, state) {},
      builder: (context, state) {
        return AnimatedSplashScreen(
          duration: 4000,
          splashIconSize: 190,
          backgroundColor: AppColors.white,
          splash: Center(
            child: Image.asset(
              AssetsManager.logo,
              scale: 1,
            ),
          ),
          nextScreen:widgetScreen!,
          splashTransition: SplashTransition.slideTransition,
          animationDuration: const Duration(seconds: 3),
        );
      },
    );
  }
}
