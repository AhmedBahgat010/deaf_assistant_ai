import 'package:deaf_assistant_ai/Core/Ui/dropdown_input.dart';
import 'package:deaf_assistant_ai/Core/Ui/menu_item.dart';
import 'package:deaf_assistant_ai/Core/Utils/App%20Colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';


class SortButton extends StatelessWidget {
  final void Function(String)? onChanged;

  const SortButton({
    super.key,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: 45,
      child: Container(
        child: DropdownInput<String>(
          menuWidth: 150,
          hideSelectedFromTheMenu: false,
          disableShadow: false,
          name: 'sort',
          initialValue: 'newest',
          items: const [
            DropdownMenuItem(
              value: 'newest',
              child: MenuItem(label: 'الاحدث'),
            ),
            DropdownMenuItem(
              value: 'oldest',
              child: MenuItem(label: 'الاقدم'),
            ),
          ],
          customButton: const Padding(
            padding: EdgeInsets.all(8),
            child:
            Icon(
              Iconsax.sort,
              color: AppColors.primaryColor,
            ),
          ),
          onChanged: (value) {
            if (value == null) return;

            onChanged?.call(value);
          },
        ),
      ),
    );
  }
}
