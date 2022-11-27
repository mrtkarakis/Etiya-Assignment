import 'package:etiya_assignment/global.dart';

class CitiesService {
  static CitiesService? _instace;
  static CitiesService get instance {
    _instace ??= CitiesService._init();
    return _instace!;
  }

  CitiesService._init();
  static List<String>? cities;
  static const String trPath = "assets/cities/tr.json";

  Future<List<String>> _getCitiesFromAssets() async {
    final Map<String, dynamic> citiesJson =
        await assetService.parseJsonFromAssets(trPath);
    List<String> result = citiesJson
        .map(
          (key, value) => MapEntry(
            key,
            value.toString(),
          ),
        )
        .values
        .toList();
    cities = result;

    return result;
  }

  Future<List<String>> getCities() async {
    return cities ?? await _getCitiesFromAssets(); // duration => 0-3 ms
  }
}
