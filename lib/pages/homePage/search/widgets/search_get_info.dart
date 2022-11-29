import 'package:etiya_assignment/core/shared/constant/app_ui_constant.dart';
import 'package:etiya_assignment/core/widgets/weather_item.dart';
import 'package:etiya_assignment/global.dart';
import 'package:etiya_assignment/localization/text.dart';
import 'package:etiya_assignment/model/weather/weather_model.dart';
import 'package:flutter/material.dart';

class SearchGetInfo extends StatefulWidget {
  const SearchGetInfo({super.key, required this.city});
  final String city;

  @override
  State<SearchGetInfo> createState() => _SearchGetInfoState();
}

class _SearchGetInfoState extends State<SearchGetInfo> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: WeatherItem.itemHeight,
      child: TextButton(
        onPressed: () => getWeatherInfo(),
        style: TextButton.styleFrom(padding: UiConstant.horizontalPadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(widget.city.toString()),
            isLoading
                ? const SizedBox(
                    height: 20, width: 20, child: CircularProgressIndicator())
                : const Text(
                    AppText.getWeatherInfo,
                    style: TextStyle(color: Colors.blue),
                  ),
          ],
        ),
      ),
    );
  }

  void getWeatherInfo() {
    if (!isLoading) {
      Future.microtask(() => setState(() => isLoading = true));

      weatherService.fetchWeather(widget.city).then(
        (Weather? weather) {
          if (weather != null) {
            searchStore.addSearchCities(
              city: widget.city,
              weather: weather,
              hasWeather: true,
            );
          }
          Future.microtask(() => setState(() => isLoading = false));
        },
      );
    }
  }
}
