import 'package:deaf_assistant_ai/Core/Utils/App%20Colors.dart';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'custom_input_decorator.dart';

class DropdownInput<T> extends StatefulWidget {
  final String name;
  final List<DropdownMenuItem<T>> items;
  final T? initialValue;
  final String? label;
  final IconData? leadingIcon;
  final bool enableFocusBorder;
  final Color? leadingIconColor;
  final String? Function(T?)? validator;
  final bool enabled;

  const DropdownInput({
    super.key,
    required this.name,
    required this.items,
    this.initialValue,
    this.label,
    this.leadingIcon,
    this.enableFocusBorder = true,
    this.leadingIconColor,
    this.validator,
    this.enabled = true,
  });

  @override
  State<DropdownInput> createState() => _DropdownInputState<T>();
}

class _DropdownInputState<T> extends State<DropdownInput<T>> {
  final focusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    focusNode.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilderField<T>(
      name: widget.name,
      initialValue: widget.initialValue,
      autovalidateMode: AutovalidateMode.always,
      builder: (field) {
        final isEmpty = field.value == null;
        return CustomInputDecorator(
          disableTapRippleEffect: true,
          onTap: () => focusNode.requestFocus(),
          focused: focusNode.hasFocus && widget.enableFocusBorder,
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 20,
          ),
          leadingIcon: widget.leadingIcon,
          leadingIconColor: widget.leadingIconColor ??
              (isEmpty
                  ? AppColors.black.withOpacity(0.40)
                  : AppColors.black),
          body: DropdownButtonFormField<T>(
            value: field.value,
            items: widget.items,
            focusNode: focusNode,
isExpanded: true,
            onChanged: field.didChange,
            validator: widget.validator,
            style: const TextStyle(
              fontFamily: "Cairo",
              color: AppColors.black,
              fontSize: 14,
            ),
            elevation: 0,
            borderRadius: BorderRadius.circular(8),
            focusColor: AppColors.white,
            dropdownColor: AppColors.white,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.zero,
              isDense: true,
              focusColor: AppColors.white,
              border: InputBorder.none,
              fillColor: AppColors.white,
              hoverColor: AppColors.white,
              hintText: widget.label,
              hintStyle: const TextStyle(
                fontFamily: "Cairo",
                color: AppColors.darkGrey,
                fontSize: 14,
                height: 1.5,
              ),
            ),
          ),
        );
      },
    );
  }
}
