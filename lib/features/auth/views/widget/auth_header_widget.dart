import 'package:flutter/material.dart';

import '../../../../core/utils/spacer.dart';
import '../../../../core/utils/styles.dart';

class AuthHeaderWidget extends StatelessWidget {
  const AuthHeaderWidget({
    super.key,
    required this.title,
    required this.subtitle,
  });
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title, style: Styles.font32normal),
        verticalSpace(4),
        Text(subtitle, style: Styles.font14normal),
      ],
    );
  }
}
