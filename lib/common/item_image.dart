import 'package:flutter/material.dart';

import '../theme/themes.dart';

class ItemImage extends StatelessWidget {
  final String iconName;
  final String actionName;
  final VoidCallback onTapAction;

  const ItemImage(
      {super.key,
      required this.iconName,
      required this.actionName,
      required this.onTapAction});

  @override
  Widget build(BuildContext context) => InkWell(
      onTap: () {
        onTapAction.call();
      },
      child: Center(child: actionView(context)));

  Widget actionView(BuildContext context) =>
      Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Image.asset(iconName, height: 36.0, width: 36.0),
        const SizedBox(height: 8.0),
        Text(actionName, style: ThemeTextStyle.body12.apply(color: UIColors.primary))
      ]);
}
