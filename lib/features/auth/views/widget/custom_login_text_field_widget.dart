import 'package:flutter/material.dart';
import '../../../../core/utils/spacer.dart';
import '../../../../core/widgets/custom_text_form_field.dart';

class CustomLoginTextFieldWidget extends StatelessWidget {
  const CustomLoginTextFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          hintText: 'Email',
          labelText: 'email',
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your email';
            }
            return null;
          },
        ),
        verticalSpace(18),
        CustomTextFormField(
          hintText: 'Password',
          labelText: 'password',
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your password';
            }
            return null;
          },
        ),
      ],
    );
  }
}
