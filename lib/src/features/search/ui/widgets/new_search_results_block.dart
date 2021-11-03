import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_postraves_package/dto/image_dimensions.dart';
import 'package:the_postraves_package/models/interfaces/data_interfaces.dart';
import '../../../../common/widgets/entity_presentation/followable_list.dart';
import '../../../../common/widgets/other/section_title.dart';
import '../../../../common/widgets/spacers/my_spacers.dart';
import '../../../../common/widgets/spacers/section_divider.dart';
import '../../../../my_navigation.dart';
import '../../state/cubit/search_cubit.dart';

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
              followableData: entity.convertToFollowableData(imageDimensions),
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
