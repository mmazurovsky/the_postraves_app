import 'package:flutter/material.dart';
import 'package:the_postraves_package/dto/followable_type.dart';
import 'package:the_postraves_package/models/geo/country.dart';

import '../../../../common/constants/my_text_styles.dart';
import '../../../../common/utils/followable_type_utils.dart';
import '../../../../common/widgets/other/row_of_widgets.dart';
import '../../../../common/widgets/spacers/my_horizontal_padding.dart';

class WikiSubtitle extends StatelessWidget {
  final FollowableType entityType;
  final Country? country;
  const WikiSubtitle({
    Key? key,
    required this.entityType,
    this.country,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyHorizontalPadding(
      child: RowOfWidgets(
        children: [
          Text(
            FollowableTypeUtils.getTranslationSingularForType(entityType),
            style: MyTextStyles.sectionTitle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          entityType != FollowableType.EVENT && country != null
              ? Text(
                  country!.emojiCode,
                  style: MyTextStyles.countryFlag,
                )
              : null,
          entityType != FollowableType.EVENT && country != null
              ? Text(
                  country!.localName,
                  style: MyTextStyles.sectionTitle,
                )
              : null,
        ],
      ),
    );
  }
}
