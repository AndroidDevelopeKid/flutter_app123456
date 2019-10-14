// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MessagePush.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessagePush _$MessagePushFromJson(Map<String, dynamic> json) {
  return MessagePush(
    json['totalCount'] as int,
    json['id'] as String,
    json['isRead'] as int,
    json['msg'] as String,
    json['senderUserName'] as String,
    json['messageSource'] as String,
    json['messageFlag'] as String,
    json['creationTime'] as String,
  );
}

Map<String, dynamic> _$MessagePushToJson(MessagePush instance) =>
    <String, dynamic>{
      'totalCount': instance.totalCount,
      'id': instance.id,
      'isRead': instance.isRead,
      'msg': instance.msg,
      'messageSource': instance.messageSource,
      'messageFlag': instance.messageFlag,
      'senderUserName': instance.senderUserName,
      'creationTime': instance.creationTime,
    };
