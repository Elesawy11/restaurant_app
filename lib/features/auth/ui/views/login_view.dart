import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_app/features/auth/ui/cubits/login_cubit/login_cubit.dart';

import 'widget/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: const Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(child: LoginViewBody()),
      ),
    );
  }
}
