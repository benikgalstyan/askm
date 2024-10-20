import 'package:askm/core/router/router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:askm/data/service/local_storage/secure_storage_service.dart';

class AuthGuard extends AutoRouteGuard {
  AuthGuard({required this.secureStorageService});

  final SecureStorageService secureStorageService;

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    final accessToken = await secureStorageService.getAccessToken();

    if (accessToken != null) {
      await router.push(MainRoute());
    } else {
      resolver.next(true);
    }
  }
}
