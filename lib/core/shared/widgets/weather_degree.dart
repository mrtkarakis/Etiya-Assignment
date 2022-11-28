import 'package:etiya_assignment/localization/text.dart';
import 'package:etiya_assignment/model/weather/weather_model.dart';
import 'package:flutter/material.dart';

class WeatherDegree extends StatelessWidget {
  const WeatherDegree({
    super.key,
    required this.weather,
    this.size = 22,
  });
  final Weather weather;
  final double size;
  @override
  Widget build(BuildContext context) {
    final String degree = "${weather.current?.temperature}";
    const String symbol = " ${AppText.celsiusSymbol}";
    final String text = "$degree$symbol";

    return Hero(
      tag: "${weather.location?.name ?? DateTime.now()} degree",
      child: Material(
        type: MaterialType.transparency,
        child: Text(
          text,
          style: TextStyle(fontSize: size),
        ),
      ),
    );
  }
}
