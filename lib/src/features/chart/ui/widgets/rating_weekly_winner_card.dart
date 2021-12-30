import 'package:flutter/material.dart';
import 'package:the_postraves_package/constants/my_colors.dart';
import 'package:the_postraves_package/models/interfaces/data_interfaces.dart';

import '../../../../common/constants/my_constants.dart';
import '../../../../common/constants/my_text_styles.dart';
import '../../../../common/navigation/my_navigation.dart';
import '../../../../common/utils/screen_size.dart';
import '../../../../common/widgets/entity_presentation/followable_item.dart';
import '../../../../common/widgets/image/my_cached_network_image.dart';
import '../../../../common/widgets/spacers/my_horizontal_margin.dart';
import '../../../../common/widgets/spacers/my_horizontal_padding.dart';
import '../../../../common/widgets/spacers/my_spacers.dart';

class RatingWeeklyWinnerCard<T extends GeneralFollowableInterface>
    extends StatefulWidget {
  const RatingWeeklyWinnerCard({
    Key? key,
    required this.entity,
    required this.nomination,
    required this.nominationDescription,
  }) : super(key: key);
  final T entity;
  final String nomination;
  final String nominationDescription;

  @override
  _RatingWeeklyWinnerCardState<T> createState() =>
      _RatingWeeklyWinnerCardState<T>();
}

class _RatingWeeklyWinnerCardState<T extends GeneralFollowableInterface>
    extends State<RatingWeeklyWinnerCard<T>> {
  static late double widthAndHeightOfImage;

  @override
  void initState() {
    super.initState();
    widthAndHeightOfImage =
        ScreenSize.width - MyConstants.horizontalPaddingOrMargin * 2;
  }

  @override
  Widget build(BuildContext context) {
    return MyHorizontalMargin(
      child: Container(
        margin: const EdgeInsets.only(
          top: MyConstants.horizontalPaddingOrMargin,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(7),
          child: Column(
            children: [
              Stack(
                children: [
                  ShaderMask(
                    shaderCallback: (rect) {
                      return const LinearGradient(
                        begin: Alignment.center,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          MyColors.forEventCard,
                        ],
                      ).createShader(
                        Rect.fromLTRB(0, 0, rect.width, rect.height),
                      );
                    },
                    blendMode: BlendMode.srcOver,
                    child: SizedBox(
                      width: double.infinity,
                      height: widthAndHeightOfImage,
                      child: MyCachedNetworkImage(widget.entity.imageLink),
                    ),
                  ),
                  Positioned(
                    bottom: 17,
                    left: 0,
                    child: MyHorizontalPadding(
                      child: Container(
                        width: widthAndHeightOfImage -
                            MyConstants.horizontalPaddingOrMargin * 2,
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.nominationDescription,
                              style: MyTextStyles.ratingsWeeklyWinnerSubtitle,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const MySmallestSpacer(),
                            Text(
                              widget.nomination,
                              style: MyTextStyles.ratingsWeeklyWinnerTitle,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.only(
                  top: 10,
                  bottom: 20,
                ),
                decoration: const BoxDecoration(
                  color: MyColors.forEventCard,
                ),
                child: FollowableItem<T>(
                  key: ValueKey(widget.entity.id),
                  showWeeklyFollowers: true,
                  entity: widget.entity,
                  startingWidget: null,
                  onItemTap: (context, T entity, imageDimensions) =>
                      NavigatorFunctions.pushFollowable(
                    context: context,
                    followableData:
                        entity.convertToFollowableData(imageDimensions),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
