// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'HistoryBill.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HistoryBill _$HistoryBillFromJson(Map<String, dynamic> json) {
  return HistoryBill(
      json['id'] as String,
      json['mainVehiclePlate'] as String,
      json['vehicleCode'] as String,
      json['generateDate'] as String,
      json['deliveryOrderState'] as String,
      json['deliveryOrderCode'] as String,
      json['goodsName'] as String,
      (json['inStockGrossWeigh'] as num)?.toDouble(),
      (json['inStockNetWeigh'] as num)?.toDouble(),
      json['loadPlaceName'] as String,
      json['outStockGenerateDate'] as String,
      (json['outStockNetWeigh'] as num)?.toDouble(),
      json['skinbackDate'] as String,
      json['unloadPlaceName'] as String,
      json['weighDate'] as String,
      json['deliveryOrderStateText'] as String,
      json['goodsId'] as int,
      json['loadPlaceId'] as int,
      json['unloadPlaceId'] as int);
}

Map<String, dynamic> _$HistoryBillToJson(HistoryBill instance) =>
    <String, dynamic>{
      'id': instance.id,
      'vehicleCode': instance.vehicleCode,
      'mainVehiclePlate': instance.mainVehiclePlate,
      'deliveryOrderCode': instance.deliveryOrderCode,
      'deliveryOrderState': instance.deliveryOrderState,
      'deliveryOrderStateText': instance.deliveryOrderStateText,
      'generateDate': instance.generateDate,
      'loadPlaceId': instance.loadPlaceId,
      'loadPlaceName': instance.loadPlaceName,
      'unloadPlaceId': instance.unloadPlaceId,
      'unloadPlaceName': instance.unloadPlaceName,
      'goodsId': instance.goodsId,
      'goodsName': instance.goodsName,
      'outStockGenerateDate': instance.outStockGenerateDate,
      'outStockNetWeigh': instance.outStockNetWeigh,
      'weighDate': instance.weighDate,
      'skinbackDate': instance.skinbackDate,
      'inStockGrossWeigh': instance.inStockGrossWeigh,
      'inStockNetWeigh': instance.inStockNetWeigh
    };
