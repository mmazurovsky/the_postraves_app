import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import '../../../../models/interfaces/data_interfaces.dart';
import 'followable_data.dart';
import '../../../utils/image_dimensions.dart';
import '../../../utils/my_colors.dart';
import '../../../utils/my_constants.dart';

import '../my_cached_network_image.dart';
import '../my_rating_entity_vertical_padding.dart';

class FollowableListItem<T extends SimpleFollowableInterface> extends StatefulWidget {
  final T followable;
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
    _image = MyCachedNetworkImage(widget.followable.imageLink);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: MyColors.forButtonHighlight,
      onTap: () async {
        widget.onItemTap(
          context,
          widget.followable,
          await ImageDimensions.getImageInfo(_image),
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
                  followable: widget.followable,
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
