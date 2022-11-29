// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SearchStore on _SearchStoreBase, Store {
  late final _$searchCitiesAtom =
      Atom(name: '_SearchStoreBase.searchCities', context: context);

  @override
  ObservableMap<String, dynamic> get searchCities {
    _$searchCitiesAtom.reportRead();
    return super.searchCities;
  }

  @override
  set searchCities(ObservableMap<String, dynamic> value) {
    _$searchCitiesAtom.reportWrite(value, super.searchCities, () {
      super.searchCities = value;
    });
  }

  late final _$_SearchStoreBaseActionController =
      ActionController(name: '_SearchStoreBase', context: context);

  @override
  void addSearchCities(
      {required String city, bool hasWeather = false, Weather? weather}) {
    final _$actionInfo = _$_SearchStoreBaseActionController.startAction(
        name: '_SearchStoreBase.addSearchCities');
    try {
      return super.addSearchCities(
          city: city, hasWeather: hasWeather, weather: weather);
    } finally {
      _$_SearchStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearSearchCities() {
    final _$actionInfo = _$_SearchStoreBaseActionController.startAction(
        name: '_SearchStoreBase.clearSearchCities');
    try {
      return super.clearSearchCities();
    } finally {
      _$_SearchStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
searchCities: ${searchCities}
    ''';
  }
}
