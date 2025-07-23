import 'package:flutter/material.dart';
import 'package:restaurant_app/core/utils/assets.dart';
import '../../../core/utils/styles.dart';

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
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 10,
                ),
              ),
              child: Text(
                'Get Start',
                style: Styles.font18bold.copyWith(color: Colors.white),
              ),
            ),
            const Spacer(flex: 1),
          ],
        ),
      ),
    );
  }
}
