import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:the_postraves_app/src/common/data/unified_search_model.dart';
import 'package:the_postraves_package/constants/my_colors.dart';
import '../../../common/constants/my_constants.dart';
import '../../../common/widgets/entity_presentation/unified_followable_with_type_data.dart';
import '../../../common/widgets/spacers/my_rating_entity_vertical_padding.dart';
import '../../../common/widgets/image/my_cached_network_image.dart';

class SearchUnifiedModelListItem extends StatefulWidget {
  final UnifiedSearchModel followable;
  final double horizontalPadding;
  final Function? onIconTap;
  final Function onItemTap;
  final Widget? startingWidget;

  const SearchUnifiedModelListItem({
    Key? key,
    required this.followable,
    this.startingWidget,
    required this.onItemTap,
    this.onIconTap,
    this.horizontalPadding = MyConstants.horizontalPaddingOrMargin,
  }) : super(key: key);

  @override
  _SearchUnifiedModelListItemState createState() =>
      _SearchUnifiedModelListItemState();
}

class _SearchUnifiedModelListItemState
    extends State<SearchUnifiedModelListItem> {
  late MyCachedNetworkImage _image;

  @override
  void initState() {
    super.initState();
    _image = MyCachedNetworkImage(widget.followable.followableData.imageLink);
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
                child: UnifiedFollowableWithTypeData(
                  followable: widget.followable.followableData,
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
