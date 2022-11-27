import 'package:etiya_assignment/global.dart';
import 'package:etiya_assignment/localization/text.dart';
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
          Observer(builder: (_) {
            return Text(weatherStore.weatherCities.toString());
          })
        ],
      ),
    );
  }
}
