import 'package:flutter/material.dart';

class HeroKit extends StatelessWidget {
  final Widget child;
  final String tagIndex;
  final bool expanded;

  const HeroKit({
    super.key,
    required this.tagIndex,
    required this.child,
    this.expanded = false,
  });

  @override
  Widget build(BuildContext context) =>
      expanded ? Expanded(child: heroContent()) : heroContent();

  heroContent() => Hero(
      tag: tagIndex.trim().replaceAll(" ", ""),
      child: Material(
        type: MaterialType.transparency,
        child: child,
      ));
}
