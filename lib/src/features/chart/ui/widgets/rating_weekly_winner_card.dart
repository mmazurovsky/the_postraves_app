import 'package:flutter/material.dart';
import '../../../../models/interfaces/data_interfaces.dart';
import '../../../../core/presentation/widgets/entity_presentation/rating_entity_list_item.dart';
import '../../../../core/presentation/widgets/my_cached_network_image.dart';
import '../../../../core/utils/my_colors.dart';
import '../../../../core/utils/my_text_styles.dart';
import '../../../../core/utils/my_constants.dart';
import '../../../../core/presentation/widgets/my_horizontal_margin.dart';
import '../../../../core/presentation/widgets/my_horizontal_padding.dart';
import '../../../../my_navigation.dart';

class RatingWeeklyWinnerCard<T extends FollowableInterface>
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

class _RatingWeeklyWinnerCardState<T extends FollowableInterface>
    extends State<RatingWeeklyWinnerCard<T>> {
  static late double widthAndHeightOfImage;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    widthAndHeightOfImage = MediaQuery.of(context).size.width -
        MyConstants.horizontalPaddingOrMargin * 2;
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
                  top: 15,
                  bottom: 20,
                ),
                decoration: const BoxDecoration(
                  color: MyColors.forEventCard,
                ),
                child: RatingEntityListItem<T>(
                  entity: widget.entity,
                  startingWidget: null,
                  onItemTap: (context, entity, imageDimensions) =>
                      NavigatorFunctions.pushRatingEntity<T>(
                          context, entity, imageDimensions),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
