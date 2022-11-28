import 'package:auto_route/auto_route.dart';
import 'package:etiya_assignment/core/shared/constant/app_ui_constant.dart';
import 'package:etiya_assignment/core/shared/widgets/weather_degree.dart';
import 'package:etiya_assignment/core/shared/widgets/weather_icon.dart';
import 'package:etiya_assignment/core/shared/widgets/weather_time.dart';
import 'package:etiya_assignment/global.dart';
import 'package:etiya_assignment/model/weather/weather_model.dart';
import 'package:etiya_assignment/router/app_router.dart';
import 'package:flutter/material.dart';

class WeatherItem extends StatelessWidget {
  const WeatherItem({
    Key? key,
    required this.weather,
  }) : super(key: key);

  final Weather weather;

  static const double itemHeight = 65;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: itemHeight,
      child: TextButton(
        onPressed: () =>
            context.router.push(WeatherDetailRoute(weather: weather)),
        child: Padding(
          padding: UiConstant.horizontalPadding,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              WeatherIcon(weather: weather),
              WeatherDegree(weather: weather),
              locationNameAndTime(),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox locationNameAndTime() {
    final double widgetWidth = deviceStore.size.width / 3;
    final String name = weather.location?.name ?? "";

    return SizedBox(
      width: widgetWidth,
      height: itemHeight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FittedBox(
            child: Text(
              name,
              style: const TextStyle(fontSize: 22),
            ),
          ),
          WeatherTime(weather: weather),
        ],
      ),
    );
  }
}
