import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_app/core/utils/navigation.dart';
import 'package:restaurant_app/features/auth/ui/cubits/signup_cubit/sign_up_cubit.dart';
import '../../../../../core/utils/spacer.dart';
import 'auth_header_widget.dart';
import 'auth_text_widget.dart';
import 'custom_auth_text_field_widget.dart';
import 'signup_bloc_consumer.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignUpCubit>();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            verticalSpace(40),
            const AuthHeaderWidget(
              title: 'Create a new Account',
              subtitle: 'Please fill in the details below',
            ),
            verticalSpace(40),
            Expanded(
              child: Form(
                key: cubit.formKey,
                child: CustomAuthTextFieldWidget(
                  emailController: cubit.emailController,
                  passwordController: cubit.passwordController,
                ),
              ),
            ),
            verticalSpace(20),
            const SignupBlocConsumer(),

            verticalSpace(18),
            AuthTextWidget(
              onTap: () => context.pop(),
              text: 'Have an account? ',
              methodName: 'Login',
            ),
            verticalSpace(20),
          ],
        ),
      ),
    );
  }
}
