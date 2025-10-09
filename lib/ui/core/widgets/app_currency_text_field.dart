import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:fiap_farms/utils/currency_formatter.dart';

class AppCurrencyTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String labelText;
  final String? hintText;
  final String? errorText;
  final ValueChanged<String>? onChanged;

  const AppCurrencyTextField({
    required this.labelText,
    super.key,
    this.controller,
    this.hintText,
    this.errorText,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        errorText: errorText,
        prefixText: 'R\$ ',
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
