import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import '../../../../models/interfaces/data_interfaces.dart';
import '../../../../core/utils/my_constants.dart';
import '../../../../core/utils/my_colors.dart';
import '../../../../core/presentation/widgets/my_horizontal_margin.dart';
import 'rating_list_item.dart';

class RatingCardWithListOfItems<T extends FollowableInterface>
    extends StatelessWidget {
  final String imagePath;
  final List<TextSpan> titleTextSpans;
  final List<T> entities;
  const RatingCardWithListOfItems({
    Key? key,
    required this.imagePath,
    required this.titleTextSpans,
    required this.entities,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int modelCount = 0;

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
              Column(
                children: [
                  ...entities.take(5).map(
                    (entity) {
                      modelCount += 1;
                      return RatingListItem<T>(
                        entity: entity,
                        chartIndex: modelCount,
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 14,
              ),
              Align(
                alignment: Alignment.center,
                child: InkWell(
                  // todo
                  onTap: () {},
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
