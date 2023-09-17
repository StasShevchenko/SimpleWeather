// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LocationDtoAdapter extends TypeAdapter<LocationDto> {
  @override
  final int typeId = 1;

  @override
  LocationDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LocationDto(
      name: fields[0] as String,
      state: fields[3] as String,
      lat: fields[1] as double,
      lon: fields[2] as double,
    );
  }

  @override
  void write(BinaryWriter writer, LocationDto obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.lat)
      ..writeByte(2)
      ..write(obj.lon)
      ..writeByte(3)
      ..write(obj.state);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocationDtoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
