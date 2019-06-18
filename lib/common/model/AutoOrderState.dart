
import 'package:json_annotation/json_annotation.dart';
part 'AutoOrderState.g.dart';
@JsonSerializable()
class AutoOrderState{
  bool nowOrderQueueState;
  bool nowDeliveryOrderState;
  int autoAcceptOrderState;


  AutoOrderState(
      this.autoAcceptOrderState,
      this.nowDeliveryOrderState,
      this.nowOrderQueueState
      );

  ///json转换为实体类
  factory AutoOrderState.fromJson(Map<String, dynamic> json) => _$AutoOrderStateFromJson(json);
  ///实体类到json
  Map<String, dynamic> toJson() => _$AutoOrderStateToJson(this);
  ///命名构造函数
  AutoOrderState.empty();
}