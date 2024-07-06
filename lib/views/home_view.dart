import 'package:flutter/material.dart';
import 'package:wethar_app/views/search_view.dart';
import 'package:wethar_app/widgets/no_wethar_body.dart';
import 'package:wethar_app/widgets/weather_info_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Weather App',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const SearchView();
              }));
            },
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
        ],
        backgroundColor: Colors.blue,
      ),
      body: const WeatherInfoBody(),
    );
  }
}
