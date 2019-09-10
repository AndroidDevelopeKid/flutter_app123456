// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Tenant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tenant _$TenantFromJson(Map<String, dynamic> json) {
  return Tenant(json['isActive'] as bool, json['id'] as int,
      json['name'] as String, json['tenancyName'] as String);
}

Map<String, dynamic> _$TenantToJson(Tenant instance) => <String, dynamic>{
      'id': instance.id,
      'tenancyName': instance.tenancyName,
      'name': instance.name,
      'isActive': instance.isActive
    };
