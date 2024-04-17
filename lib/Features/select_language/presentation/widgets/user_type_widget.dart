import 'package:deaf_assistant_ai/Core/Utils/App%20Colors.dart';
import 'package:flutter/material.dart';

import '../../../../Core/Ui/circular_profile_picture.dart';

class UserTypeWidget extends StatelessWidget {
  final int index;
  final int? indexVal;
  final void Function() onTap;
  final String name;
  final String? photo;


  const UserTypeWidget({super.key,
    required this.index,
    required this.onTap,
    required this.name,
    required this.photo,
    this.indexVal,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: InkWell(
        onTap: onTap,
        child: PhysicalModel(
          color: Colors.white,
          elevation: 6,
          borderRadius: BorderRadius.circular(10),
          shadowColor: Colors.grey,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: indexVal == null
                    ? Colors.white
                    : indexVal == index ? AppColors.primaryColor : Colors.white,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox.square(
                  dimension: 56,
                  child: Builder(
                    builder: (context) {
                      return CircularProfilePicture(
                        image: photo,
                        size: 100,
                      );
                    },
                  ),
                ),
                SizedBox(height: screenHeight * 0.016),
                Text(
                  name,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
