import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:the_postraves_package/constants/my_colors.dart';
import 'package:the_postraves_package/dto/image_dimensions.dart';
import 'package:the_postraves_package/models/interfaces/data_interfaces.dart';
import '../../../../common/constants/my_constants.dart';
import '../../../../common/widgets/entity_presentation/followable_list.dart';
import '../../../../common/widgets/spacers/my_horizontal_margin.dart';
import '../../../../common/navigation/my_navigation.dart';

class RatingCardWithListOfItems<T extends GeneralFollowableInterface>
    extends StatelessWidget {
  final String imagePath;
  final List<TextSpan> titleTextSpans;
  final List<T> topFollowables;
  final bool showWeeklyFollowers;
  final void Function() onTapDetails;
  const RatingCardWithListOfItems({
    Key? key,
    required this.imagePath,
    required this.titleTextSpans,
    required this.topFollowables,
    required this.onTapDetails,
    this.showWeeklyFollowers = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyHorizontalMargin(
      child: Container(
        margin: const EdgeInsets.only(
          top: 20,
        ),
        child: Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            color: MyColors.forEventCard,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                      // Note: Styles for TextSpans must be explicitly defined.
                      // Child text spans will inherit styles from parent
                      children: titleTextSpans,
                    ),
                  ),
                  Image.asset(
                    imagePath,
                    width: 23,
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              const Divider(
                color: MyColors.forDividers,
                thickness: MyConstants.dividerThickness,
                height: 1,
              ),
              const SizedBox(
                height: 15,
              ),
              FollowableList(
                horizontalPaddingOfItems: 0,
                showWeeklyFollowers: showWeeklyFollowers,
                followables: topFollowables.take(5).toList(),
                onItemTap:
                    (context, T entity, ImageDimensions? imageDimensions) =>
                        NavigatorFunctions.pushFollowable(
                  context: context,
                  followableData:
                      entity.convertToFollowableData(imageDimensions),
                ),
              ),
              const SizedBox(
                height: 14,
              ),
              Align(
                alignment: Alignment.center,
                child: InkWell(
                  onTap: () => onTapDetails(),
                  child: const Icon(
                    Ionicons.chevron_down,
                    color: MyColors.accent,
                    size: 26,
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
