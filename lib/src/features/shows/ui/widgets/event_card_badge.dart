import 'package:flutter/material.dart';
import '../../../../core/utils/my_colors.dart';
import '../../../../core/utils/my_constants.dart';
import '../../../../core/utils/my_text_styles.dart';
import '../../../../core/utils/my_assets.dart';

class EventCardBadge extends StatelessWidget {
  final String? imagePath;
  final String textValue;
  const EventCardBadge({
    Key? key,
    this.imagePath,
    required this.textValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: MyColors.forEventCardBadge,
        borderRadius: BorderRadius.circular(7),
      ),
      alignment: Alignment.center,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
        child: Row(
          children: [
            imagePath != null
                ? Row(
                    children: [
                      Image.asset(
                        imagePath!,
                        width: MyConstants.diamondWidth,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  )
                : Container(),
            Text(
              textValue.toString(),
              style: MyTextStyles.cardEventBadge,
            )
          ],
        ),
      ),
    );
  }
}
