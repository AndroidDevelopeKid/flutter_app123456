import 'package:json_annotation/json_annotation.dart';

part 'NotificationItem.g.dart';
@JsonSerializable()
class NotificationItem{
  int tenantId;
  int userId;
  int state;
  var notification;
  String id;
  NotificationItem(
      this.id,
      this.userId,
      this.tenantId,
      this.notification,
      this.state
      );
  factory NotificationItem.fromJson(Map<String, dynamic> json) => _$NotificationItemFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationItemToJson(this);

  NotificationItem.empty();
}