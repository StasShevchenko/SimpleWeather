import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:simple_weather/assets/colors/app_colors.dart';
import 'package:simple_weather/data/models/day_weather_dto.dart';
import 'package:simple_weather/presentation/pages/weather_details_page/components/weather_hour_list_item.dart';
import 'package:simple_weather/presentation/ui_kit/weather_metrics_bar.dart';

import '../../../data/models/location_dto.dart';
import '../../../data/utils/weather_code_info.dart';

class WeatherDetailsPage extends StatelessWidget {
  final DayWeatherDto weatherInfo;
  final LocationDto locationInfo;

  const WeatherDetailsPage({
    super.key,
    required this.weatherInfo,
    required this.locationInfo,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryAccent,
      appBar: AppBar(
        backgroundColor: AppColors.primaryAccent,
        title: Text(
          locationInfo.name,
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 8,
            ),
            Text(
              DateFormat('EEEE, dd MMMM').format(weatherInfo.time),
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
            const SizedBox(
              height: 24,
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 60.0),
                            child: Card(
                              shadowColor: Colors.black,
                              elevation: 4,
                              surfaceTintColor: Colors.white,
                              color: AppColors.primaryAccent,
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 24.0,
                                          right: 24.0,
                                          top: 16.0,
                                          bottom: 0),
                                      child: Text(
                                        '16°',
                                        style: TextStyle(
                                            height: 0,
                                            fontSize: 48,
                                            color: AppColors.primary),
                                      ),
                                    ),
                                  ),
                                  const Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          right: 24.0,
                                          left: 24.0,
                                          bottom: 16.0),
                                      child: Text(
                                        'Clear',
                                        style: TextStyle(
                                            height: 0,
                                            color: Colors.white,
                                            fontSize: 24),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0),
                                    child: WeatherMetricsBar(
                                        labelsColor: Colors.white,
                                        temperature: weatherInfo.maxTemperature,
                                        humidity: weatherInfo.humidity,
                                        windSpeed: weatherInfo.windSpeed),
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  )
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 24.0),
                            child: SizedBox(
                              height: 144,
                              width: 144,
                              child: SvgPicture.asset(
                                getWeatherImage('1000'),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: weatherInfo.hoursWeatherItems.length,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                          child: WeatherHourListItem(
                              weatherInfo: weatherInfo.hoursWeatherItems[index]),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
