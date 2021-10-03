import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import '../../../../models/interfaces/data_interfaces.dart';
import '../../../utils/image_dimensions.dart';
import '../../../utils/my_colors.dart';
import '../../../utils/my_constants.dart';
import '../my_cached_network_image.dart';
import '../my_rating_entity_vertical_padding.dart';
import 'rating_entity_data.dart';

class RatingEntityListItem<T extends FollowableInterface>
    extends StatefulWidget {
  final T entity;
  final double horizontalPadding;
  final Function? onIconTap;
  final Function onItemTap;
  final Widget? startingWidget;

  const RatingEntityListItem({
    Key? key,
    required this.entity,
    this.startingWidget,
    required this.onItemTap,
    this.onIconTap,
    this.horizontalPadding = MyConstants.horizontalPaddingOrMargin,
  }) : super(key: key);

  @override
  _RatingEntityListItemState createState() => _RatingEntityListItemState();
}

class _RatingEntityListItemState<T extends FollowableInterface>
    extends State<RatingEntityListItem<T>> {
  late MyCachedNetworkImage _image;

  @override
  void initState() {
    super.initState();
    _image = MyCachedNetworkImage(widget.entity.imageLink);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: MyColors.forButtonHighlight,
      onTap: () async {
        widget.onItemTap(
          context,
          widget.entity,
          await ImageDimensions.getImageDimensions(_image),
        );
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: widget.horizontalPadding),
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
                child: RatingEntityData(
                  entity: widget.entity,
                ),
              ),
              widget.onIconTap != null
                  ? InkWell(
                      onTap: () => widget.onIconTap!(widget.entity),
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
