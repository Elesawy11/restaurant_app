import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_app/features/auth/ui/cubits/signup_cubit/sign_up_cubit.dart';
import 'widget/signup_view_body.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(),
      child: const Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(child: SignUpViewBody()),
      ),
    );
  }
}
