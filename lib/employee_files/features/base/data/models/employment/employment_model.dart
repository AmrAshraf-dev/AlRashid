import 'package:freezed_annotation/freezed_annotation.dart';

import '../employee/employee_model.dart';

part 'employment_model.freezed.dart';
part 'employment_model.g.dart';

@freezed
class EmploymentModel with _$EmploymentModel{
  @JsonSerializable(explicitToJson: true)
  factory EmploymentModel({
    EmployeeModel? emplyer,
    String?messge

  }) = _EmploymentModel;


  factory EmploymentModel.fromJson(Map<String, dynamic> json) =>
      _$EmploymentModelFromJson(json);
}