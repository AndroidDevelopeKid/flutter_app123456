// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Refuel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Refuel _$RefuelFromJson(Map<String, dynamic> json) {
  return Refuel(
      json['refuelTime'] as String,
      json['id'] as String,
      json['fillingStation'] as int,
      json['fillingStationText'] as String,
      json['flag'] as int,
      json['fuel'] as int,
      json['fuelText'] as String,
      (json['refuelLitres'] as num)?.toDouble(),
      json['refuelVehicleCode'] as String);
}

Map<String, dynamic> _$RefuelToJson(Refuel instance) => <String, dynamic>{
      'id': instance.id,
      'refuelTime': instance.refuelTime,
      'refuelLitres': instance.refuelLitres,
      'fuel': instance.fuel,
      'fuelText': instance.fuelText,
      'refuelVehicleCode': instance.refuelVehicleCode,
      'fillingStation': instance.fillingStation,
      'fillingStationText': instance.fillingStationText,
      'flag': instance.flag
    };
