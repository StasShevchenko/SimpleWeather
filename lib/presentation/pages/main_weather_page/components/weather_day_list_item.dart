import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:simple_weather/assets/colors/app_colors.dart';
import 'package:simple_weather/data/models/day_weather_dto.dart';

class WeatherDayListItem extends StatelessWidget {
  final Function onItemClicked;
  final DayWeatherDto weatherData;
  final bool isToday;

  const WeatherDayListItem({
    super.key,
    required this.weatherData,
    required this.isToday,
    required this.onItemClicked,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 100,
      ),
      child: Card(
        shadowColor: isToday ? Colors.transparent : Colors.black,
        surfaceTintColor: Colors.white,
        color: isToday ? AppColors.primaryAccent : Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: () => onItemClicked(),
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 4,
                ),
                Text(
                  '${weatherData.maxTemperature}°',
                  style: TextStyle(
                      color: isToday ? Colors.white : AppColors.primaryAccent),
                ),
                const SizedBox(
                  height: 4,
                ),
                SizedBox(
                  width: 40,
                  height: 40,
                  child:
                      FittedBox(child: SvgPicture.asset(weatherData.imagePath)),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  DateFormat('EEEE').format(weatherData.time),
                  style: TextStyle(
                      color: isToday ? Colors.white : AppColors.primaryAccent),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
