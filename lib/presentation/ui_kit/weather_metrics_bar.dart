import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../assets/colors/app_colors.dart';

class WeatherMetricsBar extends StatelessWidget {
  final Color? labelsColor;
  final String temperature;
  final String humidity;
  final String windSpeed;

  const WeatherMetricsBar(
      {super.key,
      required this.temperature,
      required this.humidity,
      required this.windSpeed,
      this.labelsColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Text(
              'max temp',
              style: TextStyle(color: labelsColor ?? AppColors.primaryAccent),
            ),
            const SizedBox(
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
            const SizedBox(
              height: 4,
            ),
            Text(
              '${temperature}C',
              style: TextStyle(color: labelsColor ?? Colors.black),
            )
          ],
        ),
        Column(
          children: [
            Text(
              'humidity',
              style: TextStyle(color: labelsColor ?? AppColors.primaryAccent),
            ),
            const SizedBox(
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
            const SizedBox(
              height: 4,
            ),
            Text(
              humidity,
              style: TextStyle(color: labelsColor ?? Colors.black),
            )
          ],
        ),
        Column(
          children: [
            Text(
              'wind speed',
              style: TextStyle(color: labelsColor ?? AppColors.primaryAccent),
            ),
            const SizedBox(
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
            const SizedBox(
              height: 4,
            ),
            Text(
              '${windSpeed}km/h',
              style: TextStyle(color: labelsColor ?? Colors.black),
            )
          ],
        ),
      ],
    );
  }
}
