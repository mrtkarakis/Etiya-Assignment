import 'package:etiya_assignment/global.dart';
import 'package:etiya_assignment/localization/text.dart';
import 'package:etiya_assignment/pages/homePage/home_view.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  await localStorageService.instancePrefs();
  await weatherService.getLocalStorageWeather();

  runApp(const MyApp());
  citiesService.getCities();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppText.etiyaAssignment,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const HomePage(),
    );
  }
}
