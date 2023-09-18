import 'package:hive/hive.dart';

part 'location_dto.g.dart';

@HiveType(typeId: 1)
class LocationDto extends HiveObject {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final double lat;

  @HiveField(2)
  final double lon;

  @HiveField(3)
  final String fullName;

  LocationDto(
      {required this.name,
      required this.lat,
      required this.lon,
      required this.fullName});

  factory LocationDto.fromJson(Map<String, dynamic> json) {
    return LocationDto(
        name: (json['display_name'] as String).split(', ')[0],
        lat: double.parse(json['lat']),
        lon: double.parse(json['lon']),
        fullName: json['display_name']
    );
  }
}
