import 'package:etiya_assignment/global.dart';
import 'package:etiya_assignment/localization/text.dart';
import 'package:etiya_assignment/model/weather/weather_model.dart';
import 'package:etiya_assignment/pages/homePage/home_controller.dart';
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
    return Scaffold(
      appBar: AppBar(title: const Text(AppText.etiyaAssignment)),
      body: Column(
        children: [
          Expanded(
            child: Observer(
              builder: (_) {
                List<Weather> weatherCities =
                    weatherStore.weatherCities.values.toList();
                return ListView.separated(
                    itemCount: weatherCities.length,
                    separatorBuilder: (_, i) => const Divider(),
                    itemBuilder: (BuildContext context, int index) {
                      final Weather weather = weatherCities[index];
                      return Container(
                        child: Row(
                          children: [
                            Image.network(
                                weather.current?.weatherIcons?.first ?? "")
                          ],
                        ),
                      );
                    });
              },
            ),
          ),
        ],
      ),
    );
  }
}
