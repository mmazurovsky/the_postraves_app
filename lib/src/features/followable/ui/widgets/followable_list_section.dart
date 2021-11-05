import 'package:flutter/widgets.dart';
import 'package:the_postraves_package/dto/image_dimensions.dart';
import 'package:the_postraves_package/models/interfaces/data_interfaces.dart';
import '../../../../common/widgets/entity_presentation/followable_list.dart';
import '../../../../common/widgets/other/section_title.dart';
import '../../../../common/widgets/spacers/my_spacers.dart';
import '../../../../common/widgets/spacers/section_divider.dart';
import '../../../../common/navigation/my_navigation.dart';

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
              FollowableList(
                followables: _followables,
                onItemTap: (BuildContext context, T entity,
                        ImageDimensions? imageDimensions) =>
                    NavigatorFunctions.pushFollowable(
                  context: context,
                  followableData:
                      entity.convertToFollowableData(imageDimensions),
                ),
              ),
            ],
          )
        : Container();
  }
}
