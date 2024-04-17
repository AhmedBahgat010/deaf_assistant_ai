import 'package:deaf_assistant_ai/Core/Utils/App%20Colors.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:iconsax/iconsax.dart';

import '../../../Core/Ui/input_fields/custom_input_decorator.dart';


class TextInput extends StatefulWidget {
  final String name;
  final String? initialValue;
  final String? label;
  TextEditingController? textEditingController;
  final IconData? leadingIcon;
  final TextInputType inputType;
  final bool enableFocusBorder;
  final Color? leadingIconColor;
  final int maxLines;
  final String? Function(String?)? validator;
  final bool enabled;
  final void Function(String?)? onChanged;

   TextInput({
    super.key,
    required this.name,
    this.initialValue,
    this.label,
  this.textEditingController,
    this.leadingIcon,
    this.inputType = TextInputType.text,
    this.enableFocusBorder = true,
    this.leadingIconColor,
    this.maxLines = 1,
    this.validator,
    this.enabled = true,
    this.onChanged,
  });

  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  final focusNode = FocusNode();
  late bool _isObscure;

  @override
  void initState() {
    super.initState();

    focusNode.addListener(() {
      setState(() {});
    });

    _isObscure = widget.inputType == TextInputType.visiblePassword;
  }

  void _toggleObscure() => setState(() => _isObscure = !_isObscure);

  @override
  Widget build(BuildContext context) {
    return FormBuilderField<String>(
      name: widget.name,
      initialValue: widget.initialValue,
      onChanged: widget.onChanged,
      builder: (field) {
        final isEmpty = field.value?.isEmpty ?? true;
        return CustomInputDecorator(
          disableTapRippleEffect: true,
          onTap: () => focusNode.requestFocus(),
          focused: focusNode.hasFocus && widget.enableFocusBorder,
          padding: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: isEmpty ? 20 : 12.5,
          ),
          leadingIcon: widget.leadingIcon,
          leadingIconColor: widget.leadingIconColor ??
              (isEmpty
                  ? AppColors.black.withOpacity(0.40)
                  : AppColors.black),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (!isEmpty && widget.label != null) ...[
                Text(
                  widget.label!,
                  style: const TextStyle(
                    color: AppColors.darkGrey,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 4),
              ],
              TextFormField(
                enabled: widget.enabled,
                initialValue: widget.initialValue,
                focusNode: focusNode,
                onChanged: field.didChange,
                validator: widget.validator,
                maxLines: widget.maxLines,
                keyboardType: widget.inputType,
                obscureText:
                    widget.inputType == TextInputType.visiblePassword &&
                        _isObscure,
                style: const TextStyle(
                  color: AppColors.black,
                  fontSize: 14,
                  height: 1,
                ),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  isDense: true,
                  border: InputBorder.none,
                  hintText: widget.label,

                  hintStyle: const TextStyle(
                    color: AppColors.darkGrey,
                    fontSize: 14,
                    height: 1,
                  ),
                ),
              ),
            ],
          ),
          trailing: widget.inputType == TextInputType.visiblePassword
              ? InkResponse(
                  onTap: _toggleObscure,
                  child: Icon(
                    _isObscure ? Iconsax.eye_slash : Iconsax.eye,
                    size: 24,
                  ),
                )
              : null,
        );
      },
    );
  }
}
