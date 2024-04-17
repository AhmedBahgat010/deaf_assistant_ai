import 'dart:convert';
import 'dart:io';
import 'package:deaf_assistant_ai/Core/Utils/Core%20Components.dart';
import 'package:path_provider/path_provider.dart';

import 'package:deaf_assistant_ai/Core/Utils/App%20Colors.dart';
import 'package:deaf_assistant_ai/Core/Utils/App%20Textstyle.dart';
import 'package:deaf_assistant_ai/Features/home/presentation/manger/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';

class SpeechToVideoResultsView extends StatefulWidget {
  final String base64String;
  const SpeechToVideoResultsView({super.key, required this.base64String});

  @override
  State<SpeechToVideoResultsView> createState() => _SpeechToVideoResultsViewState();
}

class _SpeechToVideoResultsViewState extends State<SpeechToVideoResultsView> {
  VideoPlayerController? _controller;
  late bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _initVideo();
  }
  Future<void> _initVideo() async {
    // Decode base64 string into bytes
    List<int> videoBytes = base64Decode(widget.base64String);

    // Get temporary directory
    Directory tempDir = await getTemporaryDirectory();
    // Create a temporary file
    File _videoFile = File('${tempDir.path}/video.mp4');
    // Write video bytes to the temporary file
    await _videoFile.writeAsBytes(videoBytes);

    _controller = VideoPlayerController.file(_videoFile)
      ..initialize().then((_) {
        setState(() {});
        _controller?.play();
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller?.dispose();
  }

  void _togglePlay() {
    setState(() {
      if (_controller!.value.isPlaying) {
        _controller?.pause();
        _isPlaying = false;
      } else {
        _controller?.play();
        _isPlaying = true;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = context.read<HomeCubit>();
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.primaryColor,
            shadowColor: Colors.grey.shade100,
            title: Text(
              "Speech To Video Results",
              style: AppTextStyles.bold.copyWith(
                  fontWeight: FontWeight.w700,
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
          body: _controller == null? Center(
            child: LoadingWidget(
              color: AppColors.primaryColor,
            ),
          ) :Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
               AspectRatio(
                  aspectRatio: 1.5,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: VideoPlayer(_controller!),
                      ),
                      _ControlsOverlay(
                        controller: _controller!,
                        isPlaying: _isPlaying,
                        togglePlay: _togglePlay,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.replay_10),
                      onPressed: () {
                        _controller?.seekTo(Duration(
                            seconds:
                            _controller!.value.position.inSeconds - 10));
                      },
                    ),
                    IconButton(
                      icon: Icon(_isPlaying ? Icons.pause : Icons.play_arrow),
                      onPressed: _togglePlay,
                    ),
                    IconButton(
                      icon: const Icon(Icons.forward_10),
                      onPressed: () {
                        _controller?.seekTo(Duration(
                            seconds:
                            _controller!.value.position.inSeconds + 10));
                      },
                    ),
                  ],
                ),
                // Video Progress Bar
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: VideoProgressIndicator(
                    _controller!,
                    allowScrubbing: true,
                    colors: const VideoProgressColors(
                        playedColor: AppColors.primaryColor),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _ControlsOverlay extends StatelessWidget {
  final VideoPlayerController controller;
  final bool isPlaying;
  final VoidCallback togglePlay;

  const _ControlsOverlay({
    required this.controller,
    required this.isPlaying,
    required this.togglePlay,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          reverseDuration: const Duration(milliseconds: 200),
          child: isPlaying
              ? Container(
            color: Colors.transparent,
            height: double.infinity,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                // Show current time
                Text(
                  _formatDuration(controller.value.position),
                  style: TextStyle(color: Colors.white),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.pause,
                    color: Colors.white,
                    size: 22,
                  ),
                  onPressed: togglePlay,
                ),
              ],
            ),
          )
              : GestureDetector(
            onTap: togglePlay,
            child: Container(
              color: Colors.black26,
              height: double.infinity,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  // Show current time
                  Text(
                    _formatDuration(controller.value.position),
                    style: TextStyle(color: Colors.white),
                  ),
                  const Icon(
                    Icons.play_arrow,
                    size: 50.0,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }
}
