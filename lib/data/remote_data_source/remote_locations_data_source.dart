// http://api.openweathermap.org/geo/1.0
import 'package:dio/dio.dart';

import '../models/location_dto.dart';

class RemoteLocationsDataSource {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://us1.locationiq.com/v1',
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
    ),
  );

  final String apiKey = const String.fromEnvironment('GEO_API_KEY');

  Future<List<LocationDto>> getLocationsByName(
      {required String locationName}) async {
    List<LocationDto> locations = [];
      final data = (await dio.get(
        '/search',
        queryParameters: {
          'key': apiKey,
          'format': 'json',
          'q': locationName,
        },
      ))
          .data as List<dynamic>;
      for (Map<String, dynamic> locationJson in data) {
        final location = LocationDto.fromJson(locationJson);
        locations.add(location);
      }
      return locations;
    }
}
