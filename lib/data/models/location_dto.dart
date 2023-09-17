class LocationDto {
  final String name;
  final double lat;
  final double lon;
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
