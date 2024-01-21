// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'login_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LoginModel _$LoginModelFromJson(Map<String, dynamic> json) {
  return _LoginModel.fromJson(json);
}

/// @nodoc
mixin _$LoginModel {
  @JsonKey(name: "id")
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "name")
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: "email")
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: "phone")
  dynamic get phone => throw _privateConstructorUsedError;
  @JsonKey(name: "start_work")
  String? get start_work => throw _privateConstructorUsedError;
  @JsonKey(name: "end_work")
  String? get end_work => throw _privateConstructorUsedError;
  @JsonKey(name: "updated_at")
  String? get updated_at => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  String? get created_at => throw _privateConstructorUsedError;
  @JsonKey(name: "national_id")
  String? get national_id => throw _privateConstructorUsedError;
  @JsonKey(name: "lang")
  String? get lang => throw _privateConstructorUsedError;
  @JsonKey(name: "place_id")
  dynamic get place_id => throw _privateConstructorUsedError;
  @JsonKey(name: "manger")
  dynamic get manger => throw _privateConstructorUsedError;
  @JsonKey(nullable: true, ignore: true)
  String? get name_ar => throw _privateConstructorUsedError;
  @JsonKey(nullable: true, ignore: true)
  String? get name_en => throw _privateConstructorUsedError;
  int? get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoginModelCopyWith<LoginModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginModelCopyWith<$Res> {
  factory $LoginModelCopyWith(
          LoginModel value, $Res Function(LoginModel) then) =
      _$LoginModelCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: "id") int? id,
      @JsonKey(name: "name") String? name,
      @JsonKey(name: "email") String? email,
      @JsonKey(name: "phone") dynamic phone,
      @JsonKey(name: "start_work") String? start_work,
      @JsonKey(name: "end_work") String? end_work,
      @JsonKey(name: "updated_at") String? updated_at,
      @JsonKey(name: "created_at") String? created_at,
      @JsonKey(name: "national_id") String? national_id,
      @JsonKey(name: "lang") String? lang,
      @JsonKey(name: "place_id") dynamic place_id,
      @JsonKey(name: "manger") dynamic manger,
      @JsonKey(nullable: true, ignore: true) String? name_ar,
      @JsonKey(nullable: true, ignore: true) String? name_en,
      int? type});
}

/// @nodoc
class _$LoginModelCopyWithImpl<$Res> implements $LoginModelCopyWith<$Res> {
  _$LoginModelCopyWithImpl(this._value, this._then);

  final LoginModel _value;
  // ignore: unused_field
  final $Res Function(LoginModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? email = freezed,
    Object? phone = freezed,
    Object? start_work = freezed,
    Object? end_work = freezed,
    Object? updated_at = freezed,
    Object? created_at = freezed,
    Object? national_id = freezed,
    Object? lang = freezed,
    Object? place_id = freezed,
    Object? manger = freezed,
    Object? name_ar = freezed,
    Object? name_en = freezed,
    Object? type = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as dynamic,
      start_work: start_work == freezed
          ? _value.start_work
          : start_work // ignore: cast_nullable_to_non_nullable
              as String?,
      end_work: end_work == freezed
          ? _value.end_work
          : end_work // ignore: cast_nullable_to_non_nullable
              as String?,
      updated_at: updated_at == freezed
          ? _value.updated_at
          : updated_at // ignore: cast_nullable_to_non_nullable
              as String?,
      created_at: created_at == freezed
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as String?,
      national_id: national_id == freezed
          ? _value.national_id
          : national_id // ignore: cast_nullable_to_non_nullable
              as String?,
      lang: lang == freezed
          ? _value.lang
          : lang // ignore: cast_nullable_to_non_nullable
              as String?,
      place_id: place_id == freezed
          ? _value.place_id
          : place_id // ignore: cast_nullable_to_non_nullable
              as dynamic,
      manger: manger == freezed
          ? _value.manger
          : manger // ignore: cast_nullable_to_non_nullable
              as dynamic,
      name_ar: name_ar == freezed
          ? _value.name_ar
          : name_ar // ignore: cast_nullable_to_non_nullable
              as String?,
      name_en: name_en == freezed
          ? _value.name_en
          : name_en // ignore: cast_nullable_to_non_nullable
              as String?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$$_LoginModelCopyWith<$Res>
    implements $LoginModelCopyWith<$Res> {
  factory _$$_LoginModelCopyWith(
          _$_LoginModel value, $Res Function(_$_LoginModel) then) =
      __$$_LoginModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: "id") int? id,
      @JsonKey(name: "name") String? name,
      @JsonKey(name: "email") String? email,
      @JsonKey(name: "phone") dynamic phone,
      @JsonKey(name: "start_work") String? start_work,
      @JsonKey(name: "end_work") String? end_work,
      @JsonKey(name: "updated_at") String? updated_at,
      @JsonKey(name: "created_at") String? created_at,
      @JsonKey(name: "national_id") String? national_id,
      @JsonKey(name: "lang") String? lang,
      @JsonKey(name: "place_id") dynamic place_id,
      @JsonKey(name: "manger") dynamic manger,
      @JsonKey(nullable: true, ignore: true) String? name_ar,
      @JsonKey(nullable: true, ignore: true) String? name_en,
      int? type});
}

/// @nodoc
class __$$_LoginModelCopyWithImpl<$Res> extends _$LoginModelCopyWithImpl<$Res>
    implements _$$_LoginModelCopyWith<$Res> {
  __$$_LoginModelCopyWithImpl(
      _$_LoginModel _value, $Res Function(_$_LoginModel) _then)
      : super(_value, (v) => _then(v as _$_LoginModel));

  @override
  _$_LoginModel get _value => super._value as _$_LoginModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? email = freezed,
    Object? phone = freezed,
    Object? start_work = freezed,
    Object? end_work = freezed,
    Object? updated_at = freezed,
    Object? created_at = freezed,
    Object? national_id = freezed,
    Object? lang = freezed,
    Object? place_id = freezed,
    Object? manger = freezed,
    Object? name_ar = freezed,
    Object? name_en = freezed,
    Object? type = freezed,
  }) {
    return _then(_$_LoginModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as dynamic,
      start_work: start_work == freezed
          ? _value.start_work
          : start_work // ignore: cast_nullable_to_non_nullable
              as String?,
      end_work: end_work == freezed
          ? _value.end_work
          : end_work // ignore: cast_nullable_to_non_nullable
              as String?,
      updated_at: updated_at == freezed
          ? _value.updated_at
          : updated_at // ignore: cast_nullable_to_non_nullable
              as String?,
      created_at: created_at == freezed
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as String?,
      national_id: national_id == freezed
          ? _value.national_id
          : national_id // ignore: cast_nullable_to_non_nullable
              as String?,
      lang: lang == freezed
          ? _value.lang
          : lang // ignore: cast_nullable_to_non_nullable
              as String?,
      place_id: place_id == freezed
          ? _value.place_id
          : place_id // ignore: cast_nullable_to_non_nullable
              as dynamic,
      manger: manger == freezed
          ? _value.manger
          : manger // ignore: cast_nullable_to_non_nullable
              as dynamic,
      name_ar: name_ar == freezed
          ? _value.name_ar
          : name_ar // ignore: cast_nullable_to_non_nullable
              as String?,
      name_en: name_en == freezed
          ? _value.name_en
          : name_en // ignore: cast_nullable_to_non_nullable
              as String?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_LoginModel implements _LoginModel {
  _$_LoginModel(
      {@JsonKey(name: "id") this.id,
      @JsonKey(name: "name") this.name,
      @JsonKey(name: "email") this.email,
      @JsonKey(name: "phone") this.phone,
      @JsonKey(name: "start_work") this.start_work,
      @JsonKey(name: "end_work") this.end_work,
      @JsonKey(name: "updated_at") this.updated_at,
      @JsonKey(name: "created_at") this.created_at,
      @JsonKey(name: "national_id") this.national_id,
      @JsonKey(name: "lang") this.lang,
      @JsonKey(name: "place_id") this.place_id,
      @JsonKey(name: "manger") this.manger,
      @JsonKey(nullable: true, ignore: true) this.name_ar,
      @JsonKey(nullable: true, ignore: true) this.name_en,
      this.type});

  factory _$_LoginModel.fromJson(Map<String, dynamic> json) =>
      _$$_LoginModelFromJson(json);

  @override
  @JsonKey(name: "id")
  final int? id;
  @override
  @JsonKey(name: "name")
  final String? name;
  @override
  @JsonKey(name: "email")
  final String? email;
  @override
  @JsonKey(name: "phone")
  final dynamic phone;
  @override
  @JsonKey(name: "start_work")
  final String? start_work;
  @override
  @JsonKey(name: "end_work")
  final String? end_work;
  @override
  @JsonKey(name: "updated_at")
  final String? updated_at;
  @override
  @JsonKey(name: "created_at")
  final String? created_at;
  @override
  @JsonKey(name: "national_id")
  final String? national_id;
  @override
  @JsonKey(name: "lang")
  final String? lang;
  @override
  @JsonKey(name: "place_id")
  final dynamic place_id;
  @override
  @JsonKey(name: "manger")
  final dynamic manger;
  @override
  @JsonKey(nullable: true, ignore: true)
  final String? name_ar;
  @override
  @JsonKey(nullable: true, ignore: true)
  final String? name_en;
  @override
  final int? type;

  @override
  String toString() {
    return 'LoginModel(id: $id, name: $name, email: $email, phone: $phone, start_work: $start_work, end_work: $end_work, updated_at: $updated_at, created_at: $created_at, national_id: $national_id, lang: $lang, place_id: $place_id, manger: $manger, name_ar: $name_ar, name_en: $name_en, type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoginModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.phone, phone) &&
            const DeepCollectionEquality()
                .equals(other.start_work, start_work) &&
            const DeepCollectionEquality().equals(other.end_work, end_work) &&
            const DeepCollectionEquality()
                .equals(other.updated_at, updated_at) &&
            const DeepCollectionEquality()
                .equals(other.created_at, created_at) &&
            const DeepCollectionEquality()
                .equals(other.national_id, national_id) &&
            const DeepCollectionEquality().equals(other.lang, lang) &&
            const DeepCollectionEquality().equals(other.place_id, place_id) &&
            const DeepCollectionEquality().equals(other.manger, manger) &&
            const DeepCollectionEquality().equals(other.name_ar, name_ar) &&
            const DeepCollectionEquality().equals(other.name_en, name_en) &&
            const DeepCollectionEquality().equals(other.type, type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(phone),
      const DeepCollectionEquality().hash(start_work),
      const DeepCollectionEquality().hash(end_work),
      const DeepCollectionEquality().hash(updated_at),
      const DeepCollectionEquality().hash(created_at),
      const DeepCollectionEquality().hash(national_id),
      const DeepCollectionEquality().hash(lang),
      const DeepCollectionEquality().hash(place_id),
      const DeepCollectionEquality().hash(manger),
      const DeepCollectionEquality().hash(name_ar),
      const DeepCollectionEquality().hash(name_en),
      const DeepCollectionEquality().hash(type));

  @JsonKey(ignore: true)
  @override
  _$$_LoginModelCopyWith<_$_LoginModel> get copyWith =>
      __$$_LoginModelCopyWithImpl<_$_LoginModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LoginModelToJson(
      this,
    );
  }
}

abstract class _LoginModel implements LoginModel {
  factory _LoginModel(
      {@JsonKey(name: "id") final int? id,
      @JsonKey(name: "name") final String? name,
      @JsonKey(name: "email") final String? email,
      @JsonKey(name: "phone") final dynamic phone,
      @JsonKey(name: "start_work") final String? start_work,
      @JsonKey(name: "end_work") final String? end_work,
      @JsonKey(name: "updated_at") final String? updated_at,
      @JsonKey(name: "created_at") final String? created_at,
      @JsonKey(name: "national_id") final String? national_id,
      @JsonKey(name: "lang") final String? lang,
      @JsonKey(name: "place_id") final dynamic place_id,
      @JsonKey(name: "manger") final dynamic manger,
      @JsonKey(nullable: true, ignore: true) final String? name_ar,
      @JsonKey(nullable: true, ignore: true) final String? name_en,
      final int? type}) = _$_LoginModel;

  factory _LoginModel.fromJson(Map<String, dynamic> json) =
      _$_LoginModel.fromJson;

  @override
  @JsonKey(name: "id")
  int? get id;
  @override
  @JsonKey(name: "name")
  String? get name;
  @override
  @JsonKey(name: "email")
  String? get email;
  @override
  @JsonKey(name: "phone")
  dynamic get phone;
  @override
  @JsonKey(name: "start_work")
  String? get start_work;
  @override
  @JsonKey(name: "end_work")
  String? get end_work;
  @override
  @JsonKey(name: "updated_at")
  String? get updated_at;
  @override
  @JsonKey(name: "created_at")
  String? get created_at;
  @override
  @JsonKey(name: "national_id")
  String? get national_id;
  @override
  @JsonKey(name: "lang")
  String? get lang;
  @override
  @JsonKey(name: "place_id")
  dynamic get place_id;
  @override
  @JsonKey(name: "manger")
  dynamic get manger;
  @override
  @JsonKey(nullable: true, ignore: true)
  String? get name_ar;
  @override
  @JsonKey(nullable: true, ignore: true)
  String? get name_en;
  @override
  int? get type;
  @override
  @JsonKey(ignore: true)
  _$$_LoginModelCopyWith<_$_LoginModel> get copyWith =>
      throw _privateConstructorUsedError;
}
