import 'package:etiya_assignment/model/weather/weather_model.dart';
import 'package:mobx/mobx.dart';
part 'weather_store.g.dart';

class WeatherStore = _WeatherStoreBase with _$WeatherStore;

abstract class _WeatherStoreBase with Store {
  @observable
  ObservableSet<Weather> weatherCities = <Weather>{}.asObservable();

  @action
  void addWeatherCity(Weather weather, {bool withAddCity = true}) {
    if (withAddCity) addCity(weather.location?.name?.toLowerCase());
    weatherCities.add(weather);
  }

  @action
  void addAllWeatherCity(List<Weather> weatherList, {bool clearTo = false}) {
    if (clearTo) clearWeatherCity();
    weatherCities.addAll(weatherList);
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
