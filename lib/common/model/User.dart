import 'package:json_annotation/json_annotation.dart';

part 'User.g.dart';
@JsonSerializable()
class User{
  User(
      this.name,
      this.surname,
      this.gender,
      this.gengderText,
      this.emailAddress,
      this.fullName,
      this.id,
      this.isActive,
      this.phoneNumber,
      this.userName,
      );
  String name;
  String surname;
  String gender;
  String gengderText;
  String userName;
  String fullName;
  String emailAddress;
  String phoneNumber;
  String isActive;
  String id;

  ///json转换为实体类
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  ///实体类到json
  Map<String, dynamic> toJson() => _$UserToJson(this);
  ///命名构造函数
  User.empty();
}