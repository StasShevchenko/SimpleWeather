import '../utils/weather_code_info.dart';
import 'hour_weather_dto.dart';

class DayWeatherDto {
  final DateTime time;
  final String maxTemperature;
  final String humidity;
  final String windSpeed;
  final String shortWeatherDescription;
  final String imagePath;
  List<HourWeatherDto> hoursWeatherItems = [];

  DayWeatherDto(
      {required this.time,
      required this.maxTemperature,
      required this.humidity,
      required this.windSpeed,
      required this.shortWeatherDescription,
      required this.imagePath,
      });

  factory DayWeatherDto.fromJson(Map<String, dynamic> json) {
    return DayWeatherDto(
        time: DateTime.parse(json['time']),
        maxTemperature: json['values']['temperatureMax'].toStringAsFixed(0),
        humidity: json['values']['humidityMax'].toStringAsFixed(0),
        windSpeed: json['values']['windSpeedAvg'].toStringAsFixed(0),
        shortWeatherDescription:
            getWeatherDescription(json['values']['weatherCodeMax'].toString()),
        imagePath:
            getWeatherImage(json['values']['weatherCodeMax'].toString()));
  }
}
