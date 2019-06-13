import 'package:json_annotation/json_annotation.dart';

part 'DispatchAssign.g.dart';
@JsonSerializable()
class DispatchAssign{
  int organizationUnitId;
  String organizationUnitName;
  String vehicleCode;
  String group;
  String groupText;
  String remark;
  bool isActive;
  String id;
  DispatchAssign(
      this.id,
      this.vehicleCode,
      this.isActive,
      this.organizationUnitName,
      this.organizationUnitId,
      this.group,
      this.groupText,
      this.remark
      );
  ///json转换为实体类
  factory DispatchAssign.fromJson(Map<String, dynamic> json) => _$DispatchAssignFromJson(json);
  ///实体类到json
  Map<String, dynamic> toJson() => _$DispatchAssignToJson(this);
  ///命名构造函数
  DispatchAssign.empty();
}