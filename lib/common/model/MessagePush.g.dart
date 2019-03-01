// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MessagePush.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessagePush _$MessagePushFromJson(Map<String, dynamic> json) {
  return MessagePush(
      json['id'] as String, json['isRead'] as bool, json['msg'] as String);
}

Map<String, dynamic> _$MessagePushToJson(MessagePush instance) =>
    <String, dynamic>{
      'id': instance.id,
      'isRead': instance.isRead,
      'msg': instance.msg
    };
