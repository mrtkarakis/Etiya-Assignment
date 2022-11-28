import 'package:etiya_assignment/model/weather/weather_model.dart';
import 'package:etiya_assignment/pages/weatherDetailPage/weather_detail_viewmodal.dart';
import 'package:flutter/material.dart';

import 'widgets/weather_detail_appbar.dart';

class WeatherDetailPage extends StatelessWidget {
  const WeatherDetailPage({super.key, required this.weather});

  final Weather weather;
  static final WeatherDetailPageViewModal viewModal =
      WeatherDetailPageViewModal();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              viewModal.sliverAppBar(
                weather: weather,
                innerBoxIsScrolled: innerBoxIsScrolled,
              )
            ];
          },
          body: WeatherDetailBody(weather: weather),
        ),
      ),
    );
  }
}
