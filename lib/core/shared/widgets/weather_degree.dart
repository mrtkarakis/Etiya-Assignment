import 'package:etiya_assignment/localization/text.dart';
import 'package:etiya_assignment/model/weather/weather_model.dart';
import 'package:flutter/material.dart';

class WeatherDegree extends StatelessWidget {
  const WeatherDegree({
    super.key,
    required this.weather,
    this.size = 28,
  });
  final Weather weather;
  final double size;
  @override
  Widget build(BuildContext context) {
    final String text =
        "${weather.current?.temperature} ${AppText.celsiusSymbol}";
    return Hero(
      tag: weather,
      child: Text(text, style: TextStyle(fontSize: size)),
    );
  }
}
