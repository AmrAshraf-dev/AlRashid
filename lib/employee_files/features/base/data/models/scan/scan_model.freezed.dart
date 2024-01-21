// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'scan_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ScanModel _$ScanModelFromJson(Map<String, dynamic> json) {
  return _ScanModel.fromJson(json);
}

/// @nodoc
mixin _$ScanModel {
  InvoiceModel? get invoice => throw _privateConstructorUsedError;
  LoginModel? get user => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ScanModelCopyWith<ScanModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScanModelCopyWith<$Res> {
  factory $ScanModelCopyWith(ScanModel value, $Res Function(ScanModel) then) =
      _$ScanModelCopyWithImpl<$Res>;
  $Res call({InvoiceModel? invoice, LoginModel? user});

  $InvoiceModelCopyWith<$Res>? get invoice;
  $LoginModelCopyWith<$Res>? get user;
}

/// @nodoc
class _$ScanModelCopyWithImpl<$Res> implements $ScanModelCopyWith<$Res> {
  _$ScanModelCopyWithImpl(this._value, this._then);

  final ScanModel _value;
  // ignore: unused_field
  final $Res Function(ScanModel) _then;

  @override
  $Res call({
    Object? invoice = freezed,
    Object? user = freezed,
  }) {
    return _then(_value.copyWith(
      invoice: invoice == freezed
          ? _value.invoice
          : invoice // ignore: cast_nullable_to_non_nullable
              as InvoiceModel?,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as LoginModel?,
    ));
  }

  @override
  $InvoiceModelCopyWith<$Res>? get invoice {
    if (_value.invoice == null) {
      return null;
    }

    return $InvoiceModelCopyWith<$Res>(_value.invoice!, (value) {
      return _then(_value.copyWith(invoice: value));
    });
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
abstract class _$$_ScanModelCopyWith<$Res> implements $ScanModelCopyWith<$Res> {
  factory _$$_ScanModelCopyWith(
          _$_ScanModel value, $Res Function(_$_ScanModel) then) =
      __$$_ScanModelCopyWithImpl<$Res>;
  @override
  $Res call({InvoiceModel? invoice, LoginModel? user});

  @override
  $InvoiceModelCopyWith<$Res>? get invoice;
  @override
  $LoginModelCopyWith<$Res>? get user;
}

/// @nodoc
class __$$_ScanModelCopyWithImpl<$Res> extends _$ScanModelCopyWithImpl<$Res>
    implements _$$_ScanModelCopyWith<$Res> {
  __$$_ScanModelCopyWithImpl(
      _$_ScanModel _value, $Res Function(_$_ScanModel) _then)
      : super(_value, (v) => _then(v as _$_ScanModel));

  @override
  _$_ScanModel get _value => super._value as _$_ScanModel;

  @override
  $Res call({
    Object? invoice = freezed,
    Object? user = freezed,
  }) {
    return _then(_$_ScanModel(
      invoice: invoice == freezed
          ? _value.invoice
          : invoice // ignore: cast_nullable_to_non_nullable
              as InvoiceModel?,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as LoginModel?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_ScanModel implements _ScanModel {
  _$_ScanModel({this.invoice, this.user});

  factory _$_ScanModel.fromJson(Map<String, dynamic> json) =>
      _$$_ScanModelFromJson(json);

  @override
  final InvoiceModel? invoice;
  @override
  final LoginModel? user;

  @override
  String toString() {
    return 'ScanModel(invoice: $invoice, user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ScanModel &&
            const DeepCollectionEquality().equals(other.invoice, invoice) &&
            const DeepCollectionEquality().equals(other.user, user));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(invoice),
      const DeepCollectionEquality().hash(user));

  @JsonKey(ignore: true)
  @override
  _$$_ScanModelCopyWith<_$_ScanModel> get copyWith =>
      __$$_ScanModelCopyWithImpl<_$_ScanModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ScanModelToJson(
      this,
    );
  }
}

abstract class _ScanModel implements ScanModel {
  factory _ScanModel({final InvoiceModel? invoice, final LoginModel? user}) =
      _$_ScanModel;

  factory _ScanModel.fromJson(Map<String, dynamic> json) =
      _$_ScanModel.fromJson;

  @override
  InvoiceModel? get invoice;
  @override
  LoginModel? get user;
  @override
  @JsonKey(ignore: true)
  _$$_ScanModelCopyWith<_$_ScanModel> get copyWith =>
      throw _privateConstructorUsedError;
}
