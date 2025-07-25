import 'package:flutter/material.dart';
import '../utils/styles.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
     this.text,
    this.onPressed,
    this.padding,
    this.child,
  });
  final String? text;
  final VoidCallback? onPressed;
  final EdgeInsetsGeometry? padding;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding:
            padding ?? const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      ),
      child:
          child ??
          Text(
            text ?? '',
            style: Styles.font18W600.copyWith(color: Colors.white),
          ),
    );
  }
}
