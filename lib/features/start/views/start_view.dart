import 'package:flutter/material.dart';
import 'package:restaurant_app/core/utils/assets.dart';
import 'package:restaurant_app/core/utils/navigation.dart';
import 'package:restaurant_app/features/auth/ui/views/login_view.dart';
import '../../../core/utils/styles.dart';
import '../../../core/widgets/custom_elevated_button.dart';

class StartView extends StatelessWidget {
  const StartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,

        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Spacer(flex: 1),
            Text('Restaurant App', style: Styles.font32bold),
            const Spacer(flex: 1),
            Image.asset(Assets.imagesBurger1),
            const Spacer(flex: 3),
            CustomElevatedButton(
              text: 'Get Started',
              onPressed: () => context.pushReplacement(const LoginView()),
            ),
            const Spacer(flex: 1),
          ],
        ),
      ),
    );
  }
}
