import 'package:etiya_assignment/services/developer/developer_service.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LocalStorageService {
  static LocalStorageService? _instace;
  static LocalStorageService get instance {
    if (_instace != null) return _instace!;
    _instace = LocalStorageService._init();
    return _instace!;
  }

  LocalStorageService._init();

  static Box? _box;
  Future<void> instancePrefs() async {
    DeveloperService.developerLog("instancePrefs",
        name: "LocalStorageService.instancePrefs");
    await Hive.initFlutter();
    _box = await Hive.openBox("etiya");
  }

  void setValue({required String key, required value}) {
    DeveloperService.developerLog("key: $key, value: $value",
        name: "LocalStorageService.setValue.$key");
    if (_box == null) {
      instancePrefs().then((v) => _box?.put(key, value));
    } else {
      _box?.put(key, value);
    }
  }

  dynamic getValue({required String key}) {
    dynamic result = _box?.get(key);

    if (_box == null) {
      instancePrefs().then((_) => result = _box?.get(key));
    }

    DeveloperService.developerLog("key: $key => result: $result ",
        name: "LocalStorageService.getValue.$key");
    return result;
  }

  void remove({required String key}) {
    instancePrefs();
    _box?.delete(key);
    DeveloperService.developerLog("key: $key",
        name: "LocalStorageService.remove.$key");
  }
}

class LocalStorageKey {
  static const String weatherCities = "weatherCities";
}
