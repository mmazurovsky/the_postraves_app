import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_postraves_package/dto/followable_data.dart';
import '../../../../dependency_injection.dart';
import '../widgets/wiki_subtitle.dart';
import 'wiki_canvas.dart';

class FollowableScreen<FollowableCubitGeneric extends Cubit,
    FollowCubitGeneric extends Cubit> extends StatelessWidget {
  final FollowableData _followableData;
  final Widget _contents;
  const FollowableScreen(
    this._followableData,
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
        followableData: _followableData,
        wikiContent: _FollowableScreenContents<FollowCubitGeneric>(
            _followableData, _contents),
      ),
    );
  }
}

class _FollowableScreenContents<FollowCubitGeneric extends Cubit>
    extends StatefulWidget {
  final FollowableData _followableData;
  final Widget _contents;
  const _FollowableScreenContents(this._followableData, this._contents,
      {Key? key})
      : super(key: key);

  @override
  _FollowableScreenContentsState<FollowCubitGeneric> createState() =>
      _FollowableScreenContentsState<FollowCubitGeneric>();
}

class _FollowableScreenContentsState<FollowCubitGeneric extends Cubit>
    extends State<_FollowableScreenContents<FollowCubitGeneric>> {
  late int? _overallFollowers;
  late int? _weeklyFollowers;
  late bool? _isFollowed;

  @override
  void didChangeDependencies() {
    _overallFollowers =
        context.watch<FollowCubitGeneric>().state.overallFollowers;
    _weeklyFollowers =
        context.watch<FollowCubitGeneric>().state.weeklyFollowers;
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
          entityType: widget._followableData.type,
          country: widget._followableData.country,
          overallFollowers: _overallFollowers,
          weeklyFollowers: _weeklyFollowers,
          isFollowed: _isFollowed,
        ),
        widget._contents,
      ],
    );
  }
}
