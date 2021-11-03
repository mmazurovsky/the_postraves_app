import 'package:flutter/material.dart';
import '../../constants/my_text_styles.dart';
import '../spacers/my_horizontal_padding.dart';


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
