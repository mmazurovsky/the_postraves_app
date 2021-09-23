import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/authentication/state/cubit/authentication_cubit.dart';
import '../../../../core/presentation/widgets/loading_screen.dart';
import 'sign_in_methods_screen.dart';
import '../../../../my_navigation.dart';

import '../../../../dependency_injection.dart';
import 'create_user_profile_screen.dart';

class AuthOnActionScreenResolver extends StatelessWidget {
  AuthOnActionScreenResolver({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authState = context.watch<AuthenticationCubit>().state;
    return authState.maybeWhen(
        authenticatedWithoutAccount: () {
          return CreateUserProfileScreen(
              isPoppable: true, userProfileRepository: serviceLocator());
        },
        authenticated: (userProfile) {
          SchedulerBinding.instance!.addPostFrameCallback((_) {
            Navigator.of(context).popUntil(
              (route) =>
                  route.settings.name == MyNavigationRoutes.artist ||
                  route.settings.name == MyNavigationRoutes.event ||
                  route.settings.name == MyNavigationRoutes.place ||
                  route.settings.name == MyNavigationRoutes.unity,
            );
          });
          return LoadingScreen();
        },
        unauthenticated: () => SignInMethodsScreen(
              isPoppable: true,
            ),
        orElse: () => LoadingScreen());
  }
}
