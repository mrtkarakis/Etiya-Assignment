import 'dart:convert' as convert;

import 'package:flutter/services.dart' show rootBundle;

class AssetService {
  Future<Map<String, dynamic>> parseJsonFromAssets(String assetsPath) async {
    return await rootBundle
        .loadString(assetsPath)
        .then((jsonStr) => convert.jsonDecode(jsonStr));
  }
}
