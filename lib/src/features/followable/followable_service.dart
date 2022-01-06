import 'package:the_postraves_app/src/features/chart/state/cubit/charts_cubit.dart';
import 'package:the_postraves_app/src/features/followable/state/artist_cubit/artist_cubit.dart';
import 'package:the_postraves_app/src/features/followable/state/event_cubit/event_cubit.dart';
import 'package:the_postraves_app/src/features/followable/state/place_cubit/place_cubit.dart';
import 'package:the_postraves_app/src/features/followable/state/unity_cubit/unity_cubit.dart';
import 'package:the_postraves_app/src/features/shows/state/shows_cubit/shows_cubit.dart';
import 'package:the_postraves_package/models/interfaces/data_interfaces.dart';

abstract class FollowableService<
    FULLFOLLOWABLE extends GeneralFollowableInterface> {
  void toggleFollow(FULLFOLLOWABLE followable);
}

class FollowableServiceImpl<FULLFOLLOWABLE extends GeneralFollowableInterface>
    implements FollowableService<FULLFOLLOWABLE> {
  final ShowsCubit _showsCubit;
  final ChartsCubit _chartsCubit;
  List<PlaceCubit> _placeCubitList = [];
  List<EventCubit> _eventCubitList = [];
  List<ArtistCubit> _artistCubitList = [];
  List<UnityCubit> _unityCubitList = [];

  FollowableServiceImpl(this._showsCubit, this._chartsCubit);

  @override
  void toggleFollow(FULLFOLLOWABLE followable) {}
}
