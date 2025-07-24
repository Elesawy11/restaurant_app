import 'package:flutter/material.dart';
import '../../../../core/utils/spacer.dart';
import '../../../../core/widgets/custom_text_form_field.dart';

class CustomAuthTextFieldWidget extends StatelessWidget {
  const CustomAuthTextFieldWidget({
    super.key,
    this.passwordController,
    this.emailController,
  });
  final TextEditingController? passwordController;
  final TextEditingController? emailController;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          controller: emailController,
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
          obscureField: true,
          controller: passwordController,
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
