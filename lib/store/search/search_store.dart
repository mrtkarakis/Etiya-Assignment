import 'package:etiya_assignment/global.dart';
import 'package:etiya_assignment/model/weather/weather_model.dart';
import 'package:mobx/mobx.dart';
part 'search_store.g.dart';

class SearchStore = _SearchStoreBase with _$SearchStore;

abstract class _SearchStoreBase with Store {
  @observable
  ObservableMap<String, dynamic> searchCities =
      <String, dynamic>{}.asObservable();

  @action
  void addSearchCities(
      {required String city, bool hasWeather = false, Weather? weather}) {
    if (hasWeather || weather != null) {
      searchCities.addAll({
        city:
            weather ?? weatherStore.weatherCities[city.toUpperCase()] as Weather
      });
    } else {
      searchCities.addAll({city: null});
    }
  }

  @action
  void clearSearchCities() {
    searchCities.clear();
  }
}
