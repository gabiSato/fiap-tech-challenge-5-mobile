import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:fiap_farms/utils/currency_formatter.dart';

class AppCurrencyTextField extends StatelessWidget {
  final String labelText;
  final String? initialValue;
  final String? hintText;
  final String? errorText;
  final ValueChanged<String>? onChanged;
  final bool readOnly;

  const AppCurrencyTextField({
    required this.labelText,
    super.key,
    this.initialValue,
    this.hintText,
    this.errorText,
    this.onChanged,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      readOnly: readOnly,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        errorText: errorText,
      ),
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        CurrencyTextInputFormatter(),
      ],
      onChanged: onChanged,
    );
  }
}
