import 'package:flutter/material.dart';

import '../../generated/l10n.dart';
import '../../theme/themes.dart';
import 'hero_kit.dart';

class ToolbarHome extends StatelessWidget {
  final bool isLight;
  final String title;
  final String subTitle;
  final String? tag;
  final VoidCallback? onCallBack;
  final bool isRightButton;
  final VoidCallback? onTapTitleCallBack;

  const ToolbarHome({
    this.isLight = false,
    this.title = "",
    this.subTitle = "",
    this.tag = "title",
    this.isRightButton = false,
    this.onCallBack,
    Key? key,
    this.onTapTitleCallBack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top),
      child: Row(
        children: [
          InkWell(
              onTap: () {
                onCallBack?.call();
              },
              child: const Padding(
                  padding: EdgeInsets.all(16),
                  child: Icon(Icons.menu, color: UIColors.white))),
          Expanded(
              child: InkWell(
                  onTap: () {
                    onTapTitleCallBack?.call();
                  },
                  child: HeroKit(
                      tagIndex: "$tag",
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            title,
                            style: ThemeTextStyle.heading18
                                .apply(color: UIColors.white),
                          ),
                          if (subTitle.isNotEmpty)
                            Text(
                              subTitle,
                              style: ThemeTextStyle.body12
                                  .apply(color: UIColors.white),
                            )
                        ],
                      )))),
          isRightButton
              ? InkWell(
                  onTap: () {
                    onCallBack?.call();
                  },
                  child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        S.of(context).action_done,
                        style: ThemeTextStyle.button
                            .apply(color: UIColors.primary),
                      )))
              : const SizedBox(width: 48.0),
        ],
      ));
}
