import 'package:etiya_assignment/model/weather/weather_model.dart';
import 'package:mobx/mobx.dart';
part 'weather_store.g.dart';

class WeatherStore = _WeatherStoreBase with _$WeatherStore;

abstract class _WeatherStoreBase with Store {
  @observable
  ObservableSet<Weather> weatherCities = <Weather>{}.asObservable();

  @action
  void addWeatherCity(Weather weather) => weatherCities.add(weather);

  @action
  void addAllWeatherCity(List<Weather> weatherList, {bool clearTo = false}) {
    if (clearTo) clearWeatherCity();
    weatherCities.addAll(weatherList);
  }

  @action
  void clearWeatherCity() => weatherCities.clear();
}
