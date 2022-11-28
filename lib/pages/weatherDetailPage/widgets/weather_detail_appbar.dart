import 'package:etiya_assignment/model/weather/weather_model.dart';
import 'package:etiya_assignment/pages/weatherDetailPage/widgets/data_widget.dart';
import 'package:flutter/material.dart';

class WeatherDetailBody extends StatefulWidget {
  const WeatherDetailBody({
    Key? key,
    required this.weather,
  }) : super(key: key);

  final Weather weather;

  @override
  State<WeatherDetailBody> createState() => _WeatherDetailBodyState();
}

class _WeatherDetailBodyState extends State<WeatherDetailBody> {
  final Map<String, dynamic> data = {};
  @override
  void initState() {
    super.initState();
    final Map<String, dynamic> weatherMap = widget.weather.toJson();
    for (String key in weatherMap.keys.toList()) {
      final Map<String, dynamic> weatherKeysMap = weatherMap[key].toJson();
      for (String dataKey in weatherKeysMap.keys.toList()) {
        final value = weatherMap[key].toJson()[dataKey];
        if (value != null) data.addAll({dataKey: value});
      }
    }
  }

  static const int _crossAxisCount = 3;
  static const bool _shrinkWrap = true;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: _shrinkWrap,
        itemCount: data.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: _crossAxisCount,
        ),
        itemBuilder: (BuildContext context, int index) {
          final MapEntry<String, dynamic> dataEntry =
              data.entries.toList()[index];
          final title = dataEntry.key;
          final value = dataEntry.value.toString();
          return DataWidget(title: title, value: value);
        },
      ),
    );
  }
}
