import 'package:flutter/material.dart';

import '../theme/themes.dart';

class TabLayout extends StatelessWidget {
  final List<String> tabContent;

  const TabLayout(this.tabContent, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => TabBar(
        labelColor: UIColors.primary,
        indicatorColor: UIColors.primary,
        tabs: _getTabs(tabContent),
        labelStyle: ThemeTextStyle.heading16,
        labelPadding: const EdgeInsets.all(0),
      );

  List<Widget> _getTabs(List<String> tabContent) {
    var list = <Tab>[];
    for (var value in tabContent) {
      list.add(Tab(text: value));
    }
    return list;
  }
}
