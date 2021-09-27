import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_postraves_app/src/my_navigation.dart';
import '../authentication/repository/firebase_auth_repository_impl.dart';
import '../authentication/state/cubit/authentication_cubit.dart';
import '../navigation_bar/bottom_navigation_tab_item.dart';
import '../utils/image_dimensions.dart';
import '../provider/current_tab_provider.dart';

import '../../dependency_injection.dart';

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
      //todo
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
      uriPrefix:
          'https://thepostravesapp.page.link', //todo change after removing old ios project from firebase
      link: Uri.parse('https://postraves.com$pathToPage'),
      iosParameters: IosParameters(
        appStoreId: '1301190736',
        bundleId: 'com.mmazurovsky.thePostravesApp',
      ),
      androidParameters: AndroidParameters(
        packageName: 'com.mmazurovsky.postraves_android', //todo change
        fallbackUrl: Uri.parse(
            'https://apps.apple.com/us/app/fitness-lab-bodybuilding/id1301190736'),
      ),
    );
    final ShortDynamicLink shortDynamicLink =
        await dynamicLinkParams.buildShortLink();
    return shortDynamicLink.shortUrl;
  }
}
