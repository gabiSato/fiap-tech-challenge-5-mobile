import 'package:flutter/material.dart';

class AppDropdown<T> extends StatelessWidget {
  final T? value;
  final String labelText;
  final String? hintText;
  final List<DropdownMenuItem<T>> items;
  final FormFieldValidator<T>? validator;
  final ValueChanged<T?>? onChanged;

  const AppDropdown({
    required this.labelText,
    required this.items,
    super.key,
    this.value,
    this.hintText,
    this.validator,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      initialValue: value,
      decoration: InputDecoration(labelText: labelText, hintText: hintText),
      items: items,
      validator: validator,
      onChanged: onChanged,
    );
  }
}
