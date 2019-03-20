// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Notification _$NotificationFromJson(Map<String, dynamic> json) {
  return Notification(
      json['items'], json['totalCount'] as int, json['unreadCount'] as int);
}

Map<String, dynamic> _$NotificationToJson(Notification instance) =>
    <String, dynamic>{
      'unreadCount': instance.unreadCount,
      'totalCount': instance.totalCount,
      'items': instance.items
    };
