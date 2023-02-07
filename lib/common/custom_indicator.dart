import 'package:job_search/theme/themes.dart';
import 'package:flutter/material.dart';

class CustomIndicator extends StatelessWidget {
  /// PageView Controller
  final PageController controller;
  final int currentIndex;

  CustomIndicator(
      {Key? key,
      required this.controller,
      this.itemCount = 0,
      this.currentIndex = 0})
      : super(key: key);

  /// Number of indicators
  final int itemCount;

  /// Ordinary colours
  final Color normalColor = UIColors.primary50;

  /// Selected color
  final Color selectedColor = UIColors.primary;

  /// Size of points
  final double size = 8.0;

  /// Spacing of points
  final double spacing = 4.0;

  /// Point Widget
  Widget _buildIndicator(
      int index, int pageCount, double dotSize, double spacing) {
    // Is the current page selected?
    bool isCurrentPageSelected = index == currentIndex;

    return Column(children: [
      const SizedBox(height: 16.0),
      SizedBox(
        height: size,
        width: size + (2 * spacing),
        child: Center(
          child: Material(
            color: isCurrentPageSelected ? selectedColor : normalColor,
            type: MaterialType.circle,
            child: SizedBox(
              width: dotSize,
              height: dotSize,
            ),
          ),
        ),
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(itemCount, (int index) {
        return _buildIndicator(index, itemCount, size, spacing);
      }),
    );
  }
}
