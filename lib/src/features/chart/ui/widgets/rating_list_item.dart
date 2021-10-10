import 'package:flutter/material.dart';
import '../../../../models/interfaces/data_interfaces.dart';
import '../../../../core/presentation/widgets/entity_presentation/rating_entity_list_item.dart';
import '../../../../models/dto/image_dimensions.dart';
import '../../../../my_navigation.dart';

class RatingListItem<T extends GeneralFollowableInterface> extends StatelessWidget {
  const RatingListItem({
    Key? key,
    required this.entity,
    required this.chartIndex,
  }) : super(key: key);
  final T entity;
  final int chartIndex;

  @override
  Widget build(BuildContext context) {
    return RatingEntityListItem<T>(
      entity: entity,
      horizontalPadding: 0,
      onItemTap: (context, T entity, ImageDimensions? imageDimensions) =>
          NavigatorFunctions.pushFollowable(
        context: context,
        wikiDataDto: entity.convertToWikiDataDto(imageDimensions),
      ),
    );
  }
}
