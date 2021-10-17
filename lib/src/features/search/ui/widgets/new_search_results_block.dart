import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../state/cubit/search_cubit.dart';
import '../../../../models/interfaces/data_interfaces.dart';
import '../../../../core/presentation/widgets/entity_presentation/followable_list.dart';
import '../../../../models/dto/image_dimensions.dart';
import '../../../../my_navigation.dart';
import '../../../../core/presentation/widgets/section_divider.dart';
import '../../../../core/presentation/widgets/my_spacers.dart';
import '../../../../core/presentation/widgets/section_title.dart';

class NewSearchResultsBlock<T extends GeneralFollowableInterface>
    extends StatelessWidget {
  final String resultsName;
  final List<T> results;

  const NewSearchResultsBlock({
    Key? key,
    required this.resultsName,
    required this.results,
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
        SizedBox(height: 10),
        FollowableList<T>(
          followables: results,
          onItemTap: <T extends GeneralFollowableInterface>(context, T entity,
              ImageDimensions? imageDimensions) {
            NavigatorFunctions.pushFollowable(
              context: context,
              wikiDataDto: entity.convertToWikiDataDto(imageDimensions),
            );
            BlocProvider.of<SearchCubit>(context).saveSearchRecord(entity);
          },
        ),
        MyBigSpacer(),
        SectionDivider(needHorizontalMargin: true),
      ],
    );
  }
}
