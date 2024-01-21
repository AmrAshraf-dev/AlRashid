// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'employment_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EmploymentModel _$EmploymentModelFromJson(Map<String, dynamic> json) {
  return _EmploymentModel.fromJson(json);
}

/// @nodoc
mixin _$EmploymentModel {
  EmployeeModel? get emplyer => throw _privateConstructorUsedError;
  String? get messge => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EmploymentModelCopyWith<EmploymentModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmploymentModelCopyWith<$Res> {
  factory $EmploymentModelCopyWith(
          EmploymentModel value, $Res Function(EmploymentModel) then) =
      _$EmploymentModelCopyWithImpl<$Res>;
  $Res call({EmployeeModel? emplyer, String? messge});
}

/// @nodoc
class _$EmploymentModelCopyWithImpl<$Res>
    implements $EmploymentModelCopyWith<$Res> {
  _$EmploymentModelCopyWithImpl(this._value, this._then);

  final EmploymentModel _value;
  // ignore: unused_field
  final $Res Function(EmploymentModel) _then;

  @override
  $Res call({
    Object? emplyer = freezed,
    Object? messge = freezed,
  }) {
    return _then(_value.copyWith(
      emplyer: emplyer == freezed
          ? _value.emplyer
          : emplyer // ignore: cast_nullable_to_non_nullable
              as EmployeeModel?,
      messge: messge == freezed
          ? _value.messge
          : messge // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_EmploymentModelCopyWith<$Res>
    implements $EmploymentModelCopyWith<$Res> {
  factory _$$_EmploymentModelCopyWith(
          _$_EmploymentModel value, $Res Function(_$_EmploymentModel) then) =
      __$$_EmploymentModelCopyWithImpl<$Res>;
  @override
  $Res call({EmployeeModel? emplyer, String? messge});
}

/// @nodoc
class __$$_EmploymentModelCopyWithImpl<$Res>
    extends _$EmploymentModelCopyWithImpl<$Res>
    implements _$$_EmploymentModelCopyWith<$Res> {
  __$$_EmploymentModelCopyWithImpl(
      _$_EmploymentModel _value, $Res Function(_$_EmploymentModel) _then)
      : super(_value, (v) => _then(v as _$_EmploymentModel));

  @override
  _$_EmploymentModel get _value => super._value as _$_EmploymentModel;

  @override
  $Res call({
    Object? emplyer = freezed,
    Object? messge = freezed,
  }) {
    return _then(_$_EmploymentModel(
      emplyer: emplyer == freezed
          ? _value.emplyer
          : emplyer // ignore: cast_nullable_to_non_nullable
              as EmployeeModel?,
      messge: messge == freezed
          ? _value.messge
          : messge // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_EmploymentModel implements _EmploymentModel {
  _$_EmploymentModel({this.emplyer, this.messge});

  factory _$_EmploymentModel.fromJson(Map<String, dynamic> json) =>
      _$$_EmploymentModelFromJson(json);

  @override
  final EmployeeModel? emplyer;
  @override
  final String? messge;

  @override
  String toString() {
    return 'EmploymentModel(emplyer: $emplyer, messge: $messge)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EmploymentModel &&
            const DeepCollectionEquality().equals(other.emplyer, emplyer) &&
            const DeepCollectionEquality().equals(other.messge, messge));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(emplyer),
      const DeepCollectionEquality().hash(messge));

  @JsonKey(ignore: true)
  @override
  _$$_EmploymentModelCopyWith<_$_EmploymentModel> get copyWith =>
      __$$_EmploymentModelCopyWithImpl<_$_EmploymentModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EmploymentModelToJson(
      this,
    );
  }
}

abstract class _EmploymentModel implements EmploymentModel {
  factory _EmploymentModel(
      {final EmployeeModel? emplyer,
      final String? messge}) = _$_EmploymentModel;

  factory _EmploymentModel.fromJson(Map<String, dynamic> json) =
      _$_EmploymentModel.fromJson;

  @override
  EmployeeModel? get emplyer;
  @override
  String? get messge;
  @override
  @JsonKey(ignore: true)
  _$$_EmploymentModelCopyWith<_$_EmploymentModel> get copyWith =>
      throw _privateConstructorUsedError;
}
