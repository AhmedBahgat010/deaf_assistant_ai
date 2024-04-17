import 'package:flutter/material.dart';

class CustomLanguageSelector extends StatelessWidget {
  final double height;
  final double width;
  final String imageAsset;
  final String languageText;
  final Color borderColor;
  final Color iconColor;
  final Color textColor;

  final VoidCallback onTap;

  const CustomLanguageSelector({
    super.key,
    this.height = 55,
    this.width = double.infinity,
    required this.imageAsset,
    required this.languageText,
    this.borderColor = Colors.grey,
    this.iconColor = Colors.grey,
    required this.onTap,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: borderColor, width: 1.5),
      ),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            const SizedBox(width: 10),
            SizedBox(
              height: 25,
              width: 38,
              child: Image.asset(
                imageAsset,
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(width: 15),
            Text(
              languageText,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                fontFamily: "Cairo",
                color: textColor
              ),
            ),
            const Spacer(),
            Icon(
              Icons.navigate_next_sharp,
              color: iconColor,
            ),
            const SizedBox(width: 5),
          ],
        ),
      ),
    );
  }
}

