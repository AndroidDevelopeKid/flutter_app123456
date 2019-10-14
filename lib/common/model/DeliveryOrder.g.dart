// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DeliveryOrder.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeliveryOrder _$DeliveryOrderFromJson(Map<String, dynamic> json) {
  return DeliveryOrder(
    json['id'] as String,
    json['mainVehiclePlate'] as String,
    json['vehicleCode'] as String,
    json['barcode'] as String,
    json['coalText'] as String,
    json['deliveryOrderCode'] as String,
    json['deliveryOrderStateText'] as String,
    json['generateDate'] as String,
    json['generatePerson'] as String,
    json['generateType'] as String,
    json['organizationUnitId'] as int,
    json['organizationUnitName'] as String,
    json['randomNumber'] as String,
    json['source'] as int,
    json['sourceText'] as String,
    json['sunuName'] as String,
    json['transSupplierNumber'] as String,
    json['werkName'] as String,
    json['ysSunuName'] as String,
    json['message'] as String,
  )
    ..loadPlaceId = json['loadPlaceId'] as int
    ..loadPlaceName = json['loadPlaceName'] as String
    ..unloadPlaceId = json['unloadPlaceId'] as int
    ..unloadPlaceName = json['unloadPlaceName'] as String
    ..goodsId = json['goodsId'] as int
    ..goodsName = json['goodsName'] as String;
}

Map<String, dynamic> _$DeliveryOrderToJson(DeliveryOrder instance) =>
    <String, dynamic>{
      'organizationUnitId': instance.organizationUnitId,
      'organizationUnitName': instance.organizationUnitName,
      'loadPlaceId': instance.loadPlaceId,
      'loadPlaceName': instance.loadPlaceName,
      'unloadPlaceId': instance.unloadPlaceId,
      'unloadPlaceName': instance.unloadPlaceName,
      'goodsId': instance.goodsId,
      'goodsName': instance.goodsName,
      'generateDate': instance.generateDate,
      'vehicleCode': instance.vehicleCode,
      'mainVehiclePlate': instance.mainVehiclePlate,
      'source': instance.source,
      'sourceText': instance.sourceText,
      'deliveryOrderStateText': instance.deliveryOrderStateText,
      'deliveryOrderCode': instance.deliveryOrderCode,
      'randomNumber': instance.randomNumber,
      'transSupplierNumber': instance.transSupplierNumber,
      'coalText': instance.coalText,
      'generatePerson': instance.generatePerson,
      'barcode': instance.barcode,
      'generateType': instance.generateType,
      'werkName': instance.werkName,
      'sunuName': instance.sunuName,
      'ysSunuName': instance.ysSunuName,
      'id': instance.id,
      'message': instance.message,
    };
