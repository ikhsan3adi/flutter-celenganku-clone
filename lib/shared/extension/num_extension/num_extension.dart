import 'package:intl/intl.dart';

extension CurrencyStringFormat on num {
  /// return currency formatted string
  String toCurrency() {
    final formatter = NumberFormat.simpleCurrency(locale: "id_ID", decimalDigits: 0, name: '');

    return formatter.format(this);
  }
}
