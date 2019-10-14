// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AutoOrderState.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AutoOrderState _$AutoOrderStateFromJson(Map<String, dynamic> json) {
  return AutoOrderState(
    json['autoAcceptOrderState'] as int,
    json['nowDeliveryOrderState'] as bool,
    json['nowOrderQueueState'] as bool,
  );
}

Map<String, dynamic> _$AutoOrderStateToJson(AutoOrderState instance) =>
    <String, dynamic>{
      'nowOrderQueueState': instance.nowOrderQueueState,
      'nowDeliveryOrderState': instance.nowDeliveryOrderState,
      'autoAcceptOrderState': instance.autoAcceptOrderState,
    };
