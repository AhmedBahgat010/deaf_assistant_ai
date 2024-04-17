import 'dart:io';

import 'package:deaf_assistant_ai/Core/Utils/App%20Colors.dart';
import 'package:deaf_assistant_ai/Core/Utils/App%20Textstyle.dart';
import 'package:deaf_assistant_ai/Features/home/presentation/manger/home_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';

class VideoPage extends StatefulWidget {
  const VideoPage({super.key, required this.filePath});

  final String filePath;

  @override
  State<VideoPage> createState() => _VideoPageState();

}

class _VideoPageState extends State<VideoPage> {
  late VideoPlayerController _videoPlayerController;

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  Future _initVideoPlayer() async {
    _videoPlayerController = VideoPlayerController.file(File(widget.filePath));
    await _videoPlayerController.initialize();
    await _videoPlayerController.setLooping(true);
    await _videoPlayerController.play();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.filePath);
    print("adAD");

    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        HomeCubit cubit = context.read<HomeCubit>();
        return Scaffold(
          appBar: AppBar(
            title: Text('Preview', style: AppTextStyles.w800.copyWith(
                color: AppColors.black
            ),),
            elevation: 0,
            backgroundColor: Colors.black26,
            actions: [
              IconButton(
                icon: const Icon(Icons.check, color: AppColors.black
                ),
                onPressed: () {
                  // print(File(widget.filePath));
                  // Map<String, dynamic> requestBody = {
                  //   "video": widget.filePath,
                  // };
                  // cubit.videoToTextEnglish(requestBody: requestBody);
                },
              )
            ],
          ),
          extendBodyBehindAppBar: true,
          body: FutureBuilder(
            future: _initVideoPlayer(),
            builder: (context, state) {
              if (state.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return VideoPlayer(_videoPlayerController);
              }
            },
          ),
        );
      },
    );
  }
}