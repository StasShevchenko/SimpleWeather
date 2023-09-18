import 'package:flutter/material.dart';

class MainWeatherPage extends StatelessWidget {
  const MainWeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: Text('Главный экран погоды')),
    );
  }
}
