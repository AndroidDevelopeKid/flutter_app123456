// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserOrg.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserOrg _$UserOrgFromJson(Map<String, dynamic> json) {
  return UserOrg(
    json['login'] as String,
    json['description'] as String,
    json['id'] as int,
    json['url'] as String,
  );
}

Map<String, dynamic> _$UserOrgToJson(UserOrg instance) => <String, dynamic>{
      'login': instance.login,
      'id': instance.id,
      'url': instance.url,
      'description': instance.description,
    };
