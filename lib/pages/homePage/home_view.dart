import 'package:etiya_assignment/global.dart';
import 'package:etiya_assignment/localization/text.dart';
import 'package:etiya_assignment/services/cities/cities_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppText.etiyaAssignment)),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () async {
                weatherService.fetchWeather("İzmir");
              },
              child: Text(CitiesService.cities?.last ?? "")),
          const Center(
            child: Text("ETIYA ASSIGMENTS"),
          ),
        ],
      ),
    );
  }
}
