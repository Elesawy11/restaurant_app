import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    this.controller,
    required this.hintText,
    required this.labelText,
    this.validator,
    this.obscureField,
  });
  final TextEditingController? controller;
  final String hintText;
  final String labelText;
  final String? Function(String?)? validator;
  final bool? obscureField;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool isObscure = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      cursorColor: Colors.white,
      validator: widget.validator,
      decoration: InputDecoration(
        hintText: widget.hintText,
        labelText: widget.labelText,

        labelStyle: const TextStyle(color: Colors.white),
        border: outlineInputBorderField(),

        focusedBorder: outlineInputBorderField(width: 1.5.w),
        enabledBorder: outlineInputBorderField(),
        errorBorder: outlineInputBorderField(color: Colors.red),

        suffixIcon: widget.obscureField == true
            ? IconButton(
                icon: Icon(
                  isObscure ? Icons.visibility : Icons.visibility_off,
                  color: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    isObscure = !isObscure;
                  });
                },
              )
            : null,
      ),
      obscureText: widget.obscureField == true ? isObscure : false,
    );
  }

  OutlineInputBorder outlineInputBorderField({Color? color, double? width}) {
    return OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(16)),
      borderSide: BorderSide(color: color ?? Colors.white, width: width ?? 1.w),
    );
  }
}
