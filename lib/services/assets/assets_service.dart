import 'dart:convert' as convert;

import 'package:flutter/services.dart' show rootBundle;

class AssetService {
  static AssetService? _instace;
  static AssetService get instance {
    _instace ??= AssetService._init();
    return _instace!;
  }

  AssetService._init();
  Future<Map<String, dynamic>> parseJsonFromAssets(String assetsPath) async {
    return await rootBundle
        .loadString(assetsPath)
        .then((jsonStr) => convert.jsonDecode(jsonStr));
  }
}
