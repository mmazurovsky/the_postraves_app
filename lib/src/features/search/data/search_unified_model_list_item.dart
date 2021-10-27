import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import '../../../core/presentation/widgets/my_cached_network_image.dart';
import '../../../core/presentation/widgets/my_rating_entity_vertical_padding.dart';
import '../../../core/utils/my_colors.dart';
import '../../../core/utils/my_constants.dart';
import '../../../models/related_to_search/unified_search_model.dart';
import '../../../core/presentation/widgets/entity_presentation/unified_followable_with_type_data.dart';

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
  _SearchUnifiedModelListItemState createState() => _SearchUnifiedModelListItemState();
}

class _SearchUnifiedModelListItemState extends State<SearchUnifiedModelListItem> {
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
                child: UnifiedFollowableWithTypeData(
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
