import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_app/core/utils/navigation.dart';

import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_elevated_button.dart';
import '../../../../home/views/home_view.dart';
import '../../cubits/signup_cubit/sign_up_cubit.dart';

class SignupBlocConsumer extends StatelessWidget {
  const SignupBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpSuccess) {
          context.pushAndRemoveUntil(const HomeView());
        } else if (state is SignUpError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errMessage)));
        }
      },
      builder: (context, state) {
        return CustomElevatedButton(
          padding: EdgeInsets.symmetric(horizontal: 60.w, vertical: 10.h),

          onPressed: () {
            if (context.read<SignUpCubit>().formKey.currentState!.validate()) {
              context.read<SignUpCubit>().signup();
            }
          },
          child: state is SignUpLoading
              ? const CircularProgressIndicator(color: Colors.white)
              : Text(
                  'Sign Up',
                  style: Styles.font18W600.copyWith(color: Colors.white),
                ),
        );
      },
    );
  }
}
