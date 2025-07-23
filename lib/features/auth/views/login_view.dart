import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_app/core/utils/spacer.dart';
import 'package:restaurant_app/core/widgets/custom_elevated_button.dart';
import '../../../core/utils/styles.dart';
import 'widget/custom_login_text_field_widget.dart';

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
                Text('Welcome Back!', style: Styles.font32normal),
                verticalSpace(4.h),
                Text(
                  'Please login to your account',
                  style: Styles.font14normal,
                ),

                verticalSpace(40),
                const Expanded(
                  child: Form(child: CustomLoginTextFieldWidget()),
                ),
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
                RichText(
                  text: TextSpan(
                    text: 'Don\'t have an account? ',
                    style: Styles.font14normal.copyWith(color: Colors.white),
                    children: [
                      TextSpan(
                        text: 'Sign Up',
                        style: Styles.font14bold.copyWith(color: Colors.blue),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // Navigate to sign up view
                            // context.push('/sign-up');
                          },
                      ),
                    ],
                  ),
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
