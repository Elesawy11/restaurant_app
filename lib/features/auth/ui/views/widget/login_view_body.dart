import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_app/core/utils/navigation.dart';
import '../../../../../core/utils/spacer.dart';
import '../../cubits/login_cubit/login_cubit.dart';
import '../signup_view.dart';
import 'auth_header_widget.dart';
import 'auth_text_widget.dart';
import 'custom_auth_text_field_widget.dart';
import 'login_bloc_consumer.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            verticalSpace(40),
            const AuthHeaderWidget(
              title: 'Welcome Back!',
              subtitle: 'Please login to your account',
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
            LoginBlocConsumer(cubit: cubit),

            verticalSpace(18),
            AuthTextWidget(
              text: 'Don\'t have an account? ',
              methodName: 'Sign Up',
              onTap: () => context.push(const SignupView()),
            ),
            verticalSpace(20),
          ],
        ),
      ),
    );
  }
}
