import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import '../../../../models/related_to_search/unified_search_model.dart';
import '../../../../models/interfaces/data_interfaces.dart';
import 'followable_data.dart';
import '../../../../models/dto/image_dimensions.dart';
import '../../../utils/my_colors.dart';
import '../../../utils/my_constants.dart';

import '../my_cached_network_image.dart';
import '../my_rating_entity_vertical_padding.dart';

class FollowableListItem extends StatefulWidget {
  final UnifiedSearchModel followable;
  final double horizontalPadding;
  final Function? onIconTap;
  final Function onItemTap;
  final Widget? startingWidget;

  const FollowableListItem({
    Key? key,
    required this.followable,
    this.startingWidget,
    required this.onItemTap,
    this.onIconTap,
    this.horizontalPadding = MyConstants.horizontalPaddingOrMargin,
  }) : super(key: key);

  @override
  _FollowableListItemState createState() => _FollowableListItemState();
}

class _FollowableListItemState extends State<FollowableListItem> {
  late MyCachedNetworkImage _image;

  @override
  void initState() {
    super.initState();
    _image = MyCachedNetworkImage(widget.followable.wikiDataDto.imageLink);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: MyColors.forButtonHighlight,
      onTap: () async {
        widget.onItemTap(
          context,
          widget.followable,
          await _image.getImageDimensions(),
        );
      },
      child: Padding(
        padding: 
            EdgeInsets.symmetric(horizontal: widget.horizontalPadding),
        child: MyRatingEntityVerticalPadding(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              widget.startingWidget == null
                  ? Container()
                  : widget.startingWidget!,
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: _image,
                ),
              ),
              const SizedBox(
                width: 18,
              ),
              Expanded(
                child: FollowableData(
                  followable: widget.followable.wikiDataDto,
                ),
              ),
              widget.onIconTap != null
                  ? InkWell(
                      onTap: () => widget.onIconTap!(widget.followable),
                      child: const Icon(
                        Icons.close,
                        color: Colors.grey,
                        size: 26,
                      ),
                    )
                  : const Icon(
                      Ionicons.chevron_forward_outline,
                      size: 26,
                      color: MyColors.accent,
                    )
            ],
          ),
        ),
      ),
    );
  }
}
