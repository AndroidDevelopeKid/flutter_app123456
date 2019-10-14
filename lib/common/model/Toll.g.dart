// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Toll.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Toll _$TollFromJson(Map<String, dynamic> json) {
  return Toll(
    json['id'] as String,
    json['vehicleCode'] as String,
    json['customerId'] as int,
    json['customerIdName'] as String,
    json['driverName'] as String,
    json['happenDate'] as String,
    (json['taxAmount'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$TollToJson(Toll instance) => <String, dynamic>{
      'happenDate': instance.happenDate,
      'vehicleCode': instance.vehicleCode,
      'driverName': instance.driverName,
      'taxAmount': instance.taxAmount,
      'customerId': instance.customerId,
      'customerIdName': instance.customerIdName,
      'id': instance.id,
    };
