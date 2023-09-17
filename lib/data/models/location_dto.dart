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
  final String state;

  LocationDto(
      {required this.name,
      required this.state,
      required this.lat,
      required this.lon});

  factory LocationDto.fromJson(Map<String, dynamic> json) {
    return LocationDto(
        name: json['name'],
        state: json['state'],
        lat: json['lat'],
        lon: json['lon']);
  }
}
