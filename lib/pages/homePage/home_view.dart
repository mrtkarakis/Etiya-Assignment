import 'package:etiya_assignment/core/shared/constant/app_ui_constant.dart';
import 'package:etiya_assignment/pages/homePage/home_viewmodal.dart';
import 'package:etiya_assignment/pages/homePage/search/search_widget.dart';
import 'package:etiya_assignment/global.dart';
import 'package:etiya_assignment/localization/text.dart';
import 'package:etiya_assignment/model/weather/weather_model.dart';
import 'package:etiya_assignment/pages/homePage/home_controller.dart';
import 'package:etiya_assignment/core/widgets/weather_item.dart';
import 'package:etiya_assignment/pages/homePage/search/search_widget_viewmodal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomePageController pageController;

  @override
  void initState() {
    pageController = HomePageController.instance;
    pageController.startTimer();
    super.initState();
  }

  @override
  void dispose() {
    pageController.cancelTimer();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    deviceStore.setSize(context);

    return Scaffold(
      appBar: AppBar(title: const Text(AppText.etiyaAssignment)),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Padding(
            padding:
                const EdgeInsets.only(bottom: HomePageViewModal.bottomPadding),
            child: Observer(
              builder: (_) {
                List<Weather> weatherCities =
                    weatherStore.weatherCities.values.toList();
                return ListView.separated(
                    padding: UiConstant.verticalPadding,
                    itemCount: weatherCities.length,
                    separatorBuilder: (_, i) => Container(
                        height: .7, color: Colors.grey.withOpacity(.3)),
                    itemBuilder: (BuildContext context, int index) {
                      final Weather weather = weatherCities[index];
                      return WeatherItem(weather: weather);
                    });
              },
            ),
          ),
          const SearchWidget()
        ],
      ),
    );
  }
}
