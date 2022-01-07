import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/src/provider.dart';
import 'package:the_postraves_app/src/features/followable/state/followable_change_notifier.dart';
import 'package:the_postraves_package/constants/my_colors.dart';
import 'package:the_postraves_package/dto/followable_params.dart';
import 'package:the_postraves_package/models/interfaces/data_interfaces.dart';
import '../../constants/my_text_styles.dart';
import '../../utils/formatting_utils.dart';

class FollowableItemData<T extends GeneralFollowableInterface>
    extends StatefulWidget {
  final T entity;
  final bool showWeeklyFollowers;
  final String? hintText;

  const FollowableItemData({
    Key? key,
    required this.entity,
    this.showWeeklyFollowers = false,
    this.hintText,
  }) : super(key: key);

  @override
  State<FollowableItemData<T>> createState() => _FollowableItemDataState<T>();
}

class _FollowableItemDataState<T extends GeneralFollowableInterface>
    extends State<FollowableItemData<T>> {
  FollowableVariables? _followableVariables;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final watched = context
        .watch<FollowableChangeNotifier>()
        .get(widget.entity.followableId);
    if (watched != null) {
      if (_followableVariables != watched) {
        _followableVariables = watched;
      }
    } else {
      _followableVariables = widget.entity.followableVariables;
    }
  }

  TextStyle _resolveFollowersTextStyle() {
    if (widget.showWeeklyFollowers) {
      return FormattingUtils.resolveTextStyleForWeeklyFollowers(
          _followableVariables!.weeklyFollowers);
    } else {
      if (_followableVariables!.isFollowed) {
        return MyTextStyles.shortEntityRatingAccent;
      } else {
        return MyTextStyles.shortEntityOverallRating;
      }
    }
  }

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
            widget.entity.country != null
                ? Row(
                    children: [
                      Text(
                        widget.entity.country!.emojiCode,
                        style: MyTextStyles.countryFlag,
                      ),
                      const SizedBox(width: 8),
                    ],
                  )
                : Container(),
            Flexible(
              child: Text(
                widget.entity.name,
                style: MyTextStyles.shortEntityName,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
          ],
        ),
        Column(
          children: [
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  _followableVariables!.isFollowed
                      ? Ionicons.heart
                      : Ionicons.heart_outline,
                  size: 19,
                  color: _followableVariables!.isFollowed
                      ? MyColors.accent
                      : MyColors.forInactiveStuff,
                ),
                const SizedBox(width: 8),
                Text(
                  widget.showWeeklyFollowers
                      ? FormattingUtils.resolveTextForWeeklyFollowers(
                          _followableVariables!.weeklyFollowers)
                      : _followableVariables!.overallFollowers.toString(),
                  style: _resolveFollowersTextStyle(),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
