import 'package:flutter/widgets.dart';
import 'package:the_postraves_app/src/core/presentation/widgets/entity_presentation/rating_entity_list.dart';
import 'package:the_postraves_app/src/core/presentation/widgets/my_spacers.dart';
import 'package:the_postraves_app/src/core/presentation/widgets/section_divider.dart';
import 'package:the_postraves_app/src/core/presentation/widgets/section_title.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:the_postraves_app/src/models/dto/image_dimensions.dart';
import 'package:the_postraves_app/src/models/interfaces/data_interfaces.dart';

import '../../../../my_navigation.dart';

class FollowableListSection<T extends GeneralFollowableInterface>
    extends StatelessWidget {
  final String _title;
  final List<T> _followables;
  final Widget? leadingWidget;
  const FollowableListSection(this._title, this._followables,
      {this.leadingWidget, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _followables.isNotEmpty
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const MyBigSpacer(),
              const SectionDivider(needHorizontalMargin: true),
              const MyMediumPlusSpacer(),
              SectionTitle(sectionTitle: _title),
              const MySmallSpacer(),
              leadingWidget ?? Container(),
              RatingEntityList(
                entityList: _followables,
                onItemTap: (BuildContext context, T entity,
                        ImageDimensions? imageDimensions) =>
                    NavigatorFunctions.pushFollowable(
                  context: context,
                  wikiDataDto: entity.convertToWikiDataDto(imageDimensions),
                ),
              ),
            ],
          )
        : Container();
  }
}
