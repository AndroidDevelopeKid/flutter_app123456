import 'package:json_annotation/json_annotation.dart';

part 'Notification.g.dart';
@JsonSerializable()
class Notification{
  int unreadCount;
  int totalCount;
  var items;
  Notification(
      this.items,
      this.totalCount,
      this.unreadCount
      );
  factory Notification.fromJson(Map<String, dynamic> json) => _$NotificationFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationToJson(this);

  Notification.empty();

}



