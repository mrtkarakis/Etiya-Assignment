import 'package:etiya_assignment/global.dart';

class CitiesService {
  static CitiesService? _instace;
  static CitiesService get instance {
    _instace ??= CitiesService._init();
    return _instace!;
  }

  CitiesService._init();
  static List<String>? _cities;
  static const String trPath = "assets/cities/tr.json";

  Future<List<String>> _getCitiesFromAssets() async {
    final Map<String, dynamic> citiesJson =
        await assetService.parseJsonFromAssets(trPath);
    List<String> cities = citiesJson
        .map(
          (key, value) => MapEntry(
            key,
            value.toString(),
          ),
        )
        .values
        .toList();
    _cities = cities;

    return cities;
  }

  Future<List<String>> getCities() async {
    return _cities ?? await _getCitiesFromAssets(); // duration => 0-3 ms
  }
}
