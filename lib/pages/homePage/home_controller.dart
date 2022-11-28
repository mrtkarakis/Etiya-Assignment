import 'dart:async' as async;

import 'package:etiya_assignment/global.dart';
import 'package:etiya_assignment/services/developer/developer_service.dart';

class HomePageController {
  static HomePageController? _instace;
  static HomePageController get instance {
    _instace ??= HomePageController._init();
    return _instace!;
  }

  HomePageController._init();

  static async.Timer? _timer;
  static const int maxTick = 10;
  static bool get _checkCitiesIsNotEmpty => citiesService.cities != null;
  static bool _isFetchProcess = false;
  static bool _checkMaxTickIsTrue(int tick) => tick < maxTick;
  static async.Future<List<String>?> _fetchCities() =>
      citiesService.getCities();

  startTimer() {
    _timer = async.Timer.periodic(
      const Duration(milliseconds: 100),
      (timer) {
        DeveloperService.developerLog(
          " timer: ${timer.tick}",
          name: "HomePageController.timer",
        );
        if (_checkMaxTickIsTrue(timer.tick) && !_isFetchProcess) {
          if (_checkCitiesIsNotEmpty) {
            _isFetchProcess = true;
            final List<String> cities = citiesService.cities!;
            weatherService.fetchWeatherOfList(cities, limit: 2).then(
                  (_) => _isFetchProcess = false,
                );
          } else {
            _fetchCities();
          }
        } else {
          cancelTimer();
        }
      },
    );
  }

  cancelTimer() {
    _timer!.cancel();
    DeveloperService.developerLog(
      "cancelTimer",
      name: "HomePageController.cancelTimer",
    );
  }
}
