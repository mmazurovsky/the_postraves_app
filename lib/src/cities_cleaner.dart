import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/authentication/state/cubit/authentication_cubit.dart';
import 'core/presentation/widgets/loading_screen.dart';
import 'core/repository/city_repository.dart';

class CitiesCleaner extends StatefulWidget {
  final Widget child;
  final CityRepository cityRepository;

  const CitiesCleaner({
    Key? key,
    required this.child,
    required this.cityRepository,
  }) : super(key: key);

  @override
  _CitiesCleanerState createState() => _CitiesCleanerState();
}

class _CitiesCleanerState extends State<CitiesCleaner> {
  // todo change this manually for testing
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
                return const LoadingScreen();
              }
            })
        : widget.child;
  }
}
