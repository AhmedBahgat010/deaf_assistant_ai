import 'package:flutter/material.dart';
import '../../../Core/Utils/App Colors.dart';


class TableTotal extends StatelessWidget {
  final String subtitle;
  String? title;
  final double total;
  IconData? icon;

  TableTotal({
  super.key,
  required this.subtitle,
  required this.total,
  this.title =  'الاجمالي',
  this.icon = Icons.add
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: AppColors.orange,
            borderRadius: BorderRadius.circular(4),
          ),
          child:  Icon(
            icon ,
            color: AppColors.black,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title.toString(),
                style: const TextStyle(
                  color: AppColors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: const TextStyle(
                  color: AppColors.darkGrey,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 16),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: total.round().toString(),
                style: const TextStyle(
                  color: AppColors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const TextSpan(
                text: ' د.ك',
                style: TextStyle(
                  color: AppColors.darkGrey,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
