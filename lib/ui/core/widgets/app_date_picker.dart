import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppDatePicker extends StatelessWidget {
  final DateTime? selectedDate;
  final String labelText;
  final String? errorText;
  final ValueChanged<DateTime> onDateSelected;

  const AppDatePicker({
    required this.selectedDate,
    required this.labelText,
    required this.onDateSelected,
    super.key,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final DateTime? picked = await showDatePicker(
          context: context,
          initialDate: selectedDate ?? DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2101),
        );
        if (picked != null && picked != selectedDate) {
          onDateSelected(picked);
        }
      },
      child: InputDecorator(
        decoration: InputDecoration(labelText: labelText, errorText: errorText),
        child: Text(
          selectedDate == null
              ? 'Selecione uma data'
              : DateFormat('dd/MM/yyyy').format(selectedDate!),
        ),
      ),
    );
  }
}
