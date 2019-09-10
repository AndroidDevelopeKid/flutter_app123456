import 'package:json_annotation/json_annotation.dart';

part 'Tenant.g.dart';
@JsonSerializable()
class Tenant{
  Tenant(
      this.isActive,
      this.id,
      this.name,
      this.tenancyName

      );
  int id;
  String tenancyName;
  String name;
  bool isActive;

  ///json转换为实体类
  factory Tenant.fromJson(Map<String, dynamic> json) => _$TenantFromJson(json);
  ///实体类到json
  Map<String, dynamic> toJson() => _$TenantToJson(this);
  ///命名构造函数
  Tenant.empty();
}