// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MessageData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageData _$MessageDataFromJson(Map<String, dynamic> json) {
  return MessageData(
      json['messageFlag'] as String,
      json['messageSource'] as int,
      json['messageText'] as String,
      json['properties'],
      json['senderUserName'] as String,
      json['type'] as String);
}

Map<String, dynamic> _$MessageDataToJson(MessageData instance) =>
    <String, dynamic>{
      'messageSource': instance.messageSource,
      'messageFlag': instance.messageFlag,
      'messageText': instance.messageText,
      'senderUserName': instance.senderUserName,
      'type': instance.type,
      'properties': instance.properties
    };
