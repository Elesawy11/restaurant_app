import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_app/core/utils/spacer.dart';
import 'package:restaurant_app/core/widgets/custom_elevated_button.dart';
import 'widget/auth_header_widget.dart';
import 'widget/auth_text_widget.dart';
import 'widget/custom_auth_text_field_widget.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                verticalSpace(40.h),
                const AuthHeaderWidget(
                  title: 'Welcome Back!',
                  subtitle: 'Please login to your account',
                ),
                verticalSpace(40),
                const Expanded(child: Form(child: CustomAuthTextFieldWidget())),
                verticalSpace(20.h),
                CustomElevatedButton(
                  padding: EdgeInsets.symmetric(
                    horizontal: 60.w,
                    vertical: 10.h,
                  ),
                  text: 'Login',
                  onPressed: () {
                    // Handle login action
                  },
                ),

                verticalSpace(18),
                const AuthTextWidget(
                  text: 'Don\'t have an account? ',
                  methodName: 'Sign Up',
                ),
                verticalSpace(20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
