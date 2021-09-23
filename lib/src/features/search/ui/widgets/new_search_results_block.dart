import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../state/cubit/search_cubit.dart';
import '../../../../models/interfaces/data_interfaces.dart';
import '../../../../core/presentation/widgets/entity_presentation/rating_entity_list.dart';
import '../../../../core/utils/image_dimensions.dart';
import '../../../../my_navigation.dart';
import '../../../../core/presentation/widgets/section_divider.dart';
import '../../../../core/presentation/widgets/section_spacer.dart';
import '../../../../core/presentation/widgets/section_title.dart';

class NewSearchResultsBlock<T extends FollowableInterface>
    extends StatelessWidget {
  final String resultsName;
  final List<T> results;

  NewSearchResultsBlock({
    Key? key,
    required this.resultsName,
    required this.results,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionSpacer(),
        SectionTitle(
          sectionTitle: resultsName,
        ),
        SizedBox(height: 10),
        RatingEntityList<T>(
          entityList: results,
          onItemTap: <T extends FollowableInterface>(context, T entity,
              ImageDimensions imageDimensions) {
            NavigatorFunctions.pushRatingEntity(
                context, entity, imageDimensions);
            BlocProvider.of<SearchCubit>(context).saveSearchRecord(entity);
          },
        ),
        SectionSpacer(),
        SectionDivider(needHorizontalMargin: true),
      ],
    );
  }
}
