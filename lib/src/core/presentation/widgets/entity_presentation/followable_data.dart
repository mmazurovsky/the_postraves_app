import 'package:flutter/material.dart';
import 'package:the_postraves_app/src/models/related_to_search/unified_search_model.dart';
import '../../../../models/enum/wiki_rating_type.dart';
import '../../../../models/interfaces/data_interfaces.dart';
import '../../../utils/my_text_styles.dart';

class FollowableData<T extends FollowableInterfaceWithType> extends StatelessWidget {
  final T followable;

  const FollowableData({
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
            followable.type.getNameSingular(context),
            style: MyTextStyles.shortEntityOverallRating,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
      ],
    );
  }
}
