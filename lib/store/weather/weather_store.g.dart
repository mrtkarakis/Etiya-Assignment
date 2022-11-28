// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$WeatherStore on _WeatherStoreBase, Store {
  late final _$weatherCitiesAtom =
      Atom(name: '_WeatherStoreBase.weatherCities', context: context);

  @override
  ObservableMap<String, Weather> get weatherCities {
    _$weatherCitiesAtom.reportRead();
    return super.weatherCities;
  }

  @override
  set weatherCities(ObservableMap<String, Weather> value) {
    _$weatherCitiesAtom.reportWrite(value, super.weatherCities, () {
      super.weatherCities = value;
    });
  }

  late final _$_WeatherStoreBaseActionController =
      ActionController(name: '_WeatherStoreBase', context: context);

  @override
  void addWeatherCity(Weather weather, {bool withAddCity = true}) {
    final _$actionInfo = _$_WeatherStoreBaseActionController.startAction(
        name: '_WeatherStoreBase.addWeatherCity');
    try {
      return super.addWeatherCity(weather, withAddCity: withAddCity);
    } finally {
      _$_WeatherStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addAllWeatherCities(Map<String, Weather> weatherCities,
      {bool clearTo = false}) {
    final _$actionInfo = _$_WeatherStoreBaseActionController.startAction(
        name: '_WeatherStoreBase.addAllWeatherCities');
    try {
      return super.addAllWeatherCities(weatherCities, clearTo: clearTo);
    } finally {
      _$_WeatherStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearWeatherCity() {
    final _$actionInfo = _$_WeatherStoreBaseActionController.startAction(
        name: '_WeatherStoreBase.clearWeatherCity');
    try {
      return super.clearWeatherCity();
    } finally {
      _$_WeatherStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addCity(String? city) {
    final _$actionInfo = _$_WeatherStoreBaseActionController.startAction(
        name: '_WeatherStoreBase.addCity');
    try {
      return super.addCity(city);
    } finally {
      _$_WeatherStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addAllCity(List<String> citiesList, {bool clearTo = false}) {
    final _$actionInfo = _$_WeatherStoreBaseActionController.startAction(
        name: '_WeatherStoreBase.addAllCity');
    try {
      return super.addAllCity(citiesList, clearTo: clearTo);
    } finally {
      _$_WeatherStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearCity() {
    final _$actionInfo = _$_WeatherStoreBaseActionController.startAction(
        name: '_WeatherStoreBase.clearCity');
    try {
      return super.clearCity();
    } finally {
      _$_WeatherStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
weatherCities: ${weatherCities}
    ''';
  }
}
