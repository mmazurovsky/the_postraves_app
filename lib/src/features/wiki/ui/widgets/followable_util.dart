import 'package:provider/src/provider.dart';
import '../../../../core/authentication/state/cubit/authentication_cubit.dart';
import '../../state/follow_cubit/follow_cubit.dart';
import '../../../../models/interfaces/data_interfaces.dart';
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