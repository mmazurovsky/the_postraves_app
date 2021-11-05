import 'package:flutter/material.dart';
import '../../../../common/constants/my_text_styles.dart';
import '../../../../common/widgets/spacers/my_horizontal_padding.dart';

class WikiTitle extends StatelessWidget {
  const WikiTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return MyHorizontalPadding(
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: MyTextStyles.wikiTitle,
        ),
      ),
    );
  }
}
