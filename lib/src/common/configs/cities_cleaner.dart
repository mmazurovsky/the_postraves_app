import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../authentication/state/cubit/authentication_cubit.dart';
import '../geo_repository/city_local_repository.dart';
import '../widgets/other/loading_container.dart';


class CitiesCleaner extends StatefulWidget {
  final Widget child;
  final CityLocalRepository cityRepository;

  const CitiesCleaner({
    Key? key,
    required this.child,
    required this.cityRepository,
  }) : super(key: key);

  @override
  _CitiesCleanerState createState() => _CitiesCleanerState();
}

class _CitiesCleanerState extends State<CitiesCleaner> {
  //* change this manually for testing
  final bool _toClean = false;

  @override
  void initState() {
    super.initState();
    if (_toClean) {
      BlocProvider.of<AuthenticationCubit>(context).signOut();
    }
  }

  @override
  Widget build(BuildContext context) {
    return _toClean
        ? FutureBuilder(
            future: Future.wait([
              widget.cityRepository.removeCurrentCityFromLocal(),
              widget.cityRepository.removeCitiesFromLocal(),
            ]),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return widget.child;
              } else {
                return const LoadingContainer();
              }
            })
        : widget.child;
  }
}
