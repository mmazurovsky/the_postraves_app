import 'package:flutter/material.dart';

class ColumnOfCustomCards<T> extends StatelessWidget {
  const ColumnOfCustomCards({
    Key? key,
    required this.entities,
    required this.buildCard,
  }) : super(key: key);

  final List<T> entities;
  final Widget Function(T) buildCard;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: entities.map((entity) => buildCard(entity)).toList(),
    );
  }
}
