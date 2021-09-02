// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'tokens.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Tokens _$TokensFromJson(Map<String, dynamic> json) {
  return _Tokens.fromJson(json);
}

/// @nodoc
class _$TokensTearOff {
  const _$TokensTearOff();

  _Tokens call({required String toggl, required String todoist}) {
    return _Tokens(
      toggl: toggl,
      todoist: todoist,
    );
  }

  Tokens fromJson(Map<String, Object> json) {
    return Tokens.fromJson(json);
  }
}

/// @nodoc
const $Tokens = _$TokensTearOff();

/// @nodoc
mixin _$Tokens {
  String get toggl => throw _privateConstructorUsedError;
  String get todoist => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TokensCopyWith<Tokens> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TokensCopyWith<$Res> {
  factory $TokensCopyWith(Tokens value, $Res Function(Tokens) then) =
      _$TokensCopyWithImpl<$Res>;
  $Res call({String toggl, String todoist});
}

/// @nodoc
class _$TokensCopyWithImpl<$Res> implements $TokensCopyWith<$Res> {
  _$TokensCopyWithImpl(this._value, this._then);

  final Tokens _value;
  // ignore: unused_field
  final $Res Function(Tokens) _then;

  @override
  $Res call({
    Object? toggl = freezed,
    Object? todoist = freezed,
  }) {
    return _then(_value.copyWith(
      toggl: toggl == freezed
          ? _value.toggl
          : toggl // ignore: cast_nullable_to_non_nullable
              as String,
      todoist: todoist == freezed
          ? _value.todoist
          : todoist // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$TokensCopyWith<$Res> implements $TokensCopyWith<$Res> {
  factory _$TokensCopyWith(_Tokens value, $Res Function(_Tokens) then) =
      __$TokensCopyWithImpl<$Res>;
  @override
  $Res call({String toggl, String todoist});
}

/// @nodoc
class __$TokensCopyWithImpl<$Res> extends _$TokensCopyWithImpl<$Res>
    implements _$TokensCopyWith<$Res> {
  __$TokensCopyWithImpl(_Tokens _value, $Res Function(_Tokens) _then)
      : super(_value, (v) => _then(v as _Tokens));

  @override
  _Tokens get _value => super._value as _Tokens;

  @override
  $Res call({
    Object? toggl = freezed,
    Object? todoist = freezed,
  }) {
    return _then(_Tokens(
      toggl: toggl == freezed
          ? _value.toggl
          : toggl // ignore: cast_nullable_to_non_nullable
              as String,
      todoist: todoist == freezed
          ? _value.todoist
          : todoist // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Tokens extends _Tokens with DiagnosticableTreeMixin {
  const _$_Tokens({required this.toggl, required this.todoist}) : super._();

  factory _$_Tokens.fromJson(Map<String, dynamic> json) =>
      _$_$_TokensFromJson(json);

  @override
  final String toggl;
  @override
  final String todoist;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Tokens(toggl: $toggl, todoist: $todoist)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Tokens'))
      ..add(DiagnosticsProperty('toggl', toggl))
      ..add(DiagnosticsProperty('todoist', todoist));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Tokens &&
            (identical(other.toggl, toggl) ||
                const DeepCollectionEquality().equals(other.toggl, toggl)) &&
            (identical(other.todoist, todoist) ||
                const DeepCollectionEquality().equals(other.todoist, todoist)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(toggl) ^
      const DeepCollectionEquality().hash(todoist);

  @JsonKey(ignore: true)
  @override
  _$TokensCopyWith<_Tokens> get copyWith =>
      __$TokensCopyWithImpl<_Tokens>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_TokensToJson(this);
  }
}

abstract class _Tokens extends Tokens {
  const factory _Tokens({required String toggl, required String todoist}) =
      _$_Tokens;
  const _Tokens._() : super._();

  factory _Tokens.fromJson(Map<String, dynamic> json) = _$_Tokens.fromJson;

  @override
  String get toggl => throw _privateConstructorUsedError;
  @override
  String get todoist => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$TokensCopyWith<_Tokens> get copyWith => throw _privateConstructorUsedError;
}
