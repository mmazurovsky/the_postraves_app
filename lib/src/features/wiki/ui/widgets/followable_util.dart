import 'package:flutter/widgets.dart';
import 'package:provider/src/provider.dart';
import 'package:the_postraves_app/src/common/authentication/state/cubit/authentication_cubit.dart';
import 'package:the_postraves_package/models/interfaces/data_interfaces.dart';
import '../../../../my_navigation.dart';
import '../../state/follow_cubit/follow_cubit.dart';


class FollowableUtil {
    static void onIsFollowedChange<T extends GeneralFollowableInterface>(BuildContext context, T followable) {
    if (context.read<AuthenticationCubit>().state is! AuthenticatedState) {
      Navigator.of(context).pushNamed(MyNavigationRoutes.actionResolver);
    } else {
      context.read<FollowCubit<T>>().toggleFollow(followable);
    }
  }
}
