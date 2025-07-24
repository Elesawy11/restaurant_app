import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/styles.dart';

class AuthTextWidget extends StatelessWidget {
  const AuthTextWidget({
    super.key,
    required this.text,
    required this.methodName, this.onTap,
  });
  final String text;
  final String methodName;
  final VoidCallback? onTap;
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
              ..onTap = onTap,
          ),
        ],
      ),
    );
  }
}
