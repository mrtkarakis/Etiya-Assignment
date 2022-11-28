import 'package:etiya_assignment/model/weather/weather_model.dart';
import 'package:mobx/mobx.dart';
part 'weather_store.g.dart';

class WeatherStore = _WeatherStoreBase with _$WeatherStore;

abstract class _WeatherStoreBase with Store {
  @observable
  ObservableMap<String, Weather> weatherCities =
      <String, Weather>{}.asObservable();

  @action
  void addWeatherCity(Weather weather, {bool withAddCity = true}) {
    if (withAddCity) addCity(weather.location?.name?.toUpperCase());
    weatherCities
        .addAll({weather.location?.name?.toUpperCase() ?? "": weather});
  }

  @action
  void addAllWeatherCities(
    Map<String, Weather> weatherCities, {
    bool clearTo = false,
  }) {
    if (clearTo) clearWeatherCity();
    weatherCities.addAll(weatherCities);
  }

  @action
  void clearWeatherCity() => weatherCities.clear();

  final Set<String> cities = <String>{};

  @action
  void addCity(String? city) => city != null ? cities.add(city) : null;

  @action
  void addAllCity(List<String> citiesList, {bool clearTo = false}) {
    if (clearTo) clearCity();
    cities.addAll(citiesList);
  }

  @action
  void clearCity() => cities.clear();
}
