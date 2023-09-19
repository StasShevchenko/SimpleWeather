import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:simple_weather/data/models/location_dto.dart';
import 'package:simple_weather/data/remote_data_source/remote_weather_data_source.dart';

import '../../../../data/models/day_weather_dto.dart';

part 'main_weather_page_event.dart';

part 'main_weather_page_state.dart';

class MainWeatherPageBloc
    extends Bloc<MainWeatherPageEvent, MainWeatherPageState> {
  RemoteWeatherDataSource weatherDataSource = RemoteWeatherDataSource();

  final LocationDto currentLocation;

  MainWeatherPageBloc({required this.currentLocation})
      : super(MainWeatherPageState()) {
    //_init();
    on<MainWeatherPageEvent>((event, emit) {
      switch (event) {
        case PageRefreshed():
          _init();
      }
    });
  }

  Future<void> _init() async {
    try {
      emit(state.copyWith(isWeatherLoading: true));
      final weatherInfo = await weatherDataSource.getWeekWeatherByCoordinates(
          lat: currentLocation.lat.toString(),
          lon: currentLocation.lon.toString());
      emit(state.copyWith(weatherInfo: weatherInfo, isWeatherLoading: false));
    } on DioException catch (exception) {
      if (exception.response!.statusCode == 429) {
        emit(state.copyWith(isWeatherLoading: false, isApiRestricted: true));
      } else {
        emit(state.copyWith(isConnectionError: true));
      }
    }
  }
}