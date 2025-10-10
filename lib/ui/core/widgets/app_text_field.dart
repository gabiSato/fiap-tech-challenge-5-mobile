import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String labelText;
  final String? initialValue;
  final String? hintText;
  final String? errorText;
  final IconData? icon;
  final bool obscureText;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final TextInputType? keyboardType;
  final Widget? suffix;
  final bool readOnly;

  const AppTextField({
    required this.labelText,
    super.key,
    this.controller,
    this.initialValue,
    this.hintText,
    this.errorText,
    this.icon,
    this.obscureText = false,
    this.validator,
    this.onChanged,
    this.keyboardType,
    this.suffix,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      initialValue: initialValue,
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        errorText: errorText,
        icon: icon != null ? Icon(icon) : null,
        suffix: suffix,
      ),
      validator: validator,
      onChanged: onChanged,
      readOnly: readOnly,
    );
  }
}
