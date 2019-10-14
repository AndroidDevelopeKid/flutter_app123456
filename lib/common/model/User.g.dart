// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'User.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    json['name'] as String,
    json['surname'] as String,
    json['gender'] as String,
    json['gengderText'] as String,
    json['emailAddress'] as String,
    json['fullName'] as String,
    json['id'] as String,
    json['isActive'] as String,
    json['phoneNumber'] as String,
    json['userName'] as String,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'name': instance.name,
      'surname': instance.surname,
      'gender': instance.gender,
      'gengderText': instance.gengderText,
      'userName': instance.userName,
      'fullName': instance.fullName,
      'emailAddress': instance.emailAddress,
      'phoneNumber': instance.phoneNumber,
      'isActive': instance.isActive,
      'id': instance.id,
    };
