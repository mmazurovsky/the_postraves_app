import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_postraves_app/src/features/search/data/search_unified_model_list.dart';
import '../../state/cubit/search_cubit.dart';
import '../../../../models/related_to_search/unified_search_model.dart';
import '../../../../models/dto/image_dimensions.dart';
import '../../../../my_navigation.dart';
import '../../../../core/presentation/widgets/my_spacers.dart';
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
        MyBigSpacer(),
        SectionTitle(
          sectionTitle: resultsName,
        ),
        const SizedBox(height: 10),
        SearchUnifiedModelList(
          followables: results,
          onItemTap: (context, UnifiedSearchModel entity,
              ImageDimensions? imageDimensions) {
            NavigatorFunctions.pushFollowable(
              context: context,
              wikiDataDto:
                  entity.wikiDataDto.copyWith(imageDimensions: imageDimensions),
            );
            BlocProvider.of<SearchCubit>(context).updateSearchRecord(entity);
          },
          onIconTap: deleteFunction,
        ),
        MyBigSpacer(),
      ],
    );
  }
}
