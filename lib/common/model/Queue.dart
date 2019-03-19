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
      this.queueState
      );
  String vehicleCode;
  String mainVehiclePlate;
  String driverIDCardNumber;
  String queueDateTime;
  String queueState;
  int frontInnerQueueVehicleAmount;
  int frontTotalQueueVehicleAmount;
  String queueSource;
  String queueChangeDateTime;
  String id;

  factory Queue.fromJson(Map<String, dynamic> json) => _$QueueFromJson(json);

  Map<String, dynamic> toJson() => _$QueueToJson(this);

  Queue.empty();
}