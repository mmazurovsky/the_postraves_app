import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_postraves_app/src/data/model/unified_search_model.dart';
import 'package:the_postraves_package/dto/image_dimensions.dart';
import '../../../../common/widgets/spacers/my_spacers.dart';
import '../../../../common/widgets/other/section_title.dart';
import '../../../../my_navigation.dart';
import '../../data/search_unified_model_list.dart';
import '../../state/cubit/search_cubit.dart';

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
              followableData: entity.followableData.copyWith(
                  imageDimensions: imageDimensions),
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
