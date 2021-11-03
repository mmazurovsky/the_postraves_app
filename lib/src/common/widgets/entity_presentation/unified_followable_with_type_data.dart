import 'package:flutter/material.dart';
import 'package:the_postraves_app/src/common/utils/followable_type_utils.dart';
import 'package:the_postraves_package/models/interfaces/data_interfaces.dart';
import '../../constants/my_text_styles.dart';

class UnifiedFollowableWithTypeData<T extends FollowableInterfaceWithType> extends StatelessWidget {
  final T followable;

  const UnifiedFollowableWithTypeData({
    Key? key,
    required this.followable,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: Text(
                followable.name,
                style: MyTextStyles.shortEntityName,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Flexible(
          child: Text(
            FollowableTypeUtils.getTranslationSingularForType(followable.type),
            style: MyTextStyles.shortEntityOverallRating,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
      ],
    );
  }
}
