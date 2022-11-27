import 'package:etiya_assignment/global.dart';
import 'package:etiya_assignment/localization/text.dart';
import 'package:etiya_assignment/pages/homePage/home_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
  citiesService.getCities();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppText.etiyaAssignment,
      theme: ThemeData.dark(),
      home: const HomePage(),
    );
  }
}
