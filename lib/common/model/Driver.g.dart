// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Driver.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Driver _$DriverFromJson(Map<String, dynamic> json) {
  return Driver(
      json['address'] as String,
      json['belongVehicleTypeText'] as String,
      json['birthDate'] as String,
      json['buckupContactPerson'] as String,
      json['buckupContactPersonAddress'] as String,
      json['buckupContactPersonPhone'] as String,
      json['certificateEndDate'] as String,
      json['certificateStartDate'] as String,
      json['dlCertificateEndDate'] as String,
      json['dlCertificateFirstDate'] as String,
      json['dlCertificateYears'] as String,
      json['driverIDNumber'] as String,
      json['driverName'] as String,
      json['driverPhone'] as String,
      json['expectedWorkDate'] as String,
      json['isAddToUser'] as bool,
      json['joiningDate'] as String,
      json['nation'] as String,
      json['nationText'] as String,
      json['oprationLicenseID'] as String,
      json['originalOUId'] as int,
      json['ouDisplayName'] as String,
      json['personStateText'] as String,
      json['personTypeText'] as String,
      json['residenceTypeText'] as String,
      json['signingOrganization'] as String,
      json['vehicleCode'] as String,
      json['workLicenseEndDate'] as String);
}

Map<String, dynamic> _$DriverToJson(Driver instance) => <String, dynamic>{
      'isAddToUser': instance.isAddToUser,
      'originalOUId': instance.originalOUId,
      'ouDisplayName': instance.ouDisplayName,
      'vehicleCode': instance.vehicleCode,
      'signingOrganization': instance.signingOrganization,
      'buckupContactPerson': instance.buckupContactPerson,
      'buckupContactPersonPhone': instance.buckupContactPersonPhone,
      'buckupContactPersonAddress': instance.buckupContactPersonAddress,
      'address': instance.address,
      'birthDate': instance.birthDate,
      'certificateStartDate': instance.certificateStartDate,
      'certificateEndDate': instance.certificateEndDate,
      'nation': instance.nation,
      'nationText': instance.nationText,
      'driverIDNumber': instance.driverIDNumber,
      'driverName': instance.driverName,
      'driverPhone': instance.driverPhone,
      'belongVehicleTypeText': instance.belongVehicleTypeText,
      'personTypeText': instance.personTypeText,
      'personStateText': instance.personStateText,
      'joiningDate': instance.joiningDate,
      'expectedWorkDate': instance.expectedWorkDate,
      'dlCertificateEndDate': instance.dlCertificateEndDate,
      'dlCertificateYears': instance.dlCertificateYears,
      'dlCertificateFirstDate': instance.dlCertificateFirstDate,
      'residenceTypeText': instance.residenceTypeText,
      'oprationLicenseID': instance.oprationLicenseID,
      'workLicenseEndDate': instance.workLicenseEndDate
    };
