import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../assets/colors/app_colors.dart';

class WeatherLoader extends StatelessWidget {
  const WeatherLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 300,
        width: 300,
        child: Stack(
          children: [
            Lottie.asset(
                'assets/animations/loading_cloud.json',
              height: 300,
              width: 300
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                'Loading...',
                style:
                TextStyle(color: AppColors.primary, fontSize: 24),
              ),
            )
          ],
        ),
      ),
    );
  }
}
