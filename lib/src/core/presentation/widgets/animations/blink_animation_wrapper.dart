import 'package:flutter/material.dart';

class BlinkAnimationWrapper extends StatefulWidget {
  final Function(Color) widgetBuilder;
  final Color startColor;
  final Color endColor;
  BlinkAnimationWrapper({
    Key? key,
    required this.widgetBuilder,
    required this.startColor,
    required this.endColor,
  }) : super(key: key);

  @override
  _BlinkAnimationWrapperState createState() => _BlinkAnimationWrapperState();
}

class _BlinkAnimationWrapperState extends State<BlinkAnimationWrapper>
    with SingleTickerProviderStateMixin {
  late Animation<Color?> _colorAnimation;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);
    _colorAnimation = ColorTween(
      begin: widget.startColor,
      end: widget.endColor,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _colorAnimation,
      builder: (context, child) => widget.widgetBuilder(_colorAnimation.value!),
    );
  }
}
