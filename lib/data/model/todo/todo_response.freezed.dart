// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TodoResponse _$TodoResponseFromJson(Map<String, dynamic> json) {
  return _TodoResponse.fromJson(json);
}

/// @nodoc
mixin _$TodoResponse {
  List<TodoData>? get data => throw _privateConstructorUsedError;
  bool? get success => throw _privateConstructorUsedError;

  /// Serializes this TodoResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TodoResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TodoResponseCopyWith<TodoResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoResponseCopyWith<$Res> {
  factory $TodoResponseCopyWith(
          TodoResponse value, $Res Function(TodoResponse) then) =
      _$TodoResponseCopyWithImpl<$Res, TodoResponse>;
  @useResult
  $Res call({List<TodoData>? data, bool? success});
}

/// @nodoc
class _$TodoResponseCopyWithImpl<$Res, $Val extends TodoResponse>
    implements $TodoResponseCopyWith<$Res> {
  _$TodoResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TodoResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? success = freezed,
  }) {
    return _then(_value.copyWith(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<TodoData>?,
      success: freezed == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TodoResponseImplCopyWith<$Res>
    implements $TodoResponseCopyWith<$Res> {
  factory _$$TodoResponseImplCopyWith(
          _$TodoResponseImpl value, $Res Function(_$TodoResponseImpl) then) =
      __$$TodoResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<TodoData>? data, bool? success});
}

/// @nodoc
class __$$TodoResponseImplCopyWithImpl<$Res>
    extends _$TodoResponseCopyWithImpl<$Res, _$TodoResponseImpl>
    implements _$$TodoResponseImplCopyWith<$Res> {
  __$$TodoResponseImplCopyWithImpl(
      _$TodoResponseImpl _value, $Res Function(_$TodoResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of TodoResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? success = freezed,
  }) {
    return _then(_$TodoResponseImpl(
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<TodoData>?,
      success: freezed == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TodoResponseImpl implements _TodoResponse {
  const _$TodoResponseImpl({final List<TodoData>? data, this.success})
      : _data = data;

  factory _$TodoResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$TodoResponseImplFromJson(json);

  final List<TodoData>? _data;
  @override
  List<TodoData>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final bool? success;

  @override
  String toString() {
    return 'TodoResponse(data: $data, success: $success)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TodoResponseImpl &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.success, success) || other.success == success));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_data), success);

  /// Create a copy of TodoResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TodoResponseImplCopyWith<_$TodoResponseImpl> get copyWith =>
      __$$TodoResponseImplCopyWithImpl<_$TodoResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TodoResponseImplToJson(
      this,
    );
  }
}

abstract class _TodoResponse implements TodoResponse {
  const factory _TodoResponse(
      {final List<TodoData>? data, final bool? success}) = _$TodoResponseImpl;

  factory _TodoResponse.fromJson(Map<String, dynamic> json) =
      _$TodoResponseImpl.fromJson;

  @override
  List<TodoData>? get data;
  @override
  bool? get success;

  /// Create a copy of TodoResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TodoResponseImplCopyWith<_$TodoResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TodoData _$TodoDataFromJson(Map<String, dynamic> json) {
  return _TodoData.fromJson(json);
}

/// @nodoc
mixin _$TodoData {
  int? get id => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  bool? get completed => throw _privateConstructorUsedError;

  /// Serializes this TodoData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TodoData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TodoDataCopyWith<TodoData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoDataCopyWith<$Res> {
  factory $TodoDataCopyWith(TodoData value, $Res Function(TodoData) then) =
      _$TodoDataCopyWithImpl<$Res, TodoData>;
  @useResult
  $Res call({int? id, String? title, String? description, bool? completed});
}

/// @nodoc
class _$TodoDataCopyWithImpl<$Res, $Val extends TodoData>
    implements $TodoDataCopyWith<$Res> {
  _$TodoDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TodoData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? completed = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      completed: freezed == completed
          ? _value.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TodoDataImplCopyWith<$Res>
    implements $TodoDataCopyWith<$Res> {
  factory _$$TodoDataImplCopyWith(
          _$TodoDataImpl value, $Res Function(_$TodoDataImpl) then) =
      __$$TodoDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? title, String? description, bool? completed});
}

/// @nodoc
class __$$TodoDataImplCopyWithImpl<$Res>
    extends _$TodoDataCopyWithImpl<$Res, _$TodoDataImpl>
    implements _$$TodoDataImplCopyWith<$Res> {
  __$$TodoDataImplCopyWithImpl(
      _$TodoDataImpl _value, $Res Function(_$TodoDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of TodoData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? completed = freezed,
  }) {
    return _then(_$TodoDataImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      completed: freezed == completed
          ? _value.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TodoDataImpl implements _TodoData {
  const _$TodoDataImpl({this.id, this.title, this.description, this.completed});

  factory _$TodoDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$TodoDataImplFromJson(json);

  @override
  final int? id;
  @override
  final String? title;
  @override
  final String? description;
  @override
  final bool? completed;

  @override
  String toString() {
    return 'TodoData(id: $id, title: $title, description: $description, completed: $completed)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TodoDataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.completed, completed) ||
                other.completed == completed));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, description, completed);

  /// Create a copy of TodoData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TodoDataImplCopyWith<_$TodoDataImpl> get copyWith =>
      __$$TodoDataImplCopyWithImpl<_$TodoDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TodoDataImplToJson(
      this,
    );
  }
}

abstract class _TodoData implements TodoData {
  const factory _TodoData(
      {final int? id,
      final String? title,
      final String? description,
      final bool? completed}) = _$TodoDataImpl;

  factory _TodoData.fromJson(Map<String, dynamic> json) =
      _$TodoDataImpl.fromJson;

  @override
  int? get id;
  @override
  String? get title;
  @override
  String? get description;
  @override
  bool? get completed;

  /// Create a copy of TodoData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TodoDataImplCopyWith<_$TodoDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
