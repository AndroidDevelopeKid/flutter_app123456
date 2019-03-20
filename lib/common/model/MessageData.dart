import 'package:json_annotation/json_annotation.dart';

part 'MessageData.g.dart';
@JsonSerializable()
class MessageData{
  int messageSource;
  String messageFlag;
  String messageText;
  String senderUserName;
  String type;
  var properties;
  MessageData(
      this.messageFlag,
      this.messageSource,
      this.messageText,
      this.properties,
      this.senderUserName,
      this.type
      );
  factory MessageData.fromJson(Map<String, dynamic> json) => _$MessageDataFromJson(json);

  Map<String, dynamic> toJson() => _$MessageDataToJson(this);

  MessageData.empty();

}