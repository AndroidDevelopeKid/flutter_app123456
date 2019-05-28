import 'package:json_annotation/json_annotation.dart';
part 'HistoryBill.g.dart';
@JsonSerializable()
class HistoryBill{
  String id;

  HistoryBill(
      this.id,

      );

  factory HistoryBill.fromJson(Map<String, dynamic> json) => _$HistoryBillFromJson(json);

  Map<String, dynamic> toJson() => _$HistoryBillToJson(this);
}