String getWeatherDescription(String weatherCode) {
  final intWeatherCode = int.parse(weatherCode);
  switch (intWeatherCode) {
    case 1000:
      return 'Clear';
    case 1100:
      return 'Mostly Clear';
    case >= 1101 && <=1103:
      return 'Cloudy';
    case 2100 || 2000:
      return 'Fog';
    case >=2101 && <=2108:
      return 'Mostly Clear';
    case >=4000 && <= 4201:
      return 'Rain';
    case >=4203 && <= 4212:
      return 'Light Rain';
    case >= 5001 && <= 5101:
      return 'Snow';
    case >= 5115 && <= 7103:
      return 'Light Snow';
    case >= 8000 && <= 8002:
      return 'Thunder';
    default:
      return 'Clear';
  }
}

String getWeatherImage(String weatherCode) {
  final intWeatherCode = int.parse(weatherCode);
  switch (intWeatherCode) {
    case 1000:
      return 'assets/weather_images/clear.svg';
    case 1100:
      return 'assets/weather_images/partial_cloudy.svg';
    case >= 1101 && <=1103:
      return 'assets/weather_images/cloudy.svg';
    case 2100 || 2000:
      return 'assets/weather_images/foggy.svg';
    case >=2101 && <=2108:
      return 'assets/weather_images/partial_cloudy.svg';
    case >=4000 && <= 4201:
      return 'assets/weather_images/rain.svg';
    case >=4203 && <= 4212:
      return 'assets/weather_images/rain.svg';
    case >= 5001 && <= 5101:
      return 'assets/weather_images/snowy.svg';
    case >= 5115 && <= 7103:
      return 'assets/weather_images/snowy.svg';
    case >= 8000 && <= 8002:
      return 'assets/weather_images/thunder.svg';
    default:
      return 'assets/weather_images/clear.svg';
  }
}
