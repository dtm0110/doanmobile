import 'package:flutter/material.dart';

enum EditTextType { text, email, pass, number }

extension EditTextTypeExtension on EditTextType {
  TextInputType get keyboardType {
    switch (this) {
      case EditTextType.text:
        return TextInputType.text;
      case EditTextType.email:
        return TextInputType.emailAddress;
      case EditTextType.pass:
        return TextInputType.visiblePassword;
      case EditTextType.number:
        return TextInputType.number;
    }
  }

  bool get isSecurity {
    switch (this) {
      case EditTextType.text:
        return false;
      case EditTextType.email:
        return false;
      case EditTextType.number:
        return false;
      case EditTextType.pass:
        return true;
    }
  }
}
