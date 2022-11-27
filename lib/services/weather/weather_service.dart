import 'dart:convert' as convert;

import 'package:etiya_assignment/global.dart';
import 'package:etiya_assignment/model/weather/weather_model.dart';
import 'package:etiya_assignment/services/developer/developer_service.dart';
import 'package:etiya_assignment/services/network/model/base_model.dart';
import 'package:etiya_assignment/services/storage/local_storage_service.dart';

class WeatherService {
  static WeatherService? _instace;
  static WeatherService get instance {
    _instace ??= WeatherService._init();
    return _instace!;
  }

  WeatherService._init();

  final Map<String, Weather> localStorageWeather = {};

  void _addLocalStorageWeather(Weather weather) {
    final String key = weather.location?.name ?? "";
    localStorageWeather.addAll({key: weather});
  }

  Future<void> getLocalStorageWeather() async {
    final localData = await localStorageService.getValue(
      key: LocalStorageKey.weatherCities,
    );

    final jsonData = convert.json.decode(localData);
    Map<String, dynamic> weatherData = Map<String, dynamic>.from(jsonData);

    for (final element in weatherData.values) {
      Weather weather = Weather.fromJson(element);

      _addLocalStorageWeather(weather);
    }
    _setLocalDataToStore();
  }

  void _setLocalDataToStore() {
    for (Weather weather in localStorageWeather.values) {
      final bool hasData =
          weatherStore.cities.contains(weather.location?.name?.toLowerCase());
      if (!hasData) {
        weatherStore.addWeatherCity(weather);
      }
    }
  }

  void _setLocalStorage() {
    localStorageService.remove(key: LocalStorageKey.weatherCities);
    localStorageService.setValue(
        key: LocalStorageKey.weatherCities,
        value: convert.json.encode(localStorageWeather));
  }

  Future<void> fetchWeather(
    String city, {
    bool withAddCity = true,
    bool forceUpdateWeather = false,
  }) async {
    final bool hasCity = weatherStore.cities.contains(city.toLowerCase());

    if (!hasCity || forceUpdateWeather) {
      final BaseModel baseModel = await apiService.getCurrrentCity(city);
      final Weather weather = Weather.fromJson(baseModel.data);
      DeveloperService.developerLog("weather: $weather",
          name: "WeatherService.fetchWeather");
      weatherStore.addWeatherCity(weather);
      _addLocalStorageWeather(weather);
      _setLocalStorage();
    }
  }

  Future<void> fetchWeatherOfList(
    List<String> cities, {
    bool withAddCity = true,
    bool forceUpdateWeather = false,
    int? limit,
  }) async {
    limit = limit ?? cities.length;
    DeveloperService.developerLog("call fetchWeatherOfList",
        name: "WeatherService.fetchWeatherOfList");
    for (int i = 0; i < limit; i = i + 1) {
      final String city = cities[i];
      DeveloperService.developerLog("city: $city",
          name: "WeatherService.fetchWeatherOfList");
      await fetchWeather(
        city,
        withAddCity: withAddCity,
        forceUpdateWeather: forceUpdateWeather,
      );
    }
  }
}
