import 'package:etiya_assignment/global.dart';
import 'package:etiya_assignment/model/weather/weather_model.dart';
import 'package:etiya_assignment/services/developer/developer_service.dart';
import 'package:etiya_assignment/services/network/model/base_model.dart';

class WeatherService {
  static WeatherService? _instace;
  static WeatherService get instance {
    _instace ??= WeatherService._init();
    return _instace!;
  }

  WeatherService._init();

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
    }
  }

  Future<void> fetchWeatherOfList(
    List<String> cities, {
    bool withAddCity = true,
    bool forceUpdateWeather = false,
  }) async {
    for (String city in cities) {
      fetchWeather(
        city,
        withAddCity: withAddCity,
        forceUpdateWeather: forceUpdateWeather,
      );
    }
  }
}
