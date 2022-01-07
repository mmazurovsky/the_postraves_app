import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_postraves_package/dto/followable_params.dart';
import '../../state/followable_change_notifier.dart';
import 'package:the_postraves_package/dto/followable_data.dart';
import '../../../../dependency_injection.dart';
import '../widgets/wiki_subtitle.dart';
import 'wiki_canvas.dart';

class FollowableScreen<FollowableCubitGeneric extends Cubit>
    extends StatelessWidget {
  final FollowableData _followableData;
  final Widget _contents;
  const FollowableScreen(
    this._followableData,
    this._contents, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final newFollowableCubit = serviceLocator<FollowableCubitGeneric>();
        return newFollowableCubit;
      },
      child: WikiCanvas(
        followableData: _followableData,
        wikiContent: _FollowableScreenContents<FollowableCubitGeneric>(
            _followableData, _contents),
      ),
    );
  }
}

class _FollowableScreenContents<FollowCubitGeneric extends Cubit>
    extends StatelessWidget {
  final FollowableData _followableData;
  final Widget _contents;
  const _FollowableScreenContents(this._followableData, this._contents,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final followableVariables = context.watch<FollowableChangeNotifier>().get(
          FollowableId(
            id: _followableData.id,
            type: _followableData.type,
          ),
        );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 5),
        WikiSubtitle(
          entityType: _followableData.type,
          country: _followableData.country,
          overallFollowers: followableVariables?.overallFollowers,
          weeklyFollowers: followableVariables?.weeklyFollowers,
          isFollowed: followableVariables?.isFollowed,
        ),
        _contents,
      ],
    );
  }
}
