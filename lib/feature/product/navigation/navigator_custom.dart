import 'package:flutter/material.dart';
import 'package:meenet/feature/product/navigation/navigate_routes.dart';
import 'package:meenet/feature/view/home/home_page.dart';

mixin NavigatorCustom {
  Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    const String paraf = '/';
    if (routeSettings.name?.isEmpty ?? true) {
      return _navigateNormal(const HomePage());
    }
    if (routeSettings.name == paraf) {
      return _navigateNormal(const HomePage());
    }
    final routes = routeSettings.name == paraf
        ? NavigateRoutes.home
        : NavigateRoutes.values.byName(routeSettings.name!.substring(1));
    switch (routes) {
      case NavigateRoutes.home:
        return _navigateNormal(const HomePage());
    }
  }

  Route<dynamic>? _navigateNormal(Widget child, {bool? isFullscreenDialog}) {
    return MaterialPageRoute(
        fullscreenDialog: isFullscreenDialog ?? false,
        builder: (context) {
          return child;
        });
  }
}
