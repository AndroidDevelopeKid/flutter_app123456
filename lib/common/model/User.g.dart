// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'User.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(json['login'] as String, json['fullName'] as String);
}

Map<String, dynamic> _$UserToJson(User instance) =>
    <String, dynamic>{'login': instance.login, 'fullName': instance.fullName};
