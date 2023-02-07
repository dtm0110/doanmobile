import 'package:flutter/material.dart';
import 'package:job_search/generated/assets.dart';

import '../../theme/themes.dart';
import 'hero_kit.dart';

class Toolbar extends StatelessWidget {
  final bool isLight;
  final String title;
  final String subTitle;
  final String? tag;
  final VoidCallback? onCallBack;
  final bool isRightButton;
  final bool isLeftButton;

  const Toolbar({
    this.isLight = false,
    this.title = "",
    this.subTitle = "",
    this.tag = "title",
    this.isRightButton = false,
    this.isLeftButton = false,
    this.onCallBack,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top),
      child: Row(
        children: [
          InkWell(
              onTap: () {
                if (isLeftButton) Navigator.of(context).pop();
              },
              child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Image.asset(
                    Assets.imagesIcBack,
                    height: 24,
                    width: 24,
                    fit: BoxFit.cover,
                    color: isLeftButton ? UIColors.black : UIColors.transparent,
                  ))),
          Expanded(
              child: HeroKit(
                  tagIndex: "$tag",
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: ThemeTextStyle.heading18,
                      ),
                      if (subTitle.isNotEmpty)
                        Text(
                          subTitle,
                          style: ThemeTextStyle.body12,
                        )
                    ],
                  ))),
          isRightButton
              ? InkWell(
                  onTap: () {
                    onCallBack?.call();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Image.asset(
                      fit: BoxFit.cover,
                      Assets.imagesIcAccount,
                      height: 32.0,
                      color: UIColors.black,
                      width: 32.0,
                    ),
                  ),
                )
              : const SizedBox(width: 48.0),
        ],
      ));
}
