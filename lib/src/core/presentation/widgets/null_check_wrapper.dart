import 'package:flutter/material.dart';

class NullCheckWrapper extends StatelessWidget {
  final List<Widget> children;
  final dynamic toBeChecked;
  const NullCheckWrapper({
    Key? key,
    required this.toBeChecked,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return toBeChecked != null
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: children,
          )
        : Container();
  }
}
