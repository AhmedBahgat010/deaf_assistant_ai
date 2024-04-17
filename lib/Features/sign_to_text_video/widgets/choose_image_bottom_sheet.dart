import 'package:deaf_assistant_ai/Core/Ui/primary_button.dart';
import 'package:deaf_assistant_ai/Core/Utils/App%20Colors.dart';
import 'package:deaf_assistant_ai/Core/Utils/sizes_helper.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart'; // Import image_picker package

class ChooseImageBottomSheet extends StatelessWidget {
  const ChooseImageBottomSheet({super.key, });

  Future<String?> show(BuildContext context) {
    return showModalBottomSheet<String>(
      context: context,
      isScrollControlled: true,
      builder: (context) => this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 32,
        horizontal: 24,
      ).add(
        EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: SizesHelper.defaultBorderRadius.topLeft,
          topRight: SizesHelper.defaultBorderRadius.topRight,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Where do you want to get the video from?',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.black,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 24),
          PrimaryButton(
            backgroundColor: AppColors.primaryColor,
            foregroundColor: AppColors.white,
            label: 'Camera',
            onPressed: () => _pickImage(
              context: context,
              source: ImageSource.camera,
            ),
          ),
          const SizedBox(height: 16),
          PrimaryButton(
            backgroundColor: AppColors.primaryColor,
            foregroundColor: AppColors.white,
            label: 'Gallery',
            onPressed: () => _pickImage(
              context: context,
              source: ImageSource.gallery,
            ),
          ),
        ],
      ),
    );
  }

  void _pickImage({
    required BuildContext context,
    required ImageSource source,
  }) async {
    final navigator = Navigator.of(context);

    final picker = ImagePicker();

    final pickedVideo = await picker.pickVideo(
      source: source,
    );

    if (pickedVideo == null) return;

    navigator.pop(pickedVideo.path);
  }
}
