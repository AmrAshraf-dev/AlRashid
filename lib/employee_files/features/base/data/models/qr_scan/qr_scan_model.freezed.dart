// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'qr_scan_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

QrScanModel _$QrScanModelFromJson(Map<String, dynamic> json) {
  return _QrScanModel.fromJson(json);
}

/// @nodoc
mixin _$QrScanModel {
  LoginModel? get user => throw _privateConstructorUsedError;
  String? get messge => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QrScanModelCopyWith<QrScanModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QrScanModelCopyWith<$Res> {
  factory $QrScanModelCopyWith(
          QrScanModel value, $Res Function(QrScanModel) then) =
      _$QrScanModelCopyWithImpl<$Res>;
  $Res call({LoginModel? user, String? messge});

  $LoginModelCopyWith<$Res>? get user;
}

/// @nodoc
class _$QrScanModelCopyWithImpl<$Res> implements $QrScanModelCopyWith<$Res> {
  _$QrScanModelCopyWithImpl(this._value, this._then);

  final QrScanModel _value;
  // ignore: unused_field
  final $Res Function(QrScanModel) _then;

  @override
  $Res call({
    Object? user = freezed,
    Object? messge = freezed,
  }) {
    return _then(_value.copyWith(
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as LoginModel?,
      messge: messge == freezed
          ? _value.messge
          : messge // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  @override
  $LoginModelCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $LoginModelCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc
abstract class _$$_QrScanModelCopyWith<$Res>
    implements $QrScanModelCopyWith<$Res> {
  factory _$$_QrScanModelCopyWith(
          _$_QrScanModel value, $Res Function(_$_QrScanModel) then) =
      __$$_QrScanModelCopyWithImpl<$Res>;
  @override
  $Res call({LoginModel? user, String? messge});

  @override
  $LoginModelCopyWith<$Res>? get user;
}

/// @nodoc
class __$$_QrScanModelCopyWithImpl<$Res> extends _$QrScanModelCopyWithImpl<$Res>
    implements _$$_QrScanModelCopyWith<$Res> {
  __$$_QrScanModelCopyWithImpl(
      _$_QrScanModel _value, $Res Function(_$_QrScanModel) _then)
      : super(_value, (v) => _then(v as _$_QrScanModel));

  @override
  _$_QrScanModel get _value => super._value as _$_QrScanModel;

  @override
  $Res call({
    Object? user = freezed,
    Object? messge = freezed,
  }) {
    return _then(_$_QrScanModel(
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as LoginModel?,
      messge: messge == freezed
          ? _value.messge
          : messge // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_QrScanModel implements _QrScanModel {
  _$_QrScanModel({this.user, this.messge});

  factory _$_QrScanModel.fromJson(Map<String, dynamic> json) =>
      _$$_QrScanModelFromJson(json);

  @override
  final LoginModel? user;
  @override
  final String? messge;

  @override
  String toString() {
    return 'QrScanModel(user: $user, messge: $messge)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_QrScanModel &&
            const DeepCollectionEquality().equals(other.user, user) &&
            const DeepCollectionEquality().equals(other.messge, messge));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(user),
      const DeepCollectionEquality().hash(messge));

  @JsonKey(ignore: true)
  @override
  _$$_QrScanModelCopyWith<_$_QrScanModel> get copyWith =>
      __$$_QrScanModelCopyWithImpl<_$_QrScanModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_QrScanModelToJson(
      this,
    );
  }
}

abstract class _QrScanModel implements QrScanModel {
  factory _QrScanModel({final LoginModel? user, final String? messge}) =
      _$_QrScanModel;

  factory _QrScanModel.fromJson(Map<String, dynamic> json) =
      _$_QrScanModel.fromJson;

  @override
  LoginModel? get user;
  @override
  String? get messge;
  @override
  @JsonKey(ignore: true)
  _$$_QrScanModelCopyWith<_$_QrScanModel> get copyWith =>
      throw _privateConstructorUsedError;
}
