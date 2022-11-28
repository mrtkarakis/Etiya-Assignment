// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const HomePage(),
      );
    },
    WeatherDetailRoute.name: (routeData) {
      final args = routeData.argsAs<WeatherDetailRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: WeatherDetailPage(
          key: args.key,
          weather: args.weather,
        ),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: 'homePage',
          fullMatch: true,
        ),
        RouteConfig(
          HomeRoute.name,
          path: 'homePage',
        ),
        RouteConfig(
          WeatherDetailRoute.name,
          path: 'WeatherDetailPage',
        ),
      ];
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: 'homePage',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [WeatherDetailPage]
class WeatherDetailRoute extends PageRouteInfo<WeatherDetailRouteArgs> {
  WeatherDetailRoute({
    Key? key,
    required Weather weather,
  }) : super(
          WeatherDetailRoute.name,
          path: 'WeatherDetailPage',
          args: WeatherDetailRouteArgs(
            key: key,
            weather: weather,
          ),
        );

  static const String name = 'WeatherDetailRoute';
}

class WeatherDetailRouteArgs {
  const WeatherDetailRouteArgs({
    this.key,
    required this.weather,
  });

  final Key? key;

  final Weather weather;

  @override
  String toString() {
    return 'WeatherDetailRouteArgs{key: $key, weather: $weather}';
  }
}
