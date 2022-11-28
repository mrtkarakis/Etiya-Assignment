import 'package:auto_route/auto_route.dart';
import 'package:etiya_assignment/model/weather/weather_model.dart';
import 'package:etiya_assignment/pages/homePage/home_view.dart';
import 'package:etiya_assignment/pages/weatherDetailPage/weather_detail_view.dart';
import 'package:flutter/material.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      page: HomePage,
      path: "homePage",
      initial: true,
    ),
    AutoRoute(page: WeatherDetailPage, path: "WeatherDetailPage"),
  ],
)
class AppRouter extends _$AppRouter {
  AppRouter();
}
