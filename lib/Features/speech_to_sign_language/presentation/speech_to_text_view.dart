import 'package:avatar_glow/avatar_glow.dart';
import 'package:deaf_assistant_ai/Core/Utils/Api%20Constances.dart';
import 'package:deaf_assistant_ai/Core/Utils/App%20Colors.dart';
import 'package:deaf_assistant_ai/Core/Utils/App%20Textstyle.dart';
import 'package:deaf_assistant_ai/Core/Utils/Core%20Components.dart';
import 'package:deaf_assistant_ai/Core/Utils/Shared%20Methods.dart';
import 'package:deaf_assistant_ai/Core/Utils/extra_cubit/extra_cubit.dart';
import 'package:deaf_assistant_ai/Core/Utils/top_snackbars.dart';
import 'package:deaf_assistant_ai/Features/home/presentation/manger/home_cubit.dart';
import 'package:deaf_assistant_ai/Features/speech_to_sign_language/presentation/speech_to_video_results_view.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:highlight_text/highlight_text.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class SpeechToTextView extends StatefulWidget {
  final bool isArabic;
  const SpeechToTextView({super.key, required this.isArabic});

  @override
  _SpeechToTextViewState createState() => _SpeechToTextViewState();
}

class _SpeechToTextViewState extends State<SpeechToTextView> {
  final Map<String, HighlightedWord> _highlights = {
    'flutter': HighlightedWord(
      onTap: () => print('flutter'),
      textStyle: const TextStyle(
        color: Colors.blue,
        fontWeight: FontWeight.bold,
      ),
    ),
    'voice': HighlightedWord(
      onTap: () => print('voice'),
      textStyle: const TextStyle(
        color: Colors.green,
        fontWeight: FontWeight.bold,
      ),
    ),
    'subscribe': HighlightedWord(
      onTap: () => print('subscribe'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'like': HighlightedWord(
      onTap: () => print('like'),
      textStyle: const TextStyle(
        color: Colors.blueAccent,
        fontWeight: FontWeight.bold,
      ),
    ),
    'comment': HighlightedWord(
      onTap: () => print('comment'),
      textStyle: const TextStyle(
        color: Colors.green,
        fontWeight: FontWeight.bold,
      ),
    ),
  };

  stt.SpeechToText? _speech;
  bool _isListening = false;
  String _text = '';
  double _confidence = 1.0;

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
  }

  bool _isLoading = false;

  void navigateWithDelay(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Center(
          child: Container(
            width: 400.0,
            height: 250.0,
            child: AlertDialog(
              title: Text(
                'Loading',
                style: AppTextStyles.w600.copyWith(
                  fontSize: 22,
                  color: AppColors.primaryColor,
                ),
              ),
              content: LoadingWidget(
                color: AppColors.primaryColor,
              ),
            ),
          ),
        );
      },
    );


    // Delay navigation
    Future.delayed(Duration(seconds: 5), () {
      // Hide loading dialog
      Navigator.of(context).pop();

      // Navigate to the specified context
      navigateTo(context, BlocProvider.value(
        value: context.read<HomeCubit>(),
        child: SpeechToVideoResultsView(base64String: context.read<HomeCubit>().textToVideoResponseModel!.data),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is TextToVideoErrorState) {
          TopSnackbars().error(context: context, message: state.errorMsg);
        }
        if (state is TextToVideoLoadedState) {
          TopSnackbars().success(context: context,
              message: "Success! Your video has been uploaded and is now ready for viewing. ");
          navigateWithDelay(context);
        }
      },
      builder: (context, state) {
        var cubit = context.read<HomeCubit>();

        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.primaryColor,
            leading: InkWell(
              onTap: () async {
               Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back_ios_rounded,
                size: 20,
                color: Colors.white,
              ),
            ),
            actions: [
              state is TextToVideoLoadingState ? const LoadingWidget(
                color: AppColors.white,
              ):InkWell(
                onTap: () async {
                  FormData formData = FormData.fromMap({
                    'text': _text,
                  });
                  if(widget.isArabic == false) {
                    cubit.textToVideoEnglish(requestBody: formData,
                        endPoint: EndPoints.textToVideoEnglish, url:  context.read<ExtrasCubit>().model! );
                  }else {
                    cubit.textToVideoEnglish(requestBody: formData,
                        endPoint: EndPoints.textToVideoArabic ,  url:  context.read<ExtrasCubit>().model!);
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10 , horizontal: 20),
                  child: const Icon(
                    Icons.near_me,
                    size: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
            title: const Text("Speech To Text",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
            centerTitle: false,
            elevation: 0,
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: Padding(
            padding: const EdgeInsets.all(25.0),
            child: AvatarGlow(
              animate: _isListening,
              glowColor: AppColors.primaryColor,
              duration: const Duration(milliseconds: 4000),
              repeat: true,
              child: FloatingActionButton(
                onPressed: _listen,
                backgroundColor: AppColors.primaryColor,
                child: Icon(
                  _isListening ? Icons.mic : Icons.mic_none,
                  color: AppColors.white,
                ),
              ),
            ),
          ),
          body: SingleChildScrollView(
            reverse: true,
            child: Container(
              padding: const EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 150.0),
              child: TextHighlight(
                text: _text,
                words: _highlights,
                textDirection: widget.isArabic ? TextDirection.rtl : TextDirection.ltr,
                softWrap: true,
                textStyle: const TextStyle(
                  fontSize: 24.0,
                  height: 1.5,
                  color: AppColors.primaryColor,
                  fontFamily: "Cairo",
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),

        );
      },
    );
  }

  void _listen() async {
    List<stt.LocaleName>? locales = await _speech?.locales();

    int? index =0;
    String lan ="en";
    if (widget.isArabic == true) {
     // index = 5;
      lan ="ar";
    } else {
      //index = 32;
      lan ="en";
    }

    if (!_isListening) {

      bool available = await _speech!.initialize(
        onStatus: (val) => print('onStatus: $val'),
        onError: (val) => print('onError: $val'),
      );
      if (available) {
        setState(() => _isListening = true);
        _speech?.listen(
          localeId: lan,
          onResult: (val) => setState(() {
            _text = val.recognizedWords;
            if (val.hasConfidenceRating && val.confidence > 0) {
              _confidence = val.confidence;
            }
          }),
        );
      }
    } else {
      setState(() => _isListening = false);
      _speech?.stop();
    }
  }
}


