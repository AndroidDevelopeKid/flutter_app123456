import 'package:json_annotation/json_annotation.dart';

part 'StaffAndCertificatesState.g.dart';
@JsonSerializable()
class StaffAndCertificatesState{
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


  StaffAndCertificatesState(
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
  factory StaffAndCertificatesState.fromJson(Map<String, dynamic> json) => _$StaffAndCertificatesStateFromJson(json);
  ///实体类到json
  Map<String, dynamic> toJson() => _$StaffAndCertificatesStateToJson(this);
  ///命名构造函数
  StaffAndCertificatesState.empty();
}