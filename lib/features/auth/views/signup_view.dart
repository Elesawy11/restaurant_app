import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_app/core/utils/navigation.dart';
import 'package:restaurant_app/features/home/views/home_view.dart';
import '../../../core/utils/spacer.dart';
import '../../../core/widgets/custom_elevated_button.dart';
import 'widget/auth_header_widget.dart';
import 'widget/auth_text_widget.dart';
import 'widget/custom_auth_text_field_widget.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

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
                verticalSpace(40),
                const AuthHeaderWidget(
                  title: 'Create a new Account',
                  subtitle: 'Please fill in the details below',
                ),
                verticalSpace(40),
                const Expanded(child: Form(child: CustomAuthTextFieldWidget())),
                verticalSpace(20),
                CustomElevatedButton(
                  padding: EdgeInsets.symmetric(
                    horizontal: 60.w,
                    vertical: 10.h,
                  ),
                  text: 'Sign Up',
                  onPressed: () {
                    context.pushAndRemoveUntil(const HomeView());
                    // Handle login action
                  },
                ),

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
        ),
      ),
    );
  }
}
