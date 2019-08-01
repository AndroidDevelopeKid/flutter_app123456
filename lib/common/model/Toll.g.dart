// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Toll.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Toll _$TollFromJson(Map<String, dynamic> json) {
  return Toll(json['vehicleCode'] as String, json['mainVehiclePlate'] as String,
      json['id'] as String);
}

Map<String, dynamic> _$TollToJson(Toll instance) => <String, dynamic>{
      'vehicleCode': instance.vehicleCode,
      'mainVehiclePlate': instance.mainVehiclePlate,
      'id': instance.id
    };
