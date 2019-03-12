import 'package:json_annotation/json_annotation.dart';

part 'VehicleState.g.dart';
@JsonSerializable()
class VehicleState{
  int BussinessType;
  String VehicleCode;
  String HandleType;
  String HandleTypeText;
  String HandleStatus;
  String HandleStatusText;
  String VehicleAffairsStatus;
  String VehicleAffairsStatusText;
  String VehicleAffairsType;
  String VehicleAffairsTypeText;
  int VehicleStateFlag;
  String EndDate;
  String Description;
  int BussinessCreationUserId;
  String CreatorUserName;
  String Id;
  VehicleState(
      this.BussinessCreationUserId,
      this.BussinessType,
      this.CreatorUserName,
      this.Description,
      this.EndDate,
      this.HandleStatus,
      this.HandleStatusText,
      this.HandleType,
      this.HandleTypeText,
      this.Id,
      this.VehicleAffairsStatus,
      this.VehicleAffairsStatusText,
      this.VehicleAffairsType,
      this.VehicleAffairsTypeText,
      this.VehicleCode,
      this.VehicleStateFlag

      );

  ///json转换为实体类
  factory VehicleState.fromJson(Map<String, dynamic> json) => _$VehicleStateFromJson(json);
  ///实体类到json
  Map<String, dynamic> toJson() => _$VehicleStateToJson(this);
  ///命名构造函数
  VehicleState.empty();
}