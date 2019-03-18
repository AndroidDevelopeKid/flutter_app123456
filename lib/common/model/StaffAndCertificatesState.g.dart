// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'StaffAndCertificatesState.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StaffAndCertificatesState _$StaffAndCertificatesStateFromJson(
    Map<String, dynamic> json) {
  return StaffAndCertificatesState(
      json['businessCreationUserId'] as int,
      json['businessType'] as String,
      json['creatorUserName'] as String,
      json['description'] as String,
      json['endDate'] as String,
      json['handleStatus'] as String,
      json['handleStatusText'] as String,
      json['handleType'] as String,
      json['handleTypeText'] as String,
      json['id'] as String,
      json['vehicleAffairsStatus'] as String,
      json['vehicleAffairsStatusText'] as String,
      json['vehicleAffairsType'] as String,
      json['vehicleAffairsTypeText'] as String,
      json['vehicleCode'] as String,
      json['vehicleStateFlag'] as int);
}

Map<String, dynamic> _$StaffAndCertificatesStateToJson(
        StaffAndCertificatesState instance) =>
    <String, dynamic>{
      'businessType': instance.businessType,
      'vehicleCode': instance.vehicleCode,
      'handleType': instance.handleType,
      'handleTypeText': instance.handleTypeText,
      'handleStatus': instance.handleStatus,
      'handleStatusText': instance.handleStatusText,
      'vehicleAffairsStatus': instance.vehicleAffairsStatus,
      'vehicleAffairsStatusText': instance.vehicleAffairsStatusText,
      'vehicleAffairsType': instance.vehicleAffairsType,
      'vehicleAffairsTypeText': instance.vehicleAffairsTypeText,
      'vehicleStateFlag': instance.vehicleStateFlag,
      'endDate': instance.endDate,
      'description': instance.description,
      'businessCreationUserId': instance.businessCreationUserId,
      'creatorUserName': instance.creatorUserName,
      'id': instance.id
    };
