import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_app/core/utils/navigation.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_elevated_button.dart';
import '../../../../home/ui/views/home_view.dart';
import '../../cubits/login_cubit/login_cubit.dart';

class LoginBlocConsumer extends StatelessWidget {
  const LoginBlocConsumer({super.key, required this.cubit});

  final LoginCubit cubit;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errMessage)));
        } else if (state is LoginSuccess) {
          context.pushAndRemoveUntil(const HomeView());
        }
      },
      builder: (context, state) {
        return CustomElevatedButton(
          padding: EdgeInsets.symmetric(horizontal: 60.w, vertical: 10.h),

          onPressed: () {
            if (cubit.formKey.currentState!.validate()) {
              cubit.login();
            }
          },
          child: state is LoginLoading
              ? const CircularProgressIndicator(color: Colors.white)
              : Text(
                  'Login',
                  style: Styles.font18W600.copyWith(color: Colors.white),
                ),
        );
      },
    );
  }
}
