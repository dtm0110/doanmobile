import 'package:job_search/theme/themes.dart';
import 'package:flutter/material.dart';

import '../theme/styles.dart';

class ButtonView extends StatelessWidget {
  final String content;
  final VoidCallback callback;
  final bool isDisable;

  const ButtonView(this.callback,
      {this.isDisable = false, this.content = "", Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: UIColors.transparent,
        child: SizedBox(
            width: double.infinity - 32,
            height: 46.0,
            child: ElevatedButton(
              onPressed: () {
                callback();
              },
              style: isDisable
                  ? UCStyle.buttonStyleInvestDisable
                  : UCStyle.buttonStyleInvest44,
              child: Text(
                content,
                style: ThemeTextStyle.button.apply(
                    color: isDisable ? UIColors.blackPrimary : UIColors.blackPrimary),
              ),
            )));
  }
}
