import 'package:flutter/material.dart';
import 'package:goldy/core/presentation/views/home_view.dart';
import 'package:goldy/core/routing/routes.dart';
import 'package:goldy/features/gold/presentation/views/gold_view.dart';
import 'package:goldy/features/silver/presentation/views/silver_view.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.home:
        return MaterialPageRoute(builder: (_) => HomeView());

      case AppRoutes.gold:
        return MaterialPageRoute(builder: (_) => GoldView());
      case AppRoutes.silver:
        return MaterialPageRoute(builder: (_) => SilverView());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
