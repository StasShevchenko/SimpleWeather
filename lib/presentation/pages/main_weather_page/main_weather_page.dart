import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive/hive.dart';
import 'package:simple_weather/assets/colors/app_colors.dart';
import 'package:simple_weather/data/models/day_weather_dto.dart';
import 'package:simple_weather/data/models/location_dto.dart';
import 'package:simple_weather/presentation/pages/main_weather_page/components/main_weather_page_app_bar.dart';
import 'package:simple_weather/presentation/pages/main_weather_page/components/weather_day_list_item.dart';
import 'package:simple_weather/presentation/pages/main_weather_page/components/weather_metrics_bar.dart';
import 'main_weather_page_bloc/main_weather_page_bloc.dart';

class MainWeatherPage extends StatelessWidget {
  final LocationDto currentLocation;

  const MainWeatherPage({super.key, required this.currentLocation});

  @override
  Widget build(BuildContext context) {
    List<DayWeatherDto> days = [
      DayWeatherDto.fromJson({
        'time': '2023-09-19T09:01:00Z',
        'values': {
          'temperatureMax': 23,
          'humidityMax': 87.95,
          'windSpeedAwg': 2.02,
          'weatherCodeMax': 1000
        },
      }),
      DayWeatherDto.fromJson({
        'time': '2023-09-19T09:01:00Z',
        'values': {
          'temperatureMax': 23,
          'humidityMax': 87.95,
          'windSpeedAwg': 2.02,
          'weatherCodeMax': 1000
        },
      }),
      DayWeatherDto.fromJson({
        'time': '2023-09-19T09:01:00Z',
        'values': {
          'temperatureMax': 23,
          'humidityMax': 87.95,
          'windSpeedAwg': 2.02,
          'weatherCodeMax': 1000
        },
      }),
      DayWeatherDto.fromJson({
        'time': '2023-09-19T09:01:00Z',
        'values': {
          'temperatureMax': 23,
          'humidityMax': 87.95,
          'windSpeedAwg': 2.02,
          'weatherCodeMax': 1000
        },
      }),
      DayWeatherDto.fromJson({
        'time': '2023-09-19T09:01:00Z',
        'values': {
          'temperatureMax': 23,
          'humidityMax': 87.95,
          'windSpeedAwg': 2.02,
          'weatherCodeMax': 1000
        },
      }),
    ];

    return BlocProvider(
      create: (context) =>
          MainWeatherPageBloc(currentLocation: currentLocation),
      child: BlocBuilder<MainWeatherPageBloc, MainWeatherPageState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MainWeatherPageAppBar(title: currentLocation.name),
                    const SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            currentLocation.name,
                            style: TextStyle(
                                fontSize: 36,
                                color: AppColors.primaryAccent,
                                fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 2),
                            child: Text(
                              'Friday, 15 september',
                              style: TextStyle(color: AppColors.primary),
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Stack(
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
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 16.0, horizontal: 24.0),
                                          child: Text(
                                            '16°',
                                            style: TextStyle(
                                                fontSize: 48,
                                                color: AppColors.primary),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 16,
                                      ),
                                      const Align(
                                        alignment: Alignment.centerLeft,
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 16.0, horizontal: 24.0),
                                          child: Text(
                                            'Clear',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 24),
                                          ),
                                        ),
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
                                    'assets/weather_images/clear.svg',
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 32,
                          ),
                          const Padding(
                              padding: EdgeInsets.all(4.0),
                              child: WeatherMetricsBar(
                                temperature: '16',
                                humidity: '58',
                                windSpeed: '6',
                              )),
                          const SizedBox(
                            height: 48,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 0, horizontal: 8),
                            child: Row(
                              children: [
                                const Expanded(
                                  child: Text(
                                    'Today',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    'Next 5 days',
                                    style: TextStyle(
                                        color: AppColors.primaryAccent),
                                    textAlign: TextAlign.end,
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          SizedBox(
                            height: 120,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: days.length,
                              itemBuilder: (context, index) => Padding(
                                padding: const EdgeInsets.only(right: 12.0),
                                child: WeatherDayListItem(
                                    weatherData: days[index], isToday: true),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
