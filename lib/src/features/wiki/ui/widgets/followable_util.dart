import 'package:provider/src/provider.dart';
import 'package:the_postraves_app/src/core/authentication/state/cubit/authentication_cubit.dart';
import 'package:the_postraves_app/src/features/wiki/state/follow_cubit/follow_cubit.dart';
import 'package:the_postraves_app/src/models/interfaces/data_interfaces.dart';
import 'package:flutter/widgets.dart';

import '../../../../my_navigation.dart';

class FollowableUtil {
    static void onIsFollowedChange<T extends GeneralFollowableInterface>(BuildContext context, T followable) {
    if (context.read<AuthenticationCubit>().state is! AuthenticatedState) {
      Navigator.of(context).pushNamed(MyNavigationRoutes.actionResolver);
    } else {
      context.read<FollowCubit<T>>().toggleFollow(followable);
    }
  }
}