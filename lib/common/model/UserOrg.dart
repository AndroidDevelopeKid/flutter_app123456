
import 'package:json_annotation/json_annotation.dart';

part 'UserOrg.g.dart';

@JsonSerializable()
class UserOrg{
  String login;
  int id;
  String url;
  String description;

  UserOrg(
      this.login,
      this.description,
      this.id,
      this.url
      );

  factory UserOrg.formJson(Map<String, dynamic> json) => _$UserOrgFromJson(json);

  Map<String, dynamic> toJson() => _$UserOrgToJson(this);
  ///命名构造函数
  UserOrg.empty();
}