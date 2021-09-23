import 'package:flutter/material.dart';
import '../../utils/my_text_styles.dart';
import 'my_horizontal_padding.dart';

class SectionTitle extends StatelessWidget {
  final String sectionTitle;

  const SectionTitle({
    Key? key,
    required this.sectionTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyHorizontalPadding(
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          sectionTitle,
          style: MyTextStyles.sectionTitle,
        ),
      ),
    );
  }
}
