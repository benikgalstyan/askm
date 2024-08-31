import 'package:askm/presentation/pages/main_screen/main_screen.dart';
import 'package:askm/presentation/pages/sign_up_screen/sign_up_screen.dart';
import 'package:askm/presentation/pages/social_sign_up_screen/social_sign_up_screen.dart';
import 'package:auto_route/auto_route.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: SocialSignUpRoute.page,
          path: SocialSignUpScreen.nameRoute,
          initial: true,
        ),
        AutoRoute(page: SignUpRoute.page, path: SignUpScreen.nameRoute),
        AutoRoute(page: MainRoute.page, path: MainScreen.nameRoute),
      ];
}
