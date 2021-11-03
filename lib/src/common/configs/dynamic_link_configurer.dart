import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_postraves_app/src/common/authentication/repository/firebase_auth_repository.dart';
import 'package:the_postraves_app/src/common/authentication/state/cubit/authentication_cubit.dart';
import '../bottom_navigation_bar/bottom_navigation_tab_item.dart';
import '../geo_provider/current_tab_provider.dart';
import '../../dependency_injection.dart';
import '../navigation/my_navigation.dart';
import '../constants/my_constants.dart';


class DynamicLinksConfigurer extends StatelessWidget {
  final Widget child;
  const DynamicLinksConfigurer({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DynamicLinkService.initDynamicLinks(serviceLocator(), context,
        context.watch<CurrentTabProvider>().currentTab);
    return child;
  }
}

class DynamicLinkService {
  static void initDynamicLinks(
    FirebaseAuthRepository firebaseAuthRepository,
    BuildContext context,
    TabItem currentTab,
  ) async {
    FirebaseDynamicLinks.instance.onLink(
        onSuccess: (PendingDynamicLinkData? dynamicLink) async {
      final Uri? deepLink = dynamicLink?.link;

      if (deepLink != null) {
        if (firebaseAuthRepository.isSignInWithEmailLink(deepLink.toString())) {
          BlocProvider.of<AuthenticationCubit>(context)
              .endSigningWithEmailLink(deepLink);
        } else {
          NavigatorFunctions.pushFollowableFromDynamicLink(
              currentTab: currentTab, deepLink: deepLink);
        }
      }
    }, onError: (OnLinkErrorException e) async {
      //TODO Exception
    });

    final PendingDynamicLinkData? data =
        await FirebaseDynamicLinks.instance.getInitialLink();
    final Uri? deepLink = data?.link;

    if (deepLink != null) {
      Navigator.pushNamed(context, deepLink.path);
    }
  }

  static Future<Uri> createDynamicLink(String pathToPage) async {
    final dynamicLinkParams = DynamicLinkParameters(
      uriPrefix: MyConstants
          .dynamicLinkUrlPrefix,
      link: Uri.parse('https://postraves.com$pathToPage'),
      iosParameters: IosParameters(
        appStoreId: '1301190736', //TODO !!!
        bundleId: MyConstants.iosBundleId,
      ),
      androidParameters: AndroidParameters(
        packageName: MyConstants.androidPackageName,
        fallbackUrl: Uri.parse(
            'https://apps.apple.com/us/app/fitness-lab-bodybuilding/id1301190736'), //TODO !!!
      ),
    );
    final ShortDynamicLink shortDynamicLink =
        await dynamicLinkParams.buildShortLink();
    return shortDynamicLink.shortUrl;
  }
}
