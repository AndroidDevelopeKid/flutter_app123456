// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'NotificationBody.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationBody _$NotificationBodyFromJson(Map<String, dynamic> json) {
  return NotificationBody(
      json['tenantId'] as int,
      json['id'] as String,
      json['data'],
      json['creationTime'] as String,
      json['entityId'],
      json['entityType'] as String,
      json['entityTypeName'] as String,
      json['notificationName'] as String,
      json['severity'] as int);
}

Map<String, dynamic> _$NotificationBodyToJson(NotificationBody instance) =>
    <String, dynamic>{
      'tenantId': instance.tenantId,
      'notificationName': instance.notificationName,
      'data': instance.data,
      'entityType': instance.entityType,
      'entityTypeName': instance.entityTypeName,
      'entityId': instance.entityId,
      'severity': instance.severity,
      'creationTime': instance.creationTime,
      'id': instance.id
    };
