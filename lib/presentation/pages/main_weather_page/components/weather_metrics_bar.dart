import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../assets/colors/app_colors.dart';

class WeatherMetricsBar extends StatelessWidget {
  final String temperature;
  final String humidity;
  final String windSpeed;

  const WeatherMetricsBar(
      {super.key,
      required this.temperature,
      required this.humidity,
      required this.windSpeed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Text('max temp'),
            SizedBox(
              height: 4,
            ),
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                  color: AppColors.primaryAccent,
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: SvgPicture.asset('assets/weather_icons/sun.svg'),
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              '${temperature}C',
              style: TextStyle(color: Colors.black),
            )
          ],
        ),
        Column(
          children: [
            Text('humidity'),
            SizedBox(
              height: 4,
            ),
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                  color: AppColors.primaryAccent,
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: SvgPicture.asset('assets/weather_icons/water.svg'),
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              humidity,
              style: TextStyle(color: Colors.black),
            )
          ],
        ),
        Column(
          children: [
            Text('wind speed'),
            SizedBox(
              height: 4,
            ),
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                  color: AppColors.primaryAccent,
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: SvgPicture.asset('assets/weather_icons/wind.svg'),
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              '${windSpeed}km/h',
              style: TextStyle(color: Colors.black),
            )
          ],
        ),
      ],
    );
  }
}
