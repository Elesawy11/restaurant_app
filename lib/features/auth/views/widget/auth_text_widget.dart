import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/styles.dart';

class AuthTextWidget extends StatelessWidget {
  const AuthTextWidget({
    super.key,
    required this.text,
    required this.methodName,
  });
  final String text;
  final String methodName;
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: text,
        style: Styles.font14normal.copyWith(color: Colors.white),
        children: [
          TextSpan(
            text: methodName,
            style: Styles.font14bold.copyWith(color: Colors.blue),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                // Navigate to sign up view
                // context.push('/sign-up');
              },
          ),
        ],
      ),
    );
  }
}
