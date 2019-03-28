// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Queue.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Queue _$QueueFromJson(Map<String, dynamic> json) {
  return Queue(
      json['vehicleCode'] as String,
      json['mainVehiclePlate'] as String,
      json['id'] as String,
      json['driverIDCardNumber'] as String,
      json['frontInnerQueueVehicleAmount'] as int,
      json['frontTotalQueueVehicleAmount'] as int,
      json['queueChangeDateTime'] as String,
      json['queueDateTime'] as String,
      json['queueSource'] as String,
      json['queueState'] as String,
      json['message'] as String);
}

Map<String, dynamic> _$QueueToJson(Queue instance) => <String, dynamic>{
      'vehicleCode': instance.vehicleCode,
      'mainVehiclePlate': instance.mainVehiclePlate,
      'driverIDCardNumber': instance.driverIDCardNumber,
      'queueDateTime': instance.queueDateTime,
      'queueState': instance.queueState,
      'frontInnerQueueVehicleAmount': instance.frontInnerQueueVehicleAmount,
      'frontTotalQueueVehicleAmount': instance.frontTotalQueueVehicleAmount,
      'queueSource': instance.queueSource,
      'queueChangeDateTime': instance.queueChangeDateTime,
      'id': instance.id,
      'message': instance.message
    };
