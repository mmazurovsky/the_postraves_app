import 'package:flutter/material.dart';

class MySlideAnimatedSwitcher extends StatelessWidget {
  final Widget child;
  const MySlideAnimatedSwitcher({Key? key, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      switchInCurve: Curves.ease,
      switchOutCurve: Curves.ease,
      transitionBuilder: (child, animation) {
        return SlideTransition(
          child: child,
          position: Tween<Offset>(
            begin: const Offset(0, 1),
            end: Offset.zero,
          ).animate(animation),
        );
      },
      child: child,
    );
  }
}
