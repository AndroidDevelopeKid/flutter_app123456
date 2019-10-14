// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'NotificationItem.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationItem _$NotificationItemFromJson(Map<String, dynamic> json) {
  return NotificationItem(
    json['id'] as String,
    json['userId'] as int,
    json['tenantId'] as int,
    json['notification'],
    json['state'] as int,
  );
}

Map<String, dynamic> _$NotificationItemToJson(NotificationItem instance) =>
    <String, dynamic>{
      'tenantId': instance.tenantId,
      'userId': instance.userId,
      'state': instance.state,
      'notification': instance.notification,
      'id': instance.id,
    };
