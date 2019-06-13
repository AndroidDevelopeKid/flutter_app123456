
import 'package:json_annotation/json_annotation.dart';
part 'Driver.g.dart';
@JsonSerializable()
class Driver{
  //bool isAddToUser;
  //int originalOUId;
  String ouDisplayName;//所属物流公司
  String vehicleCode;//车辆编号
  //String signingOrganization;
  String buckupContactPerson;//备用联系人
  String buckupContactPersonPhone;//备用联系方式
  String buckupContactPersonAddress;//备用联系地址
  //String address;
  //String birthDate;
  //String certificateStartDate;
  String certificateEndDate;//身份证到期日期
  //String nation;
  //String nationText;
  String driverIDNumber;//身份证号
  String driverName;//姓名
  String driverPhone;//联系电话
  //String belongVehicleTypeText;
  String personTypeText;//人员类型
  String personStateText;//人员状态
  //String joiningDate;
  //String expectedWorkDate;
  String dlCertificateEndDate;//驾驶证到期日期
  //String dlCertificateYears;
  //String dlCertificateFirstDate;
  //String residenceTypeText;
  //String oprationLicenseID;
  //String workLicenseEndDate;
  String driverLicenseID;//驾驶证号
  Driver(
//      this.address,
//      this.belongVehicleTypeText,
//      this.birthDate,
      this.buckupContactPerson,
      this.buckupContactPersonAddress,
      this.buckupContactPersonPhone,
      this.certificateEndDate,
//      this.certificateStartDate,
      this.dlCertificateEndDate,
//      this.dlCertificateFirstDate,
//      this.dlCertificateYears,
      this.driverIDNumber,
      this.driverName,
      this.driverPhone,
//      this.expectedWorkDate,
//      this.isAddToUser,
//      this.joiningDate,
//      this.nation,
//      this.nationText,
//      this.oprationLicenseID,
//      this.originalOUId,
      this.ouDisplayName,
      this.personStateText,
      this.personTypeText,
//      this.residenceTypeText,
//      this.signingOrganization,
      this.vehicleCode,
//      this.workLicenseEndDate,
      this.driverLicenseID
      );

  ///json转换为实体类
  factory Driver.fromJson(Map<String, dynamic> json) => _$DriverFromJson(json);
  ///实体类到json
  Map<String, dynamic> toJson() => _$DriverToJson(this);
  ///命名构造函数
  Driver.empty();
}