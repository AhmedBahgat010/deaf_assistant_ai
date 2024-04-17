
import 'package:deaf_assistant_ai/Core/Utils/App%20Colors.dart';
import 'package:deaf_assistant_ai/Core/Utils/Core%20Components.dart';
import 'package:deaf_assistant_ai/Features/auth/presentation/manger/forget_password/cubit/forget_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:iconsax/iconsax.dart';


class NewPasswordInputView extends StatefulWidget {
  const NewPasswordInputView({super.key});

  @override
  State<NewPasswordInputView> createState() => _NewPasswordInputViewState();
}

class _NewPasswordInputViewState extends State<NewPasswordInputView> {
  String? _newPassword;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'أدخل كلمة السر الجديدة',
          style: TextStyle(
            color: AppColors.black,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 24),
        TextFieldTemplate(
          name: 'newPassword',
          label: 'كلمة السر الجديدة',
          leadingIcon: Iconsax.lock_1,
          leadingIconColor: AppColors.greenYellow,
          inputType: TextInputType.visiblePassword,
          enableFocusBorder: false,
          onChanged: (value) => _newPassword = value,
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(),
          ]),
        ),
        const SizedBox(height: 16),
        TextFieldTemplate(
          name: 'confirmNewPassword',
          label: 'تأكيد كلمة السر',
          leadingIcon: Iconsax.lock_1,
          leadingIconColor: AppColors.greenYellow,
          inputType: TextInputType.visiblePassword,
          enableFocusBorder: false,
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(),
            (String? value) {
              if (value != _newPassword) {
                return 'كلمة السر غير متطابقة';
              }
              return null;
            }
          ]),
        ),
        const SizedBox(height: 48),
        BlocBuilder<ForgetPasswordCubit, ForgetPasswordState>(
          builder: (context, state) {
            final cubit = context.read<ForgetPasswordCubit>();
            return ButtonTemplate(
              isLoading: state!.isResettingPassword,
              text1: 'إرسال',
              onPressed: (){}, color: AppColors.primaryColor,
            );
          },
        ),
      ],
    );
  }
}
