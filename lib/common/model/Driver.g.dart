// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Driver.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Driver _$DriverFromJson(Map<String, dynamic> json) {
  return Driver(
    json['buckupContactPerson'] as String,
    json['buckupContactPersonAddress'] as String,
    json['buckupContactPersonPhone'] as String,
    json['certificateEndDate'] as String,
    json['dlCertificateEndDate'] as String,
    json['driverIDNumber'] as String,
    json['driverName'] as String,
    json['driverPhone'] as String,
    json['ouDisplayName'] as String,
    json['personStateText'] as String,
    json['personTypeText'] as String,
    json['vehicleCode'] as String,
    json['driverLicenseID'] as String,
  );
}

Map<String, dynamic> _$DriverToJson(Driver instance) => <String, dynamic>{
      'ouDisplayName': instance.ouDisplayName,
      'vehicleCode': instance.vehicleCode,
      'buckupContactPerson': instance.buckupContactPerson,
      'buckupContactPersonPhone': instance.buckupContactPersonPhone,
      'buckupContactPersonAddress': instance.buckupContactPersonAddress,
      'certificateEndDate': instance.certificateEndDate,
      'driverIDNumber': instance.driverIDNumber,
      'driverName': instance.driverName,
      'driverPhone': instance.driverPhone,
      'personTypeText': instance.personTypeText,
      'personStateText': instance.personStateText,
      'dlCertificateEndDate': instance.dlCertificateEndDate,
      'driverLicenseID': instance.driverLicenseID,
    };
