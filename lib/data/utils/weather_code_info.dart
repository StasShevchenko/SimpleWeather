String getWeatherDescription(String weatherCode) {
  final intWeatherCode = int.parse(weatherCode);
  switch (intWeatherCode) {
    case 1000:
      return 'Clear';
    default:
      return 'Clear';
  }
}

String getWeatherImage(String weatherCode) {
  final intWeatherCode = int.parse(weatherCode);
  switch (intWeatherCode) {
    case 1000:
      return 'assets/weather_images/snowy.svg';
    default:
      return 'assets/weather_images/clear.svg';
  }
}
