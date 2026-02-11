import 'package:flutter/material.dart';
import 'package:goldy/core/constants/app_strings.dart';
import 'package:goldy/core/routing/app_router.dart';
import 'package:goldy/core/routing/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      initialRoute: AppRoutes.home,
      onGenerateRoute: AppRouter().generateRoute,
    );
  }
}
