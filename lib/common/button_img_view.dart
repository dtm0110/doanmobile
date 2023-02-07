import 'package:flutter/material.dart';
import 'package:job_search/theme/themes.dart';

import '../generated/assets.dart';
import '../theme/styles.dart';

class ButtonImgView extends StatelessWidget {
  final String content;
  final VoidCallback callback;
  final bool isDisable;
  final bool isShowRightBtn;

  const ButtonImgView(this.callback,
      {this.isDisable = false,
      this.isShowRightBtn = true,
      this.content = "",
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: UIColors.transparent,
        child: SizedBox(
            width: double.infinity - 32,
            height: 36.0,
            child: ElevatedButton(
              onPressed: () {
                callback();
              },
              style: isDisable
                  ? UCStyle.buttonStyleInvestDisable46
                  : UCStyle.buttonStyleInvest46,
              child: Row(
                children: [
                  const SizedBox(width: 8.0),
                  if (isShowRightBtn)
                    Image.asset(Assets.imagesIcLogo,
                        width: 16.0,
                        height: 16.0,
                        color: UIColors.blackPrimary),
                  const SizedBox(width: 8.0),
                  Expanded(
                      child: Text(
                    content,
                    style: ThemeTextStyle.button.apply(
                        color: isDisable
                            ? UIColors.blackPrimary
                            : UIColors.blackPrimary),
                    textAlign: TextAlign.center,
                  )),
                  Image.asset(Assets.imagesChevronDown,
                      width: 16.0, height: 16.0),
                  const SizedBox(width: 8.0),
                ],
              ),
            )));
  }
}
