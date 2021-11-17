import 'package:flutter/widgets.dart';
import 'package:provider/src/provider.dart';
import 'package:the_postraves_app/src/common/authentication/state/cubit/authentication_cubit.dart';
import 'package:the_postraves_package/models/interfaces/data_interfaces.dart';
import '../../../../common/navigation/my_navigation.dart';
import '../../state/follow_cubit/follow_cubit.dart';

class FollowableUtil {
  static void onIsFollowedChange<FULL extends GeneralFollowableInterface,
          SHORT extends GeneralFollowableInterface>(
      BuildContext context, FULL followable) {
    if (context.read<AuthenticationCubit>().state is! AuthenticatedState) {
      Navigator.of(context).pushNamed(MyNavigationRoutes.actionResolver);
    } else {
      context.read<FollowCubit<FULL, SHORT>>().toggleFollow(followable);
    }
  }
}
