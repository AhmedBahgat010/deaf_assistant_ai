import 'package:deaf_assistant_ai/Core/Utils/App%20Colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:iconsax/iconsax.dart';

import '../../Features/Ui/input_fields/text_input.dart';
import '../../Features/Ui/primary_button.dart';
import '../Utils/sizes_helper.dart';


class WalletLimitModalSheet extends StatefulWidget {
  final String title;
  final Function(double value) onSave;
  final double? initialValue;
  final bool isLoading;

  const WalletLimitModalSheet({
    super.key,
    required this.title,
    required this.onSave,
    this.initialValue,
    this.isLoading = false,
  });

    Future<void> show(BuildContext context) {
      return showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) => this,
      );
    }

  @override
  State<WalletLimitModalSheet> createState() => _WalletLimitModalSheetState();
}

class _WalletLimitModalSheetState extends State<WalletLimitModalSheet> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 32,
        horizontal: 24,
      ).add(
        EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: SizesHelper.defaultBorderRadius.topLeft,
          topRight: SizesHelper.defaultBorderRadius.topRight,
        ),
      ),
      child: FormBuilder(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              widget.title,
              style: const TextStyle(
                color: AppColors.black,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),
            TextInput(
              initialValue: widget.initialValue?.toString(),
              name: 'value',
              label: 'القيمة',
              inputType: TextInputType.number,
              leadingIcon: Iconsax.money,
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
                FormBuilderValidators.numeric(),
              ]),
            ),
            const SizedBox(height: 24),
            PrimaryButton(
              isLoading: widget.isLoading,
              backgroundColor: AppColors.greenYellow,
              foregroundColor: AppColors.white,
              label: 'حفظ',
              onPressed: _save,
            ),
          ],
        ),
      ),
    );
  }

  void _save() {
    final formState = _formKey.currentState;
    if (formState == null) return;

    if (formState.saveAndValidate() == false) return;

    widget.onSave(double.parse(formState.value['value']));
  }
}
