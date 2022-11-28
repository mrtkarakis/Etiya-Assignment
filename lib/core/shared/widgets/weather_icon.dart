import 'package:etiya_assignment/model/weather/weather_model.dart';
import 'package:flutter/material.dart';

class WeatherIcon extends StatelessWidget {
  const WeatherIcon({
    super.key,
    required this.weather,
  });

  final Weather weather;

  @override
  Widget build(BuildContext context) {
    final String src = weather.current?.weatherIcons?.first ?? "";
    return Hero(tag: weather, child: Image.network(src));
  }
}
