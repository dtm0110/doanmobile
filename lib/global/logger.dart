import 'package:flutter/foundation.dart';

class Log {

  static void e(dynamic error, {String? tag}) {
    if (kDebugMode) {
      print("Error: ${tag != null ? "$tag:" : ""}$error");
    }
  }

  static void d(dynamic debug, {String? tag}) {
    if (kDebugMode) {
      print("Debug: ${tag != null ? "$tag:" : ""}$debug");
    }
  }
}
