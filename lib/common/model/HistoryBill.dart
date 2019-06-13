import 'package:json_annotation/json_annotation.dart';
part 'HistoryBill.g.dart';
@JsonSerializable()
class HistoryBill{
  String id;
  String vehicleCode;//车辆编号
  String mainVehiclePlate;//车牌号
  String deliveryOrderCode;//提货单号
  String deliveryOrderState;//提货单状态
  String generateDate;//提货单生成日期
  String loadPlaceName;//装地-提货点
  String unloadPlaceName;//卸地-采购方
  String goodsName;//货物名-煤种
  String outStockGenerateDate;//提货点称重时间
  double outStockNetWeigh;//提货点净重
  String weighDate;//采购方称重时间
  String skinbackDate;//采购方回皮时间
  double inStockGrossWeigh;//采购方毛重
  double inStockNetWeigh;//采购方净重


  HistoryBill(
      this.id,
      this.mainVehiclePlate,
      this.vehicleCode,
      this.generateDate,
      this.deliveryOrderState,
      this.deliveryOrderCode,
      this.goodsName,
      this.inStockGrossWeigh,
      this.inStockNetWeigh,
      this.loadPlaceName,
      this.outStockGenerateDate,
      this.outStockNetWeigh,
      this.skinbackDate,
      this.unloadPlaceName,
      this.weighDate
      );

  factory HistoryBill.fromJson(Map<String, dynamic> json) => _$HistoryBillFromJson(json);

  Map<String, dynamic> toJson() => _$HistoryBillToJson(this);
}