import 'package:flutter/material.dart';
import '../utils/styles.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({super.key, required this.text, this.onPressed, this.padding});
  final String text;
  final VoidCallback? onPressed;
  final EdgeInsetsGeometry? padding;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding:padding?? const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      ),
      child: Text(text, style: Styles.font18bold.copyWith(color: Colors.white)),
    );
  }
}
