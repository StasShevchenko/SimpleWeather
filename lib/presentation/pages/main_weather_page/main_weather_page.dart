import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:simple_weather/assets/colors/app_colors.dart';
import 'package:simple_weather/data/models/location_dto.dart';
import 'package:simple_weather/presentation/pages/main_weather_page/components/main_weather_page_app_bar.dart';
import 'package:simple_weather/presentation/pages/main_weather_page/components/weather_day_list_item.dart';
import 'package:simple_weather/presentation/pages/weather_details_page/weather_details_page.dart';
import 'package:simple_weather/presentation/ui_kit/weather_loader.dart';
import 'package:simple_weather/presentation/ui_kit/weather_metrics_bar.dart';

import 'main_weather_page_bloc/main_weather_page_bloc.dart';

class MainWeatherPage extends StatelessWidget {
  final LocationDto currentLocation;

  const MainWeatherPage({super.key, required this.currentLocation});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          MainWeatherPageBloc(currentLocation: currentLocation),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocBuilder<MainWeatherPageBloc, MainWeatherPageState>(
          builder: (context, state) {
            final bloc = context.read<MainWeatherPageBloc>();

            if (state.isConnectionError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Error! Check your internet connection!'),
                    const SizedBox(
                      height: 16,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          bloc.add(PageRefreshed());
                        },
                        child: const Text('Try again'))
                  ],
                ),
              );
            }
            if (state.isApiRestricted) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                        'Error! Too many requests in one hour, pleasy try in next hour!'),
                    const SizedBox(
                      height: 16,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        bloc.add(
                          PageRefreshed(),
                        );
                      },
                      child: const Text('Try again'),
                    )
                  ],
                ),
              );
            }
            if (state.isWeatherLoading) {
              return const WeatherLoader();
            }
            else {
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
                                  DateFormat('EEEE, dd MMMM')
                                      .format(state.weatherInfo[0].time),
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
                                                  vertical: 16.0,
                                                  horizontal: 24.0),
                                              child: Text(
                                                '${state.weatherInfo[0].maxTemperature}°',
                                                style: TextStyle(
                                                    fontSize: 48,
                                                    color: AppColors.primary),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 16,
                                          ),
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: Padding(
                                              padding: const EdgeInsets.symmetric(
                                                  vertical: 16.0,
                                                  horizontal: 24.0),
                                              child: Text(
                                                state.weatherInfo[0]
                                                    .shortWeatherDescription,
                                                style: const TextStyle(
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
                                        state.weatherInfo[0].imagePath,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 32,
                              ),
                              Padding(
                                  padding: EdgeInsets.all(4.0),
                                  child: WeatherMetricsBar(
                                    temperature:
                                        state.weatherInfo[0].maxTemperature,
                                    humidity: state.weatherInfo[0].humidity,
                                    windSpeed: state.weatherInfo[0].windSpeed,
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
                                  itemCount: state.weatherInfo.length,
                                  itemBuilder: (context, index) => Padding(
                                    padding: const EdgeInsets.only(right: 12.0),
                                    child: WeatherDayListItem(
                                      weatherData: state.weatherInfo[index],
                                      isToday: index == 0,
                                      onItemClicked: () =>
                                          Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (_) => WeatherDetailsPage(
                                              weatherInfo:
                                                  state.weatherInfo[index],
                                              locationInfo: currentLocation),
                                        ),
                                      ),
                                    ),
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
            }
          },
        ),
      ),
    );
  }
}
