import 'package:flutter/material.dart';
import 'package:job_search/generated/assets.dart';

import '../theme/themes.dart';

class CustomSearchView extends StatelessWidget {
  final Function(String) onCallBack;

  const CustomSearchView(this.onCallBack, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
      height: 46.0,
      margin: const EdgeInsets.only(left: 16, right: 16),
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(border: Border.all(width: 1.0, color: UIColors.grayscale1),
          color: UIColors.blackPrimary,
          borderRadius: BorderRadius.circular(23.0)),
      child: Center(
          child: TextField(
        onSubmitted: (value) {
          onCallBack(value);
        },
        textInputAction: TextInputAction.search,
        style: ThemeTextStyle.body14,
        textAlign: TextAlign.left,
        decoration: InputDecoration(
            prefixIconConstraints:
                const BoxConstraints(maxHeight: 14.0, maxWidth: 22.0),
            prefixIcon: Image.asset(Assets.imagesIcSearch,
                width: 22.0, height: 14.0, alignment: Alignment.centerLeft, color: UIColors.grayscale1),
            hintText: "Search",
            hintStyle: ThemeTextStyle.body14.apply(color: UIColors.grayscale1),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(vertical: 8.0),
            isDense: true),
      )));
}
