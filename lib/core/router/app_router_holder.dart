import 'package:askm/core/router/router.dart';
import 'package:flutter/material.dart';

class AppRouterHolder extends InheritedWidget {
  const AppRouterHolder({
    super.key,
    required super.child,
    required this.router,
  });

  final AppRouter router;

  static AppRouterHolder of(BuildContext context) {
    final AppRouterHolder? result =
        context.dependOnInheritedWidgetOfExactType<AppRouterHolder>();
    assert(result != null, 'No AppRouterHolder found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(AppRouterHolder oldWidget) =>
      router != oldWidget.router;
}
