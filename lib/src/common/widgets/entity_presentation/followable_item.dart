import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:the_postraves_package/constants/my_colors.dart';
import 'package:the_postraves_package/models/interfaces/data_interfaces.dart';

import '../../constants/my_constants.dart';
import '../image/my_cached_network_image.dart';
import '../spacers/my_rating_entity_vertical_padding.dart';
import 'followable_item_data.dart';

class FollowableItem<T extends GeneralFollowableInterface>
    extends StatefulWidget {
  final T entity;
  final double horizontalPadding;
  final Function? onIconTap;
  final Function? onItemTap;
  final Widget? startingWidget;
  final bool showWeeklyFollowers;
  final String? hintText;

  const FollowableItem({
    Key? key,
    required this.entity,
    this.startingWidget,
    this.onItemTap,
    this.onIconTap,
    this.horizontalPadding = MyConstants.horizontalPaddingOrMargin,
    this.showWeeklyFollowers = false,
    this.hintText,
  }) : super(key: key);

  @override
  _FollowableItemState createState() => _FollowableItemState();
}

class _FollowableItemState<T extends GeneralFollowableInterface>
    extends State<FollowableItem<T>> {
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
        widget.onItemTap != null
            ? widget.onItemTap!(
                context,
                widget.entity,
                await _image.getImageDimensions(),
              )
            : {};
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
                child: FollowableItemData(
                  entity: widget.entity,
                  showWeeklyFollowers: widget.showWeeklyFollowers,
                  hintText: widget.hintText,
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
                  : widget.onItemTap != null
                      ? const Icon(
                          Ionicons.chevron_forward_outline,
                          size: 26,
                          color: MyColors.accent,
                        )
                      : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
