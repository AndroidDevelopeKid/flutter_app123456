
import 'package:json_annotation/json_annotation.dart';

part 'DeliveryOrder.g.dart';
@JsonSerializable()
class DeliveryOrder{
  DeliveryOrder(
      this.id,
      this.mainVehiclePlate,
      this.vehicleCode,
      this.barcode,
      this.coalText,
      this.deliveryOrderCode,
      this.deliveryOrderState,
      this.generateDate,
      this.generatePerson,
      this.generateType,
      this.organizationUnitId,
      this.organizationUnitName,
      this.randomNumber,
      this.source,
      this.sourceText,
      this.sunuName,
      this.transSupplierNumber,
      this.werkName,
      this.ysSunuName,
      this.message
      );
  int organizationUnitId;
  String organizationUnitName;
  String generateDate;
  String vehicleCode;
  String mainVehiclePlate;
  int source;
  String sourceText;
  String deliveryOrderState;
  String deliveryOrderCode;
  String randomNumber;
  String transSupplierNumber;
  String coalText;
  String generatePerson;
  String barcode;
  String generateType;
  String werkName;
  String sunuName;
  String ysSunuName;
  String id;
  String message;

  ///json转换为实体类
  factory DeliveryOrder.fromJson(Map<String, dynamic> json) => _$DeliveryOrderFromJson(json);
  ///实体类到json
  Map<String, dynamic> toJson() => _$DeliveryOrderToJson(this);
  ///命名构造函数
  DeliveryOrder.empty();
}