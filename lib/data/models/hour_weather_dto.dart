import '../utils/weather_code_info.dart';

class HourWeatherDto {
  final DateTime time;
  final String maxTemperature;
  final String humidity;
  final String windSpeed;
  final String shortWeatherDescription;
  final String imagePath;

  HourWeatherDto(
      {required this.time,
        required this.maxTemperature,
        required this.humidity,
        required this.windSpeed,
        required this.shortWeatherDescription,
        required this.imagePath});

  factory HourWeatherDto.fromJson(Map<String, dynamic> json) {
    return HourWeatherDto(
        time: DateTime.parse(json['time']),
        maxTemperature: json['values']['temperature'].toString(),
        humidity: json['values']['humidity'].toString(),
        windSpeed: json['values']['windSpeed'].toString(),
        shortWeatherDescription: getWeatherDescription(json['values']['weatherCode'].toString()),
        imagePath: getWeatherImage(json['values']['weatherCode'].toString()));
  }
}
