import 'package:json_annotation/json_annotation.dart';

part 'Refuel.g.dart';
@JsonSerializable()
class Refuel{
  Refuel(
      this.refuelTime,
      this.id,
      this.fillingStation,
      this.fillingStationText,
      this.flag,
      this.fuel,
      this.fuelText,
      this.refuelLitres,
      this.refuelVehicleCode
      );

  String id;
  String refuelTime;//加油时间
  double refuelLitres;//加油升数
  int fuel;//油品
  String fuelText;//油品显示文本
  String refuelVehicleCode;//加油车辆编号
  int fillingStation;//加油站
  String fillingStationText;//加油站显示文本
  int flag;//加油标识


  factory Refuel.fromJson(Map<String, dynamic> json) => _$RefuelFromJson(json);

  Map<String, dynamic> toJson() => _$RefuelToJson(this);

  Refuel.empty();
}