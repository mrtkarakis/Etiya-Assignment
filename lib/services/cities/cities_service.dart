import 'package:etiya_assignment/global.dart';
import 'package:etiya_assignment/services/developer/developer_service.dart';

class CitiesService {
  static CitiesService? _instace;
  static CitiesService get instance {
    _instace ??= CitiesService._init();
    return _instace!;
  }

  CitiesService._init();
  List<String>? cities;
  static const String trPath = "assets/cities/tr.json";

  static bool _isGetCities = false;
  Future<List<String>?> _getCitiesFromAssets() async {
    if (!_isGetCities) {
      _isGetCities = true;

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
    _isGetCities = false;
    return null;
  }

  Future<List<String>?> getCities() async {
    DeveloperService.developerLog("getCities", name: "CitiesService.getCities");
    return cities ?? await _getCitiesFromAssets(); // duration => 0-3 ms
  }
}
