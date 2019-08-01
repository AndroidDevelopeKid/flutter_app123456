import 'package:json_annotation/json_annotation.dart';

part 'Refuel.g.dart';
@JsonSerializable()
class Refuel{
  Refuel(
      this.vehicleCode,
      this.mainVehiclePlate,
      this.id,
      this.refuelTime,
      );
  String vehicleCode;
  String mainVehiclePlate;

  String id;
  String refuelTime;

  factory Refuel.fromJson(Map<String, dynamic> json) => _$RefuelFromJson(json);

  Map<String, dynamic> toJson() => _$RefuelToJson(this);

  Refuel.empty();
}