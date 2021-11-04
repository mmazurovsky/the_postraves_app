import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_postraves_app/src/common/authentication/state/cubit/authentication_cubit.dart';
import 'package:the_postraves_app/src/common/widgets/animations/my_slide_animated_switcher.dart';
import 'package:the_postraves_app/src/common/widgets/other/loading_container.dart';
import 'package:the_postraves_app/src/features/profile/ui/screen/create_user_profile_screen.dart';
import 'package:the_postraves_app/src/features/profile/ui/screen/profile_screen.dart';
import 'package:the_postraves_app/src/features/profile/ui/screen/sign_in_methods_screen.dart';

import '../../../../dependency_injection.dart';

class ProfileScreenResolver extends StatefulWidget {
  const ProfileScreenResolver({Key? key}) : super(key: key);

  @override
  _ProfileScreenResolverState createState() => _ProfileScreenResolverState();
}

class _ProfileScreenResolverState extends State<ProfileScreenResolver> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationCubit, AuthenticationState>(
      builder: (context, state) {
        Widget screenToReturn = const LoadingContainer();
        state.maybeWhen(
            loading: () => screenToReturn = const LoadingContainer(),
            authenticated: (_) => screenToReturn = const ProfileScreen(),
            authenticatedWithoutAccount: () => screenToReturn =
                CreateUserProfileScreen(
                    isPoppable: false, userProfileRepository: serviceLocator()),
            unauthenticated: () => screenToReturn = const SignInMethodsScreen(
                  isPoppable: false,
                ),
            orElse: () {});
        return MySlideAnimatedSwitcher(child: screenToReturn);
      },
    );
  }
}
