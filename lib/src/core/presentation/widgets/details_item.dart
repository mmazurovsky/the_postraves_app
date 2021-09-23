import 'package:flutter/material.dart';
import '../../utils/my_text_styles.dart';

class DetailsItem extends StatelessWidget {
  final String title;
  final Widget body;
  const DetailsItem({
    Key? key,
    required this.title,
    required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: MyTextStyles.sectionTitle,
        ),
        SizedBox(height: 5),
        body
      ],
    );
  }
}
