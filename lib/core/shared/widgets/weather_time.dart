import 'package:etiya_assignment/model/weather/weather_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WeatherTime extends StatelessWidget {
  const WeatherTime({super.key, required this.weather});
  final Weather weather;
  @override
  Widget build(BuildContext context) {
    DateTime weatherTime = DateTime.fromMillisecondsSinceEpoch(
      (weather.location?.localtimeEpoch ?? 0) * 1000,
    ).toUtc();
    final String timeToString;
    if (weatherTime.day != DateTime.now().day) {
      timeToString = DateFormat('dd/MM kk:mm').format(weatherTime);
    } else {
      timeToString = DateFormat('kk:mm').format(weatherTime);
    }

    return Text(
      timeToString,
      style: const TextStyle(fontSize: 18),
    );
  }
}
