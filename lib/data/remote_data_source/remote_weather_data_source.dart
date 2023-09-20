import 'package:dio/dio.dart';

import '../models/day_weather_dto.dart';
import '../models/hour_weather_dto.dart';

class RemoteWeatherDataSource {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.tomorrow.io/v4/weather',
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
    ),
  );

  final String apiKey = const String.fromEnvironment('WEATHER_API_KEY');

  Future<List<DayWeatherDto>> getWeekWeatherByCoordinates(
      {required String lat, required String lon}) async {
    List<DayWeatherDto> days = [];
    try {
      final data = (await dio.get(
        '/forecast',
        queryParameters: {
          'apikey': apiKey,
          'location': '$lat, $lon',
          'units': 'metric'
        },
      ))
          .data as Map<String, dynamic>;
      for (Map<String, dynamic> weatherItem in data['timelines']['daily']) {
        final weatherDayItem = DayWeatherDto.fromJson(weatherItem);
        for (Map<String, dynamic> weatherHourItem in data['timelines']
            ['hourly']) {
          final hourWeatherItem = HourWeatherDto.fromJson(weatherHourItem);
          final hourTime = hourWeatherItem.time;
          final dayTime = weatherDayItem.time;
          if (hourTime.day == dayTime.day &&
              hourTime.month == dayTime.month &&
              hourTime.year == dayTime.year) {
            weatherDayItem.hoursWeatherItems.add(hourWeatherItem);
          }
        }
        days.add(weatherDayItem);
      }
      return days;
    } on DioException catch (exception) {
      if (exception.response!.statusCode == 400) {
        return [];
      }
      return [];
    }
  }
}
