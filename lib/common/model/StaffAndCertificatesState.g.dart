// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'StaffAndCertificatesState.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StaffAndCertificatesState _$StaffAndCertificatesStateFromJson(
    Map<String, dynamic> json) {
  return StaffAndCertificatesState(
      json['BussinessCreationUserId'] as int,
      json['BussinessType'] as int,
      json['CreatorUserName'] as String,
      json['Description'] as String,
      json['EndDate'] as String,
      json['HandleStatus'] as String,
      json['HandleStatusText'] as String,
      json['HandleType'] as String,
      json['HandleTypeText'] as String,
      json['Id'] as String,
      json['VehicleAffairsStatus'] as String,
      json['VehicleAffairsStatusText'] as String,
      json['VehicleAffairsType'] as String,
      json['VehicleAffairsTypeText'] as String,
      json['VehicleCode'] as String,
      json['VehicleStateFlag'] as int);
}

Map<String, dynamic> _$StaffAndCertificatesStateToJson(
        StaffAndCertificatesState instance) =>
    <String, dynamic>{
      'BussinessType': instance.BussinessType,
      'VehicleCode': instance.VehicleCode,
      'HandleType': instance.HandleType,
      'HandleTypeText': instance.HandleTypeText,
      'HandleStatus': instance.HandleStatus,
      'HandleStatusText': instance.HandleStatusText,
      'VehicleAffairsStatus': instance.VehicleAffairsStatus,
      'VehicleAffairsStatusText': instance.VehicleAffairsStatusText,
      'VehicleAffairsType': instance.VehicleAffairsType,
      'VehicleAffairsTypeText': instance.VehicleAffairsTypeText,
      'VehicleStateFlag': instance.VehicleStateFlag,
      'EndDate': instance.EndDate,
      'Description': instance.Description,
      'BussinessCreationUserId': instance.BussinessCreationUserId,
      'CreatorUserName': instance.CreatorUserName,
      'Id': instance.Id
    };
