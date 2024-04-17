import 'package:deaf_assistant_ai/Core/Utils/App%20Colors.dart';
import 'package:deaf_assistant_ai/Core/Utils/App%20Textstyle.dart';
import 'package:deaf_assistant_ai/Core/Utils/Responsive.dart';
import 'package:flutter/material.dart';

class ListTileprofile extends StatelessWidget {
  final String label;
  final String? gmail;
  final Widget inContainer;
  final Widget endWidget;
  final VoidCallback onTap;
  final bool isLoading;



  const ListTileprofile({
    super.key,
    required this.label,
    required this.inContainer,
    required this.onTap,
    this.isLoading = false,
    required this.endWidget,  this.gmail,
  });

  @override
  Widget build(BuildContext context) {
    return  InkWell(
        onTap: isLoading ? null : onTap
        ,child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20),
        width: MediaQueryHelper.sizeFromWidth(context, 1),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6.0,
              // shadow
              spreadRadius: .5,
              // set effect of extending the shadow
              offset: Offset(
                0.0,
                -0.01,
              ),
            )
          ],
        ),
        child: ListTile(
            title: Text(
              label,
              style: AppTextStyles.w600
                  .copyWith(fontSize: 18, overflow: TextOverflow.ellipsis),
            ),
            subtitle:gmail==null?const SizedBox(): IntrinsicWidth(
              child: Text(
                gmail!,
                style: AppTextStyles.w600.copyWith(
                    color: AppColors.darkGrey,
                    fontSize: 14,
                    overflow: TextOverflow.ellipsis),
              ),
            ),
            leading: Container(
                decoration: BoxDecoration(
                  color: AppColors.grey,
                  borderRadius: BorderRadius.circular(10),

                ),
                padding: EdgeInsets.all(10),
                child: inContainer)),
      ),
    );


  }
}
