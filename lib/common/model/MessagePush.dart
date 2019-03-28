
import 'package:json_annotation/json_annotation.dart';

part 'MessagePush.g.dart';
@JsonSerializable()
class MessagePush{
  ///消息id
  String id;
  ///消息状态
  int isRead;
  ///消息
  String msg;
  ///来源
  String messageSource;
  ///标识
  String messageFlag;
  ///发送人
  String senderUserName;
  ///创建时间
  String creationTime;

  MessagePush(this.id, this.isRead, this.msg, this.senderUserName, this.messageSource, this.messageFlag, this.creationTime);

  factory MessagePush.fromJson(Map<String, dynamic> json) => _$MessagePushFromJson(json);

  Map<String, dynamic> toJson() => _$MessagePushToJson(this);

}