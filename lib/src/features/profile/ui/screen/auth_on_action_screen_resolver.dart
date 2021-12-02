import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../common/authentication/state/cubit/authentication_cubit.dart';
import '../../../../common/widgets/other/loading_container.dart';
import '../../../../dependency_injection.dart';
import '../../../../common/navigation/my_navigation.dart';
import 'create_user_profile_screen.dart';
import 'sign_in_methods_screen.dart';


class AuthOnActionScreenResolver extends StatelessWidget {
  const AuthOnActionScreenResolver({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authState = context.watch<AuthenticationCubit>().state;
    return authState.maybeWhen(
        authenticatedWithoutAccount: () {
          return CreateUserProfileScreen(
              isPoppable: true, userProfileRepository: serviceLocator());
        },
        authenticated: (_) {
          SchedulerBinding.instance!.addPostFrameCallback((_) {
            Navigator.of(context).popUntil(
              (route) =>
                  route.settings.name == MyNavigationRoutes.artist ||
                  route.settings.name == MyNavigationRoutes.event ||
                  route.settings.name == MyNavigationRoutes.place ||
                  route.settings.name == MyNavigationRoutes.unity,
            );
          });
          return const LoadingContainer();
        },
        unauthenticated: () => const SignInMethodsScreen(
              isPoppable: true,
            ),
        orElse: () => const LoadingContainer()); //TODO Exception:
  }
}
