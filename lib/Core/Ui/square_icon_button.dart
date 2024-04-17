
import 'package:deaf_assistant_ai/Core/Utils/App%20Colors.dart';
import 'package:deaf_assistant_ai/Core/Utils/App%20Colors.dart';
import 'package:deaf_assistant_ai/Core/Utils/App%20Colors.dart';
import 'package:flutter/material.dart';

class SquareIconButton extends StatelessWidget {
  final IconData icon;
  final bool enableShadow;
  final Border? border;
  final VoidCallback? onTap;
  final double size;
  final Color backgroundColor;
  final Color iconColor;
  final double iconSizeFactor;

  const SquareIconButton({
    super.key,
    required this.icon,
    this.onTap,
    this.border,
    this.enableShadow = true,
    this.size = 45,
    this.backgroundColor = AppColors.white,
    this.iconColor = AppColors.red,
    this.iconSizeFactor = 0.5,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: const BorderRadius.all(Radius.circular(4)),
        border: border,
        boxShadow: [
          if (enableShadow)
            const BoxShadow(
              color: AppColors.grey,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(4)),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: SizedBox.square(
              dimension: size,
              child: Icon(
                icon,
                color: iconColor,
                size: size * iconSizeFactor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
