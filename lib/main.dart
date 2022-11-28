import 'package:etiya_assignment/global.dart';
import 'package:etiya_assignment/localization/text.dart';
import 'package:etiya_assignment/router/app_router.dart';
import 'package:etiya_assignment/theme/app_theme.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  await localStorageService.instancePrefs();
  await weatherService.getLocalStorageWeather();

  runApp(const MyApp());
  citiesService.getCities();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final AppRouter _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: AppText.etiyaAssignment,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.appTheme,
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}
