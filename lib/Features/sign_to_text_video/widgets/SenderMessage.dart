import 'package:deaf_assistant_ai/Core/Utils/App%20Colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SenderMessage extends StatelessWidget {
  final String message;
  final String userName;

  const SenderMessage({
    super.key,
    required this.message,
    required this.userName,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Text(
          userName,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(15),
          ),
          constraints: const BoxConstraints(
            maxWidth: 270
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                message,
                style: const TextStyle(
                  color: AppColors.white
                ),
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 4.0),
              Text(
                DateFormat('hh:mm a').format(DateTime.now()),
                style: const TextStyle(
                  fontSize: 12.0,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
