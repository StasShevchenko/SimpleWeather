part of 'add_location_page_bloc.dart';

class AddLocationPageState {
  final List<LocationDto> locations;
  final String searchValue;
  final bool isSearchLoading;
  final bool isConnectionError;
  final int isLocationAdded;

  AddLocationPageState(
      {this.locations = const [],
      this.searchValue = '',
      this.isSearchLoading = false,
      this.isConnectionError = false,
      this.isLocationAdded = 0});

  AddLocationPageState copyWith(
      {List<LocationDto>? locations,
      String? searchValue,
      bool? isSearchLoading,
      bool? isConnectionError,
      int? isLocationAdded}) {
    return AddLocationPageState(
        locations: locations ?? this.locations,
        searchValue: searchValue ?? this.searchValue,
        isSearchLoading: isSearchLoading ?? this.isSearchLoading,
        isConnectionError: isConnectionError ?? this.isConnectionError,
        isLocationAdded: isLocationAdded ?? this.isLocationAdded);
  }
}
