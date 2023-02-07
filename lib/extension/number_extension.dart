import 'dart:math';

import 'package:intl/intl.dart';

var formatter = NumberFormat("#,###.######");

extension IntExtension on int {
  String toDateFormat(String format) {
    final datetime = DateTime.fromMillisecondsSinceEpoch(this);
    return DateFormat(format).format(datetime);
  }

  String currency() => NumberFormat.simpleCurrency(
        name: 'VND',
      ).format(this);
}

extension NumberExtension on num {
  String formatNumber({int decimal = 8}) {
    return formatter.format(roundDecimal(decimal));
  }

  String currency() => NumberFormat("#,##0.00", "en_US").format(num);

  num cryptoDecimal(int decimal) => this / pow(10, decimal);

  num roundDecimal(int decimal) => num.parse(toStringAsFixed(decimal));
}
