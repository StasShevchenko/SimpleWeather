import 'package:hive/hive.dart';
import 'package:simple_weather/data/models/location_dto.dart';

class LocalLocationsDataSource {
   final box = Hive.box('locationsBox');

  Future<bool> addLocation(LocationDto locationDto) async {
    final currentValues = box.values.map((e) => e as LocationDto).toList();
    for(var value in currentValues) {
      if(value.fullName == locationDto.fullName) {
        return false;
      }
    }
    await box.add(locationDto);
    return true;
  }

  Future<LocationDto> getLocationByKey(dynamic locationKey) async {
    return await box.get(locationKey);
  }

  Future<List<LocationDto>> getAllLocations() async {
    return box.values.map((e) => e as LocationDto).toList();
  }

}
