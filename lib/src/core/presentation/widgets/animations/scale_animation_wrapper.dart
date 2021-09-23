import 'package:flutter/material.dart';

class ScaleAnimationWrapper extends StatefulWidget {
  final Widget child;
  ScaleAnimationWrapper({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  _ScaleAnimationWrapperState createState() => _ScaleAnimationWrapperState();
}

class _ScaleAnimationWrapperState extends State<ScaleAnimationWrapper>
    with SingleTickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
      lowerBound: 0.5,
      upperBound: 1,
    );
    _animation = CurvedAnimation(
      curve: Curves.easeInOutQuint,
      parent: _controller,
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _animation,
      child: widget.child,
    );
  }
}
