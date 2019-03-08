
import 'package:json_annotation/json_annotation.dart';
part 'Driver.g.dart';
@JsonSerializable()
class Driver{
  bool isAddToUser;
  int originalOUId;
  String ouDisplayName;
  String vehicleCode;
  String signingOrganization;
  String buckupContactPerson;
  String buckupContactPersonPhone;
  String buckupContactPersonAddress;
  String address;
  String birthDate;
  String certificateStartDate;
  String certificateEndDate;
  String nation;
  String nationText;
  String driverIDNumber;
  String driverName;
  String driverPhone;
  String belongVehicleTypeText;
  String personTypeText;
  String personStateText;
  String joiningDate;
  String expectedWorkDate;
  String dlCertificateEndDate;
  String dlCertificateYears;
  String dlCertificateFirstDate;
  String residenceTypeText;
  String oprationLicenseID;
  String workLicenseEndDate;
  Driver(
      this.address,
      this.belongVehicleTypeText,
      this.birthDate,
      this.buckupContactPerson,
      this.buckupContactPersonAddress,
      this.buckupContactPersonPhone,
      this.certificateEndDate,
      this.certificateStartDate,
      this.dlCertificateEndDate,
      this.dlCertificateFirstDate,
      this.dlCertificateYears,
      this.driverIDNumber,
      this.driverName,
      this.driverPhone,
      this.expectedWorkDate,
      this.isAddToUser,
      this.joiningDate,
      this.nation,
      this.nationText,
      this.oprationLicenseID,
      this.originalOUId,
      this.ouDisplayName,
      this.personStateText,
      this.personTypeText,
      this.residenceTypeText,
      this.signingOrganization,
      this.vehicleCode,
      this.workLicenseEndDate
      );

  ///json转换为实体类
  factory Driver.fromJson(Map<String, dynamic> json) => _$DriverFromJson(json);
  ///实体类到json
  Map<String, dynamic> toJson() => _$DriverToJson(this);
  ///命名构造函数
  Driver.empty();
}