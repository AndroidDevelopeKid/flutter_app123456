import 'package:json_annotation/json_annotation.dart';

part 'VehicleState.g.dart';
@JsonSerializable()
class VehicleState{
  String businessType;
  String vehicleCode;
  String handleType;
  String handleTypeText;
  String handleStatus;
  String handleStatusText;
  String vehicleAffairsStatus;
  String vehicleAffairsStatusText;
  String vehicleAffairsType;
  String vehicleAffairsTypeText;
  int vehicleStateFlag;
  String endDate;
  String description;
  int businessCreationUserId;
  String creatorUserName;
  String id;
  VehicleState(
      this.businessCreationUserId,
      this.businessType,
      this.creatorUserName,
      this.description,
      this.endDate,
      this.handleStatus,
      this.handleStatusText,
      this.handleType,
      this.handleTypeText,
      this.id,
      this.vehicleAffairsStatus,
      this.vehicleAffairsStatusText,
      this.vehicleAffairsType,
      this.vehicleAffairsTypeText,
      this.vehicleCode,
      this.vehicleStateFlag

      );

  ///json转换为实体类
  factory VehicleState.fromJson(Map<String, dynamic> json) => _$VehicleStateFromJson(json);
  ///实体类到json
  Map<String, dynamic> toJson() => _$VehicleStateToJson(this);
  ///命名构造函数
  VehicleState.empty();
}