import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.controller,
    required this.hintText,
    required this.labelText,
    this.validator,
  });
  final TextEditingController? controller;
  final String hintText;
  final String labelText;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: Colors.white,
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,

        labelStyle: const TextStyle(color: Colors.white),
        border: outlineInputBorderField(),

        focusedBorder: outlineInputBorderField(width: 1.5.w),
        enabledBorder: outlineInputBorderField(),
        errorBorder: outlineInputBorderField(color: Colors.red),
      ),
    );
  }

  OutlineInputBorder outlineInputBorderField({Color? color, double? width}) {
    return OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(16)),
      borderSide: BorderSide(color: color ?? Colors.white, width: width ?? 1.w),
    );
  }
}
