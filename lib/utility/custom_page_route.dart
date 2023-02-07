import 'package:job_search/theme/themes.dart';
import 'package:flutter/material.dart';

enum Direction {
  rightToLeft(Offset(1.0, 0.0)),
  bottomToTop(Offset(0.0, 1.0)),
  topToBottom(Offset(0.0, -1.0)),
  leftToRight(Offset(-1.0, 0.0));

  final Offset value;

  const Direction(this.value);
}

enum TransitionDuration {
  zero(Duration.zero),
  fast(Duration(milliseconds: 250)),
  normal(Duration(milliseconds: 300)),
  slow(Duration(milliseconds: 350));

  final Duration value;

  const TransitionDuration(this.value);
}

class UCRoute<T> extends PageRoute<T> {
  final Widget child;
  final bool fade;
  final Direction direction;
  final TransitionDuration duration;

  UCRoute(
    this.child, {
    this.fade = false,
    this.direction = Direction.rightToLeft,
    this.duration = TransitionDuration.normal,
  });

  @override
  Color? get barrierColor => UIColors.transparent;

  @override
  String? get barrierLabel => null;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    if (fade) {
      return FadeTransition(opacity: animation, child: child);
    }

    final tween = Tween(begin: direction.value, end: Offset.zero);
    final offsetAnimation = animation.drive(tween);
    return SlideTransition(
      position: offsetAnimation,
      child: child,
    );
  }

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => duration.value;
}
