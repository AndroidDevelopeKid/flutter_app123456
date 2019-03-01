
import 'package:json_annotation/json_annotation.dart';
part 'Customer.g.dart';
@JsonSerializable()
class Customer{
  String name;
  Customer(this.name);

  ///json转换为实体类
  factory Customer.fromJson(Map<String, dynamic> json) => _$CustomerFromJson(json);
  ///实体类到json
  Map<String, dynamic> toJson() => _$CustomerToJson(this);
  ///命名构造函数
  Customer.empty();
}