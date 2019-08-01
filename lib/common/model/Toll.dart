import 'package:json_annotation/json_annotation.dart';

part 'Toll.g.dart';
@JsonSerializable()
class Toll{
  Toll(
      this.vehicleCode,
      this.mainVehiclePlate,
      this.id,
      );
  String vehicleCode;
  String mainVehiclePlate;

  String id;

  factory Toll.fromJson(Map<String, dynamic> json) => _$TollFromJson(json);

  Map<String, dynamic> toJson() => _$TollToJson(this);

  Toll.empty();
}