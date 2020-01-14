
import 'package:json_annotation/json_annotation.dart';

part 'DeliveryOrder.g.dart';
@JsonSerializable()
class DeliveryOrder{
  DeliveryOrder(
      this.id,
      this.mainVehiclePlate,
      this.vehicleCode,
      this.barcode,
      this.coalCode,
      this.coalText,
      this.deliveryOrderCode,
      this.deliveryOrderStateText,
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
  int loadPlaceId;
  String loadPlaceName;//装地
  int unloadPlaceId;
  String unloadPlaceName;//卸地
  int goodsId;
  String goodsName;//煤种
  String generateDate;//提货单时间
  String vehicleCode;//车辆编号
  String mainVehiclePlate;//车牌号
  int source;
  String sourceText;
  String deliveryOrderStateText;//提货单状态
  String deliveryOrderCode;//提货单编号
  String randomNumber;
  String transSupplierNumber;
  String coalCode;
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