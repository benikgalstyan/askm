import 'package:askm/presentation/pages/main_screen/main_screen.dart';
import 'package:askm/presentation/pages/second_screen/second_screen.dart';
import 'package:auto_route/auto_route.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: MainRoute.page, path: '/'),
        AutoRoute(page: SecondRoute.page, path: '/second'),
      ];
}
