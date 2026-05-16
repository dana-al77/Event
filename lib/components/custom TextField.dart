import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController control;
  final TextInputType textInputType;
  final String? hintText;
  final String? labelText;
  final int? maxLines;
  final double maxWidth;
  final double maxHeight;
  final bool obscureText;
  final bool? enabled;
  final bool existIconRight;
  final FocusNode? focusNode;
  final TextInputAction textInputAction;
  final String? Function(String? value)? validator;
  final void Function(String? value)? onFieldSubmitted;
  final void Function()? onFieldCompleted;
  final void Function(String? value)? onFieldChanged;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color cursorColor;

  const CustomTextField({
    required this.control,
    this.obscureText = false,
    this.focusNode,
    this.enabled,
    required this.textInputType,
    this.hintText,
    this.maxHeight = 50,
    this.maxWidth = double.infinity,
    this.onFieldChanged,
    this.onFieldCompleted,
    this.labelText,
    this.maxLines = 1,
    this.onFieldSubmitted,
    this.textInputAction = TextInputAction.next,
    this.validator,
    this.suffixIcon,
    this.existIconRight = false,
    required this.cursorColor,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        enabled: enabled,
        keyboardType: textInputType,
        controller: control,
        onChanged: onFieldChanged,
        textInputAction: textInputAction,
        onFieldSubmitted: onFieldSubmitted,
        validator: validator,
        focusNode: focusNode,
        obscureText: obscureText,
        onEditingComplete: onFieldCompleted,
        cursorColor: cursorColor,
        style: TextStyle(
          // fontSize: 12.sp,
          color: Colors.black,
        ),
        maxLines: maxLines,
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          hintText: hintText,
          label: Text(labelText ?? ''),
          labelStyle: TextStyle(color: Colors.purple),
          constraints: BoxConstraints(maxWidth: maxWidth, maxHeight: maxHeight),
          contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          focusedBorder: OutlineInputBorder(
            borderSide:
            BorderSide(color: Colors.purpleAccent), // تغيير اللون عند التركيز
          ),
        )
    );
  }
}