import 'package:etiya_assignment/global.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Etiya Assignment")),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () async {
                await apiService.getCurrrentCity("izmir");
              },
              child: Text("get izmir")),
          const Center(
            child: Text("ETIYA ASSIGMENTS"),
          ),
        ],
      ),
    );
  }
}
