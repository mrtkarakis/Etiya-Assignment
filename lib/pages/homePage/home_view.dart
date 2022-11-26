import 'package:etiya_assignment/global.dart';
import 'package:etiya_assignment/localization/text.dart';
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
                await citiesService.getCities();
              },
              child: const Text("get cities")),
          const Center(
            child: Text("ETIYA ASSIGMENTS"),
          ),
        ],
      ),
    );
  }
}
