import 'dart:io';
import 'package:deaf_assistant_ai/Core/Utils/Api%20Constances.dart';
import 'package:deaf_assistant_ai/Core/Utils/Shared%20Methods.dart';
import 'package:deaf_assistant_ai/Core/Utils/extra_cubit/extra_cubit.dart';
import 'package:deaf_assistant_ai/Core/Utils/top_snackbars.dart';
import 'package:deaf_assistant_ai/Features/home/presentation/manger/home_cubit.dart';
import 'package:deaf_assistant_ai/Features/sign_to_text_video/presentation/results_model_view.dart';
import 'package:deaf_assistant_ai/Features/sign_to_text_video/widgets/choose_image_bottom_sheet.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:deaf_assistant_ai/Core/Ui/primary_button.dart';
import 'package:deaf_assistant_ai/Core/Utils/App%20Colors.dart';
import 'package:deaf_assistant_ai/Core/Utils/App%20Textstyle.dart';
import 'package:deaf_assistant_ai/Features/sign_to_text_video/widgets/picture_source_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart'; // Import video_player package

class AddPicturePage extends StatefulWidget {
  final String language;
  const AddPicturePage({
    super.key, required this.language, // Add key parameter
  }); // Initialize key in super

  @override
  State<AddPicturePage> createState() => _AddPicturePageState();
}

class _AddPicturePageState extends State<AddPicturePage> {
  String? _pickedVideoPath;
  late VideoPlayerController _controller;

  void _pickVideo() async {
    final pickedVideoPath =
    await const ChooseImageBottomSheet().show(context);
    print(pickedVideoPath);
    if (pickedVideoPath == null) return;
    setState(() {
      _pickedVideoPath = pickedVideoPath;
      _controller = VideoPlayerController.file(File(_pickedVideoPath!));
      _controller.initialize().then((_) {
        setState(() {});
        _controller.play();
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('path_to_default_video.mp4');
    _controller.initialize().then((_) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is VideoToTextEnglishErrorState) {
          TopSnackbars().error(context: context, message: state.errorMsg);
        }
        if (state is VideoToTextEnglishLoadedState) {
          TopSnackbars().success(context: context,
              message: "Success! Your video has been uploaded and is now ready for viewing. ");
          navigateTo(context, BlocProvider.value(
            value: context.read<HomeCubit>(),
            child: VideoPlayerScreen(videoPath: _pickedVideoPath),
          ));
        }
      },
      builder: (context, state) {
        var cubit = context.read<HomeCubit>();
        print(widget.language);
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.primaryColor,
            shadowColor: Colors.grey.shade100,
            title: Text(
              "Upload Video",
              style: AppTextStyles.bold
                  .copyWith(fontWeight: FontWeight.w700,
                  fontSize: 18,
                  color: AppColors.white),
            ),
            elevation: 1,
            centerTitle: false,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_rounded,
                  size: 20, color: AppColors.white),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24),
                          child: Text(
                            'Do you want to upload a video of sign language?',
                            // Update text
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        const SizedBox(height: 40),
                        PictureSourceButton(
                          icon: Icons.camera,
                          label: 'Upload / Record Video',
                          onTap: _pickVideo, // Update onTap to _pickVideo
                        ),
                        const SizedBox(height: 30),
                        if (_pickedVideoPath != null)
                          AspectRatio(
                            aspectRatio: 1.5,
                            child: VideoPlayer(_controller,),
                          ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                PrimaryButton(
                  backgroundColor: AppColors.primaryColor,
                  foregroundColor: AppColors.white,
                  label: 'Upload',
                  isLoading: state is VideoToTextEnglishLoadingState,
                  onPressed: () async {
                    print(_pickedVideoPath);

                    FormData formData = FormData.fromMap({
                      'video': await MultipartFile.fromFile(_pickedVideoPath!),
                    });
                    if(widget.language == "English") {
                      cubit.videoToTextEnglish(requestBody: formData,
                          endPoint: EndPoints.videoToTextEnglish, url:  context.read<ExtrasCubit>().model!);
                    }else {
                      cubit.videoToTextEnglish(requestBody: formData,
                          endPoint: EndPoints.videoToTextArabic , url:  context.read<ExtrasCubit>().model!);
                    }
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
