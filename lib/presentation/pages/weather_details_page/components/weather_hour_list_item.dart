import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:simple_weather/assets/colors/app_colors.dart';
import 'package:simple_weather/data/models/hour_weather_dto.dart';

class WeatherHourListItem extends StatelessWidget {
  final HourWeatherDto weatherInfo;

  const WeatherHourListItem({
    super.key,
    required this.weatherInfo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(.5),
              blurRadius: 5.0,
              spreadRadius: 2.0,
              offset: const Offset(
                0, // Move to right 10  horizontally
                0,
              ),
            )
          ]),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              width: 8,
            ),
            Text(
              DateFormat('dd MMMM HH:mm').format(weatherInfo.time),
              style: TextStyle(color: AppColors.primaryAccent),
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              '${weatherInfo.maxTemperature}°',
              style: TextStyle(color: AppColors.primaryAccent),
            ),
            const SizedBox(
              width: 8,
            ),
            SizedBox(
              width: 100,
              height: 80,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 40,
                    height: 40,
                    child: FittedBox(
                      child: SvgPicture.asset(weatherInfo.imagePath),
                    ),
                  ),
                  Text(weatherInfo.shortWeatherDescription)
                ],
              ),
            ),
            const SizedBox(
              width: 16,
            )
          ],
        ),
      ),
    );
  }
}
