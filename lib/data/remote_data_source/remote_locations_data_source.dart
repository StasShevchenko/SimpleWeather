// http://api.openweathermap.org/geo/1.0
import 'package:dio/dio.dart';

import '../models/location_dto.dart';

class RemoteLocationsDataSource {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.openweathermap.org/geo/1.0',
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
    ),
  );

  final String apiKey = const String.fromEnvironment('API_KEY');

  Future<List<LocationDto>> getLocationsByName(
      {required String locationName}) async {
    List<LocationDto> locations = [];
    final dataList = (await dio.get(
      '/direct',
      queryParameters: {
        'limit': 5,
        'appid': apiKey,
        'q': locationName,
      },
    ))
        .data as List<dynamic>;
    for (Map<String, dynamic> location in dataList) {
      final locationDto = LocationDto.fromJson(location);
      locations.add(locationDto);
    }
    return locations;
  }
}
