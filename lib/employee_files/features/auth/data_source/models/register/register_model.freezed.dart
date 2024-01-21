// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'register_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RegisterModel _$RegisterModelFromJson(Map<String, dynamic> json) {
  return _RegisterModel.fromJson(json);
}

/// @nodoc
mixin _$RegisterModel {
  @JsonKey(name: "message_en")
  String get message_en => throw _privateConstructorUsedError;
  @JsonKey(name: "messge_ar")
  String get messge_ar => throw _privateConstructorUsedError;
  LoginModel? get user => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RegisterModelCopyWith<RegisterModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterModelCopyWith<$Res> {
  factory $RegisterModelCopyWith(
          RegisterModel value, $Res Function(RegisterModel) then) =
      _$RegisterModelCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: "message_en") String message_en,
      @JsonKey(name: "messge_ar") String messge_ar,
      LoginModel? user});

  $LoginModelCopyWith<$Res>? get user;
}

/// @nodoc
class _$RegisterModelCopyWithImpl<$Res>
    implements $RegisterModelCopyWith<$Res> {
  _$RegisterModelCopyWithImpl(this._value, this._then);

  final RegisterModel _value;
  // ignore: unused_field
  final $Res Function(RegisterModel) _then;

  @override
  $Res call({
    Object? message_en = freezed,
    Object? messge_ar = freezed,
    Object? user = freezed,
  }) {
    return _then(_value.copyWith(
      message_en: message_en == freezed
          ? _value.message_en
          : message_en // ignore: cast_nullable_to_non_nullable
              as String,
      messge_ar: messge_ar == freezed
          ? _value.messge_ar
          : messge_ar // ignore: cast_nullable_to_non_nullable
              as String,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as LoginModel?,
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
abstract class _$$_RegisterModelCopyWith<$Res>
    implements $RegisterModelCopyWith<$Res> {
  factory _$$_RegisterModelCopyWith(
          _$_RegisterModel value, $Res Function(_$_RegisterModel) then) =
      __$$_RegisterModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: "message_en") String message_en,
      @JsonKey(name: "messge_ar") String messge_ar,
      LoginModel? user});

  @override
  $LoginModelCopyWith<$Res>? get user;
}

/// @nodoc
class __$$_RegisterModelCopyWithImpl<$Res>
    extends _$RegisterModelCopyWithImpl<$Res>
    implements _$$_RegisterModelCopyWith<$Res> {
  __$$_RegisterModelCopyWithImpl(
      _$_RegisterModel _value, $Res Function(_$_RegisterModel) _then)
      : super(_value, (v) => _then(v as _$_RegisterModel));

  @override
  _$_RegisterModel get _value => super._value as _$_RegisterModel;

  @override
  $Res call({
    Object? message_en = freezed,
    Object? messge_ar = freezed,
    Object? user = freezed,
  }) {
    return _then(_$_RegisterModel(
      message_en: message_en == freezed
          ? _value.message_en
          : message_en // ignore: cast_nullable_to_non_nullable
              as String,
      messge_ar: messge_ar == freezed
          ? _value.messge_ar
          : messge_ar // ignore: cast_nullable_to_non_nullable
              as String,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as LoginModel?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_RegisterModel implements _RegisterModel {
  _$_RegisterModel(
      {@JsonKey(name: "message_en") required this.message_en,
      @JsonKey(name: "messge_ar") required this.messge_ar,
      this.user});

  factory _$_RegisterModel.fromJson(Map<String, dynamic> json) =>
      _$$_RegisterModelFromJson(json);

  @override
  @JsonKey(name: "message_en")
  final String message_en;
  @override
  @JsonKey(name: "messge_ar")
  final String messge_ar;
  @override
  final LoginModel? user;

  @override
  String toString() {
    return 'RegisterModel(message_en: $message_en, messge_ar: $messge_ar, user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RegisterModel &&
            const DeepCollectionEquality()
                .equals(other.message_en, message_en) &&
            const DeepCollectionEquality().equals(other.messge_ar, messge_ar) &&
            const DeepCollectionEquality().equals(other.user, user));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(message_en),
      const DeepCollectionEquality().hash(messge_ar),
      const DeepCollectionEquality().hash(user));

  @JsonKey(ignore: true)
  @override
  _$$_RegisterModelCopyWith<_$_RegisterModel> get copyWith =>
      __$$_RegisterModelCopyWithImpl<_$_RegisterModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RegisterModelToJson(
      this,
    );
  }
}

abstract class _RegisterModel implements RegisterModel {
  factory _RegisterModel(
      {@JsonKey(name: "message_en") required final String message_en,
      @JsonKey(name: "messge_ar") required final String messge_ar,
      final LoginModel? user}) = _$_RegisterModel;

  factory _RegisterModel.fromJson(Map<String, dynamic> json) =
      _$_RegisterModel.fromJson;

  @override
  @JsonKey(name: "message_en")
  String get message_en;
  @override
  @JsonKey(name: "messge_ar")
  String get messge_ar;
  @override
  LoginModel? get user;
  @override
  @JsonKey(ignore: true)
  _$$_RegisterModelCopyWith<_$_RegisterModel> get copyWith =>
      throw _privateConstructorUsedError;
}
