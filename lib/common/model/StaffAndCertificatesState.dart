import 'package:json_annotation/json_annotation.dart';

part 'StaffAndCertificatesState.g.dart';
@JsonSerializable()
class StaffAndCertificatesState{
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


  StaffAndCertificatesState(
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
  factory StaffAndCertificatesState.fromJson(Map<String, dynamic> json) => _$StaffAndCertificatesStateFromJson(json);
  ///实体类到json
  Map<String, dynamic> toJson() => _$StaffAndCertificatesStateToJson(this);
  ///命名构造函数
  StaffAndCertificatesState.empty();
}