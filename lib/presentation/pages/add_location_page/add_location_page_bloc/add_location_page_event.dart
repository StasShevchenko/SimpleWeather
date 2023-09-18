part of 'add_location_page_bloc.dart';

sealed class AddLocationPageEvent {}

class SearchEntered extends AddLocationPageEvent {
  final String value;

  SearchEntered({required this.value});
}

class PageRefreshed extends AddLocationPageEvent {}

class LocationAdded extends AddLocationPageEvent {
  final LocationDto location;

  LocationAdded({required this.location});
}
