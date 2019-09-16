import 'package:json_annotation/json_annotation.dart';

part 'Queue.g.dart';
@JsonSerializable()
class Queue{
  Queue(
      this.vehicleCode,
      this.mainVehiclePlate,
      this.id,
      this.driverIDCardNumber,
      this.frontInnerQueueVehicleAmount,
      this.frontTotalQueueVehicleAmount,
      this.queueChangeDateTime,
      this.queueDateTime,
      this.queueSource,
      this.queueState,
      this.message,
      this.organizationTypeText,
      this.queueStateText
      );
  String vehicleCode;
  String mainVehiclePlate;
  String driverIDCardNumber;
  String queueDateTime;
  int queueState;
  String queueStateText;
  int frontInnerQueueVehicleAmount;
  int frontTotalQueueVehicleAmount;
  int queueSource;
  String organizationTypeText;
  String queueChangeDateTime;
  String id;
  String message;

  factory Queue.fromJson(Map<String, dynamic> json) => _$QueueFromJson(json);

  Map<String, dynamic> toJson() => _$QueueToJson(this);

  Queue.empty();
}