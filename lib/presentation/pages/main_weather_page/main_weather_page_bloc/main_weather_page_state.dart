part of 'main_weather_page_bloc.dart';

class MainWeatherPageState {
  final List<DayWeatherDto> weatherInfo;
  final bool isWeatherLoading;
  final bool isConnectionError;
  final bool isApiRestricted;

  MainWeatherPageState(
      {this.weatherInfo = const [],
      this.isWeatherLoading = false,
      this.isConnectionError = false,
      this.isApiRestricted = false});

  MainWeatherPageState copyWith(
      {List<DayWeatherDto>? weatherInfo,
      bool? isWeatherLoading,
      bool? isConnectionError,
      bool? isApiRestricted}) {
    return MainWeatherPageState(
        weatherInfo: weatherInfo ?? this.weatherInfo,
        isWeatherLoading: isWeatherLoading ?? this.isWeatherLoading,
        isConnectionError: isConnectionError ?? this.isConnectionError,
        isApiRestricted: isApiRestricted ?? this.isApiRestricted);
  }
}
