// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Refuel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Refuel _$RefuelFromJson(Map<String, dynamic> json) {
  return Refuel(
      json['vehicleCode'] as String,
      json['mainVehiclePlate'] as String,
      json['id'] as String,
      json['refuelTime'] as String);
}

Map<String, dynamic> _$RefuelToJson(Refuel instance) => <String, dynamic>{
      'vehicleCode': instance.vehicleCode,
      'mainVehiclePlate': instance.mainVehiclePlate,
      'id': instance.id,
      'refuelTime': instance.refuelTime
    };
