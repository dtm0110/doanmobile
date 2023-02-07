import 'package:flutter/material.dart';

class BaseApp extends StatelessWidget {
  final Widget child;

  const BaseApp({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        hideKeyboardImmediate(context);
      },
      child: child,
    );
  }

  static void hideKeyboardImmediate(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }
}
