import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_postraves_app/src/core/authentication/state/cubit/authentication_cubit.dart';
import 'package:the_postraves_app/src/models/user/user_profile.dart';

class UpdateProfileScreen extends StatefulWidget {
  UpdateProfileScreen({Key? key}) : super(key: key);

  @override
  _UpdateProfileScreenState createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  UserProfile? _userProfile;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    _userProfile = BlocProvider.of<AuthenticationCubit>(context).currentUserFromBackend;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
