import 'package:json_annotation/json_annotation.dart';

part 'Toll.g.dart';
@JsonSerializable()
class Toll{
  Toll(
      this.id,
      this.vehicleCode,
      this.customerId,
      this.customerIdName,
      this.driverName,
      this.happenDate,
      this.taxAmount
      );
  String happenDate;//发生过路费时间
  String vehicleCode;//车辆编号
  String driverName;//司机姓名
  double taxAmount;//含税金额
  int customerId;//费用客户
  String customerIdName;//费用客户名称


  String id;

  factory Toll.fromJson(Map<String, dynamic> json) => _$TollFromJson(json);

  Map<String, dynamic> toJson() => _$TollToJson(this);

  Toll.empty();
}