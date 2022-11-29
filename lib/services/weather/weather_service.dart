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
    if (localData != null) {
      final jsonData = convert.json.decode(localData);
      Map<String, dynamic> weatherData = Map<String, dynamic>.from(jsonData);

      for (final element in weatherData.values) {
        Weather weather = Weather.fromJson(element);

        _addLocalStorageWeather(weather);
      }
      _setLocalDataToStore();
    }
  }

  void _setLocalDataToStore() {
    for (Weather weather in localStorageWeather.values) {
      final bool hasData =
          weatherStore.cities.contains(weather.location?.name?.toUpperCase());
      if (!hasData) {
        weatherStore.addWeatherCity(weather);
      }
    }
  }

  void _setLocalStorage() {
    localStorageService.remove(key: LocalStorageKey.weatherCities);
    localStorageService.setValue(
      key: LocalStorageKey.weatherCities,
      value: convert.json.encode(localStorageWeather),
    );
  }

  Future<Weather?> fetchWeather(
    String city, {
    bool withAddCity = true,
    bool forceUpdateWeather = false,
  }) async {
    final bool hasCity = weatherStore.cities.contains(city.toUpperCase());

    bool isDifference = true;
    if (hasCity) {
      isDifference = _checkTimeDifference(city);
    }
    if (!hasCity || forceUpdateWeather || isDifference) {
      final BaseModel baseModel = await apiService.getCurrrentCity(city);
      if (baseModel.data?["request"] != null) {
        final Weather weather = Weather.fromJson(baseModel.data);

        DeveloperService.developerLog("weather: $weather",
            name: "WeatherService.fetchWeather");
        weatherStore.addWeatherCity(weather, withAddCity: withAddCity);
        _addLocalStorageWeather(weather);
        _setLocalStorage();

        return weather;
      }
    }
    return null;
  }

  bool _checkTimeDifference(String city) {
    final int? dataTimeEpoch = weatherStore
        .weatherCities[city.toUpperCase()]?.location?.localtimeEpoch;
    DateTime nowTime = DateTime.now();
    nowTime = nowTime.add(nowTime.timeZoneOffset);
    DateTime dataTime = nowTime;
    if (dataTimeEpoch != null) {
      dataTime = DateTime.fromMillisecondsSinceEpoch(dataTimeEpoch * 1000);
    }
    final Duration timeDifference = nowTime.difference(dataTime);
    final bool isDifference = timeDifference.inMinutes > 10;
    return isDifference;
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
