import 'package:flutter/material.dart';

class RowOfWidgets extends StatelessWidget {
  final List<Widget?> children;

  const RowOfWidgets({
    Key? key,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children
          .map((child) => child != null
              ? Row(
                  children: [
                    child,
                    const SizedBox(width: 12),
                  ],
                )
              : Container())
          .toList(),
    );
  }
}
