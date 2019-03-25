
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

  MessagePush(this.id, this.isRead, this.msg);

  factory MessagePush.fromJson(Map<String, dynamic> json) => _$MessagePushFromJson(json);

  Map<String, dynamic> toJson() => _$MessagePushToJson(this);

}