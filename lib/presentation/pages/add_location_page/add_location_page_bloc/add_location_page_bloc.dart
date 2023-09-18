import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:simple_weather/data/local_data_source/local_locations_data_source.dart';
import 'package:simple_weather/data/models/location_dto.dart';
import 'package:simple_weather/data/remote_data_source/remote_locations_data_source.dart';

part 'add_location_page_event.dart';

part 'add_location_page_state.dart';

class AddLocationPageBloc
    extends Bloc<AddLocationPageEvent, AddLocationPageState> {
  RemoteLocationsDataSource remoteDataSource = RemoteLocationsDataSource();
  LocalLocationsDataSource localDataSource = LocalLocationsDataSource();

  AddLocationPageBloc() : super(AddLocationPageState()) {
    on<AddLocationPageEvent>((event, emit) async {
      switch (event) {
        case SearchEntered searchEvent:
          _searchLocations(searchEvent.value);
        case PageRefreshed():
          _searchLocations();
        case LocationAdded():
      }
    });
  }

  Future<void> _searchLocations([String? searchQuery]) async {
    try {
      emit(state.copyWith(isSearchLoading: true, searchValue: searchQuery));
      final locations = await remoteDataSource.getLocationsByName(
          locationName: state.searchValue);
      emit(state.copyWith(locations: locations, isSearchLoading: false));
    } on DioException catch (exception) {
      if (exception.type == DioExceptionType.connectionTimeout ||
          exception.error is SocketException ||
          exception.type == DioExceptionType.connectionError) {
        emit(state.copyWith(isSearchLoading: false, isConnectionError: true));
      }
    }
  }
}
