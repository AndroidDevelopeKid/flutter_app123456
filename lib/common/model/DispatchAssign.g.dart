// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DispatchAssign.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DispatchAssign _$DispatchAssignFromJson(Map<String, dynamic> json) {
  return DispatchAssign(
      json['id'] as String,
      json['vehicleCode'] as String,
      json['isActive'] as bool,
      json['organizationUnitName'] as String,
      json['organizationUnitId'] as int,
      json['group'] as String,
      json['groupText'] as String,
      json['remark'] as String);
}

Map<String, dynamic> _$DispatchAssignToJson(DispatchAssign instance) =>
    <String, dynamic>{
      'organizationUnitId': instance.organizationUnitId,
      'organizationUnitName': instance.organizationUnitName,
      'vehicleCode': instance.vehicleCode,
      'group': instance.group,
      'groupText': instance.groupText,
      'remark': instance.remark,
      'isActive': instance.isActive,
      'id': instance.id
    };
