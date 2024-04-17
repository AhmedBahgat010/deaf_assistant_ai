import 'package:deaf_assistant_ai/Core/Utils/App%20Colors.dart';
import 'package:deaf_assistant_ai/Core/Utils/App%20Textstyle.dart';
import 'package:deaf_assistant_ai/Core/Utils/Assets%20Manager.dart';
import 'package:flutter/material.dart';

class CustomWidget extends StatelessWidget {
  final Color primaryColor;
  final Color containerColor;
  final Color textColor;
  final String title , imgPath;
  final String subtitle;
  final String buttonText;
  final void Function() onPressed;

   const CustomWidget({super.key,
    required this.primaryColor,
    required this.containerColor,
    required this.textColor,
    required this.title,
    required this.subtitle,
    required this.buttonText,
    required this.onPressed,
     required this.imgPath,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          height: 215,
          width: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            border: Border.all(width: 2.1, color: primaryColor),
            color: containerColor.withOpacity(0.3),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Padding(
            padding: const EdgeInsets.all(13.0),
            child: Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        title,
                        maxLines: 2,
                        softWrap: true,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 12,
                          color: textColor,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        subtitle,
                        maxLines: 2,
                        softWrap: true,

                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                          color: primaryColor,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                        onPressed: onPressed,
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(primaryColor),
                          minimumSize: MaterialStateProperty.all<Size>(const Size(100, 40)),
                        ),
                        child: Text(buttonText , style: AppTextStyles.lrTitles.copyWith(
                          color: AppColors.white,
                          fontSize: 12
                        ),),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Image.asset(imgPath , fit: BoxFit.fill,),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
