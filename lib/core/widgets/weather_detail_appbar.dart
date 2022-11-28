import 'package:etiya_assignment/core/shared/widgets/weather_degree.dart';
import 'package:etiya_assignment/core/shared/widgets/weather_icon.dart';
import 'package:etiya_assignment/model/weather/weather_model.dart';
import 'package:flutter/material.dart';

class WeatherDetailAppBar extends StatefulWidget {
  const WeatherDetailAppBar({
    Key? key,
    required this.weather,
  }) : super(key: key);

  final Weather weather;

  @override
  State<WeatherDetailAppBar> createState() => _WeatherDetailAppBarState();
}

class _WeatherDetailAppBarState extends State<WeatherDetailAppBar> {
  bool isBlack = false;

  Duration animationDuration = const Duration(milliseconds: 750);
  static const double _bottomPos = 12;
  static const double _rightPos = 12;
  static const double _fontSize = 28;

  Color get color => isBlack ? Colors.black45 : Colors.transparent;

  @override
  void initState() {
    super.initState();
    Future.microtask(() => setState(() => isBlack = true));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        WeatherIcon(weather: widget.weather),
        AnimatedContainer(duration: animationDuration, color: color),
        Positioned(
          right: _rightPos,
          bottom: _bottomPos,
          child: WeatherDegree(weather: widget.weather, size: _fontSize),
        ),
      ],
    );
  }
}
