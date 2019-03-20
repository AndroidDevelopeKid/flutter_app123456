import 'package:json_annotation/json_annotation.dart';

part 'NotificationBody.g.dart';
@JsonSerializable()
class NotificationBody{
  int tenantId;
  String notificationName;
  var data;
  String entityType;
  String entityTypeName;
  var entityId;
  int severity;
  String creationTime;
  String id;
  NotificationBody(
      this.tenantId,
      this.id,
      this.data,
      this.creationTime,
      this.entityId,
      this.entityType,
      this.entityTypeName,
      this.notificationName,
      this.severity
      );
  factory NotificationBody.fromJson(Map<String, dynamic> json) => _$NotificationBodyFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationBodyToJson(this);

  NotificationBody.empty();
}