import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../theme/themes.dart';

extension StringNullable on String? {
  bool get emptyOrNull => this == null || this?.isEmpty == true;

  bool get notEmpty => this != null && this?.isNotEmpty == true;

  String ellipsisMid({int maxLength = 10}) {
    if (this == null) return "";
    var haftLength = min<int>(this?.length ?? 0, maxLength) ~/ 2;
    return "${this?.substring(0, haftLength)}…${this?.substring((this?.length ?? haftLength) - haftLength, this?.length)}";
  }

  String get cryptoAddress {
    var rawAddress = this?.replaceFirst("0x", "");
    return "0x${rawAddress.ellipsisMid(maxLength: 8)}";
  }
}

extension StringExtension on String {
  void showSnackBar(BuildContext context) {
    if (!canShowSnackBar) return;
    Timer(snackBarDuration, () {
      canShowSnackBar = true;
    });
    canShowSnackBar = false;
    ScaffoldMessenger.of(context)
        .hideCurrentSnackBar(reason: SnackBarClosedReason.remove);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: snackBarDuration,
        content: Text(this, style: ThemeTextStyle.body14)));
  }

  DateTime toDate(String format) {
    return DateFormat(format).parse(this);
  }

  double get toDouble => double.tryParse(this) ?? 0.0;

  int get toInt => int.parse(this);

  String convertDateFormat(String fromFormat, String toFormat) {
    return DateFormat(toFormat).format(toDate(fromFormat));
  }

  bool isNumber() {
    for (String element in characters) {
      if (!element.isDigit()) {
        return false;
      }
    }
    return true;
  }

  bool isDigit() {
    if (length == 1) {
      switch (this) {
        case "0":
        case "1":
        case "2":
        case "3":
        case "4":
        case "5":
        case "6":
        case "7":
        case "8":
        case "9":
          return true;
      }
    }
    return false;
  }

  bool get isFile {
    if (isEmpty) return false;
    return File(this).existsSync();
  }

  String capitalize() => (isNotEmpty && length > 1)
      ? this[0].toUpperCase() + substring(1)
      : isNotEmpty
          ? toUpperCase()
          : '';

  static bool canShowSnackBar = true;
  static const snackBarDuration = Duration(seconds: 1);

  static const DATE_FORMAT_FROM_SERVER = "dd-MM-yyyy HH:mm:ss";
}
