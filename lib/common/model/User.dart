import 'package:json_annotation/json_annotation.dart';

part 'User.g.dart';
@JsonSerializable()
class User{
  User(
      this.login,
      this.fullName,
      );
  String login;
  String fullName;

  ///json转换为实体类
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  ///实体类到json
  Map<String, dynamic> toJson() => _$UserToJson(this);
  ///命名构造函数
  User.empty();
}