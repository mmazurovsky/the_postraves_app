import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:the_postraves_app/src/core/presentation/widgets/loading_container.dart';
import 'package:the_postraves_app/src/features/wiki/state/follow_cubit/follow_cubit.dart';
import 'package:the_postraves_app/src/features/wiki/ui/widgets/followable_util.dart';
import 'package:the_postraves_app/src/features/wiki/ui/widgets/wiki_subtitle.dart';
import 'package:the_postraves_app/src/features/wiki/ui/widgets/wiki_title.dart';
import 'package:the_postraves_app/src/models/dto/wiki_data_dto.dart';
import 'package:the_postraves_app/src/models/fulls/artist_full.dart';
import 'package:the_postraves_app/src/models/interfaces/data_interfaces.dart';

import '../../../../core/presentation/widgets/entity_presentation/rating_entity_list.dart';
import '../../../../core/presentation/widgets/my_horizontal_padding.dart';
import '../../../../core/presentation/widgets/section_divider.dart';
import '../../../../core/presentation/widgets/section_spacer.dart';
import '../../../../core/presentation/widgets/section_title.dart';
import '../../../../core/presentation/widgets/social_links_list.dart';
import '../../../../models/dto/image_dimensions.dart';
import '../../../../dependency_injection.dart';
import '../../../../models/enum/wiki_rating_type.dart';
import '../../../../models/shorts/event_short.dart';
import '../../../../models/shorts/unity_short.dart';
import '../../../../my_navigation.dart';
import '../../state/artist_cubit/artist_cubit.dart';
import '../widgets/column_of_custom_cards.dart';
import '../widgets/short_event_card_item.dart';
import '../widgets/slide_animation_wrapper.dart';
import '../widgets/wiki_expandable_text_description.dart';
import '../widgets/wiki_wide_bookmark_button.dart';
import 'wiki_canvas.dart';

class FollowableScreen<FollowableCubitGeneric extends Cubit,
    FollowCubitGeneric extends Cubit> extends StatelessWidget {
  final WikiDataDto _wikiDataDto;
  final Widget _contents;
  const FollowableScreen(
    this._wikiDataDto,
    this._contents, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => serviceLocator<FollowableCubitGeneric>(),
        ),
        BlocProvider(
          create: (context) => serviceLocator<FollowCubitGeneric>(),
        ),
      ],
      child: WikiCanvas(
        wikiDataDto: _wikiDataDto,
        wikiContent: _FollowableScreenContents<FollowCubitGeneric>(_wikiDataDto, _contents),
      ),
    );
  }
}

class _FollowableScreenContents<FollowCubitGeneric extends Cubit> extends StatefulWidget {
  final WikiDataDto _wikiDataDto;
  final Widget _contents;
  const _FollowableScreenContents(this._wikiDataDto, this._contents, {Key? key})
      : super(key: key);

  @override
  _FollowableScreenContentsState<FollowCubitGeneric> createState() =>
      _FollowableScreenContentsState<FollowCubitGeneric>();
}

class _FollowableScreenContentsState<FollowCubitGeneric extends Cubit> extends State<_FollowableScreenContents<FollowCubitGeneric>> {
  late int? _followers;

  @override
  void didChangeDependencies() {
    _followers = context.watch<FollowCubitGeneric>().state.followers;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        WikiSubtitle(
          entityType: widget._wikiDataDto.type,
          country: widget._wikiDataDto.country,
          overallFollowers: _followers,
        ),
        const SizedBox(height: 20),
        widget._contents,
      ],
    );
  }
}
