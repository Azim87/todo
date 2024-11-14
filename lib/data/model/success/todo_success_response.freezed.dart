// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo_success_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TodoSuccessResponse _$TodoSuccessResponseFromJson(Map<String, dynamic> json) {
  return _TodoSuccessResponse.fromJson(json);
}

/// @nodoc
mixin _$TodoSuccessResponse {
  String? get message => throw _privateConstructorUsedError;
  bool? get success => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TodoSuccessResponseCopyWith<TodoSuccessResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoSuccessResponseCopyWith<$Res> {
  factory $TodoSuccessResponseCopyWith(
          TodoSuccessResponse value, $Res Function(TodoSuccessResponse) then) =
      _$TodoSuccessResponseCopyWithImpl<$Res, TodoSuccessResponse>;
  @useResult
  $Res call({String? message, bool? success});
}

/// @nodoc
class _$TodoSuccessResponseCopyWithImpl<$Res, $Val extends TodoSuccessResponse>
    implements $TodoSuccessResponseCopyWith<$Res> {
  _$TodoSuccessResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? success = freezed,
  }) {
    return _then(_value.copyWith(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      success: freezed == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TodoSuccessResponseImplCopyWith<$Res>
    implements $TodoSuccessResponseCopyWith<$Res> {
  factory _$$TodoSuccessResponseImplCopyWith(_$TodoSuccessResponseImpl value,
          $Res Function(_$TodoSuccessResponseImpl) then) =
      __$$TodoSuccessResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? message, bool? success});
}

/// @nodoc
class __$$TodoSuccessResponseImplCopyWithImpl<$Res>
    extends _$TodoSuccessResponseCopyWithImpl<$Res, _$TodoSuccessResponseImpl>
    implements _$$TodoSuccessResponseImplCopyWith<$Res> {
  __$$TodoSuccessResponseImplCopyWithImpl(_$TodoSuccessResponseImpl _value,
      $Res Function(_$TodoSuccessResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? success = freezed,
  }) {
    return _then(_$TodoSuccessResponseImpl(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      success: freezed == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TodoSuccessResponseImpl implements _TodoSuccessResponse {
  const _$TodoSuccessResponseImpl({this.message, this.success});

  factory _$TodoSuccessResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$TodoSuccessResponseImplFromJson(json);

  @override
  final String? message;
  @override
  final bool? success;

  @override
  String toString() {
    return 'TodoSuccessResponse(message: $message, success: $success)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TodoSuccessResponseImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.success, success) || other.success == success));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, message, success);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TodoSuccessResponseImplCopyWith<_$TodoSuccessResponseImpl> get copyWith =>
      __$$TodoSuccessResponseImplCopyWithImpl<_$TodoSuccessResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TodoSuccessResponseImplToJson(
      this,
    );
  }
}

abstract class _TodoSuccessResponse implements TodoSuccessResponse {
  const factory _TodoSuccessResponse(
      {final String? message, final bool? success}) = _$TodoSuccessResponseImpl;

  factory _TodoSuccessResponse.fromJson(Map<String, dynamic> json) =
      _$TodoSuccessResponseImpl.fromJson;

  @override
  String? get message;
  @override
  bool? get success;
  @override
  @JsonKey(ignore: true)
  _$$TodoSuccessResponseImplCopyWith<_$TodoSuccessResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
