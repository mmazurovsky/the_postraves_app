import 'package:flutter/material.dart';
import '../../utils/my_text_styles.dart';

class EventTab extends StatelessWidget {
  final String tabName;

  const EventTab({
    Key? key,
    required this.tabName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Text(
        tabName,
        style: MyTextStyles.tab,
      ),
    );
  }
}
