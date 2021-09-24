import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../state/cubit/search_cubit.dart';
import '../../../../models/related_to_search/unified_search_model.dart';
import '../../../../core/presentation/widgets/entity_presentation/followable_list.dart';
import '../../../../core/utils/image_dimensions.dart';
import '../../../../my_navigation.dart';
import '../../../../core/presentation/widgets/section_divider.dart';
import '../../../../core/presentation/widgets/section_spacer.dart';
import '../../../../core/presentation/widgets/section_title.dart';

class PreviousSearchResultsBlock extends StatelessWidget {
  final String resultsName;
  final List<UnifiedSearchModel> results;
  final Function deleteFunction;

  const PreviousSearchResultsBlock({
    Key? key,
    required this.resultsName,
    required this.results,
    required this.deleteFunction,
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
        FollowableList(
          followables: results,
          onItemTap:
              (context, UnifiedSearchModel entity, ImageDimensions imageDimensions) {
            NavigatorFunctions.pushSearchEntity(
                context, entity, imageDimensions);
            BlocProvider.of<SearchCubit>(context).updateSearchRecord(entity);
          },
          onIconTap: deleteFunction,
        ),
        SectionSpacer(),
        SectionDivider(needHorizontalMargin: true),
      ],
    );
  }
}
