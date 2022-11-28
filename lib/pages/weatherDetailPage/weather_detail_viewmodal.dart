import 'package:etiya_assignment/core/widgets/weather_detail_appbar.dart';
import 'package:etiya_assignment/global.dart';
import 'package:etiya_assignment/model/weather/weather_model.dart';
import 'package:flutter/material.dart';

class WeatherDetailPageViewModal {
  SliverAppBar sliverAppBar({
    required Weather weather,
    required bool innerBoxIsScrolled,
  }) =>
      SliverAppBar(
        title: Text(weather.location?.name ?? ""),
        floating: true,
        pinned: true,
        snap: true,
        expandedHeight: deviceStore.size.width * .75,
        forceElevated: innerBoxIsScrolled,
        flexibleSpace: WeatherDetailAppBar(weather: weather),
      );
}
