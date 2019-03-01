
import 'package:json_annotation/json_annotation.dart';
part 'Driver.g.dart';
@JsonSerializable()
class Driver{
  String name;
  Driver(this.name);

  ///json转换为实体类
  factory Driver.fromJson(Map<String, dynamic> json) => _$DriverFromJson(json);
  ///实体类到json
  Map<String, dynamic> toJson() => _$DriverToJson(this);
  ///命名构造函数
  Driver.empty();
}