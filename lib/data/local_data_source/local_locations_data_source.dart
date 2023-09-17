import 'package:hive/hive.dart';
import 'package:simple_weather/data/models/location_dto.dart';

class LocalLocationsDataSource {
   final box = Hive.box('locationsBox');

  Future<void> addLocation(LocationDto locationDto) async {
    await box.add(locationDto);
  }

  Future<LocationDto> getLocationByKey(dynamic locationKey) async {
    return await box.get(locationKey);
  }

  Future<List<LocationDto>> getAllLocations() async {
    return box.values.map((e) => e as LocationDto).toList();
  }

}
