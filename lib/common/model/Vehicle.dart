
import 'package:json_annotation/json_annotation.dart';
part 'Vehicle.g.dart';
@JsonSerializable()
class Vehicle{
  int originalOUId;
  String ouDisplayName;
  String ouFullName;
  int detailedOriginalOUId;
  String detailedOUDisplayName;
  String vehicleCode;
  String mainVehiclePlate;
  String frameNumber;
  String engineNumber;
  String trailerNumber;
  String trailerFrameNumber;
  String acquisitionDate;
  String vehicleBrand;
  String vehicleBrandText;
  String brandModel;
  String brandModelText;
  String ownerIDNumber;
  String ownerName;
  String ownerPhone;
  String vehicleOwner;
  String vehicleBusinessType;
  String vehicleBusinessTypeText;
  String vehicleType;
  String vehicleTypeText;
  String models;
  String modelsText;
  String vehicleState;
  String vehicleStateText;
  String vehicleGroup;
  String vehicleGroupText;
  String vehicleQualifications;
  String vehicleQualificationsText;
  String joiningDate;
  String expectedroductionDate;
  String introducer;
  String introducerNames;
  String description;
  String creatorUserName;
  String lastModifierUserName;
  int vehicleStateFlag;
  String id;
  Vehicle(
      this.originalOUId,
      this.joiningDate,
      this.ouDisplayName,
      this.vehicleCode,
      this.id,
      this.acquisitionDate,
      this.brandModel,
      this.brandModelText,
      this.creatorUserName,
      this.description,
      this.detailedOriginalOUId,
      this.detailedOUDisplayName,
      this.engineNumber,
      this.expectedroductionDate,
      this.frameNumber,
      this.introducer,
      this.introducerNames,
      this.lastModifierUserName,
      this.mainVehiclePlate,
      this.models,
      this.modelsText,
      this.ouFullName,
      this.ownerIDNumber,
      this.ownerName,
      this.ownerPhone,
      this.trailerFrameNumber,
      this.trailerNumber,
      this.vehicleBrand,
      this.vehicleBrandText,
      this.vehicleBusinessType,
      this.vehicleBusinessTypeText,
      this.vehicleGroup,
      this.vehicleGroupText,
      this.vehicleOwner,
      this.vehicleQualifications,
      this.vehicleQualificationsText,
      this.vehicleState,
      this.vehicleStateFlag,
      this.vehicleStateText,
      this.vehicleType,
      this.vehicleTypeText
      );

  ///json转换为实体类
  factory Vehicle.fromJson(Map<String, dynamic> json) => _$VehicleFromJson(json);
  ///实体类到json
  Map<String, dynamic> toJson() => _$VehicleToJson(this);
  ///命名构造函数
  Vehicle.empty();
}