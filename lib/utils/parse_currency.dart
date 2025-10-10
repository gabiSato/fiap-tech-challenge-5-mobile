double? parseCurrency(String? formattedCurrency) {
  if (formattedCurrency == null) return null;

  String numericcString = formattedCurrency.replaceAll(RegExp('[^0-9]'), '');

  return (double.tryParse(numericcString) ?? 0.0) / 100;
}
