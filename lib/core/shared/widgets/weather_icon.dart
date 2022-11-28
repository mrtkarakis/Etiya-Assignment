import 'package:etiya_assignment/model/weather/weather_model.dart';
import 'package:flutter/material.dart';

class WeatherIcon extends StatelessWidget {
  const WeatherIcon({
    super.key,
    required this.weather,
    this.scale = 1.0,
  });

  final Weather weather;
  final double scale;
  @override
  Widget build(BuildContext context) {
    final String src = weather.current?.weatherIcons?.first ?? "";
    return Hero(
      tag: "${weather.location?.name ?? DateTime.now()} icon",
      child: Image.network(
        src,
        fit: BoxFit.cover,
      ),
    );
  }
}
