import 'package:flutter/material.dart';

class SlideAnimationWrapper extends StatefulWidget {
  final Widget child;
  SlideAnimationWrapper({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  _SlideAnimationWrapperState createState() => _SlideAnimationWrapperState();
}

class _SlideAnimationWrapperState extends State<SlideAnimationWrapper>
    with SingleTickerProviderStateMixin {
  late Animation<Offset> _offsetAnimation;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 350),
      vsync: this,
    )..forward();
    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _offsetAnimation,
      child: widget.child,
    );
  }
}
