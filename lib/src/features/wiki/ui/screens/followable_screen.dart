import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/wiki_subtitle.dart';
import '../../../../models/dto/wiki_data_dto.dart';

import '../../../../dependency_injection.dart';
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
        wikiContent: _FollowableScreenContents<FollowCubitGeneric>(
            _wikiDataDto, _contents),
      ),
    );
  }
}

class _FollowableScreenContents<FollowCubitGeneric extends Cubit>
    extends StatefulWidget {
  final WikiDataDto _wikiDataDto;
  final Widget _contents;
  const _FollowableScreenContents(this._wikiDataDto, this._contents, {Key? key})
      : super(key: key);

  @override
  _FollowableScreenContentsState<FollowCubitGeneric> createState() =>
      _FollowableScreenContentsState<FollowCubitGeneric>();
}

class _FollowableScreenContentsState<FollowCubitGeneric extends Cubit>
    extends State<_FollowableScreenContents<FollowCubitGeneric>> {
  late int? _followers;
  late bool? _isFollowed;

  @override
  void didChangeDependencies() {
    _followers = context.watch<FollowCubitGeneric>().state.followers;
    _isFollowed = context.watch<FollowCubitGeneric>().state.isFollowed;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 5),
        WikiSubtitle(
          entityType: widget._wikiDataDto.type,
          country: widget._wikiDataDto.country,
          overallFollowers: _followers,
          isFollowed: _isFollowed,
        ),
        widget._contents,
      ],
    );
  }
}
