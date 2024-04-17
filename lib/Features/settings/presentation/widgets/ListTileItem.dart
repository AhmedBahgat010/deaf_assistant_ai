import 'package:deaf_assistant_ai/Core/Utils/App%20Colors.dart';
import 'package:deaf_assistant_ai/Core/Utils/App%20Textstyle.dart';
import 'package:deaf_assistant_ai/Core/Utils/Responsive.dart';
import 'package:flutter/material.dart';

class ListTileItem extends StatelessWidget {
  final String label;
  final String? gmail;
  final Widget inContainer;
  final Widget endWidget;
  final VoidCallback onTap;
  final bool isLoading;

  const ListTileItem({
    super.key,
    required this.label,
    required this.inContainer,
    required this.onTap,
    this.isLoading = false,
    required this.endWidget,
    this.gmail,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isLoading ? null : onTap,
      child: Container(
        width: MediaQueryHelper.sizeFromWidth(context, 1),
        color: AppColors.white,
        child: ListTile(
            title: Text(
              label,
              style: AppTextStyles.w600
                  .copyWith(fontSize: 18, overflow: TextOverflow.ellipsis),
            ),
            trailing: endWidget,
            leading: Container(
                decoration: BoxDecoration(
                  color: AppColors.grey,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.all(10),
                child: inContainer)),
      ),
    );

    //   Material(
    //
    //   color: Colors.red,
    //   child: InkWell(
    //     borderRadius: BorderRadius.circular(8),
    //     onTap: isLoading ? null : onTap,
    //     child: Padding(
    //       padding: const EdgeInsets.symmetric(
    //         horizontal: 12,
    //         vertical: 8,
    //       ),
    //       child: Row(
    //         children: [
    //           CircleAvatar(
    //             radius: 22.5,
    //             backgroundColor: AppColors.white.withOpacity(0.35),
    //             child: Icon(
    //               icon,
    //               color: AppColors.white,
    //               size: 20,
    //             ),
    //           ),
    //           const SizedBox(width: 16),
    //           Expanded(
    //             child: isLoading
    //                 ? const LoadingWidget(
    //                     type: LoadingType.threeBounce,
    //                     color: Colors.red,
    //                     size: 20,
    //                   )
    //                 : Text(
    //                     label,
    //                 style:AppTextStyles.lrTitles
    //                   ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}
