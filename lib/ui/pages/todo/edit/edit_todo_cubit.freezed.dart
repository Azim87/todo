// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_todo_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EditTodoState {
  bool get loading => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

  /// Create a copy of EditTodoState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EditTodoStateCopyWith<EditTodoState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditTodoStateCopyWith<$Res> {
  factory $EditTodoStateCopyWith(
          EditTodoState value, $Res Function(EditTodoState) then) =
      _$EditTodoStateCopyWithImpl<$Res, EditTodoState>;
  @useResult
  $Res call({bool loading, String? title, String? description});
}

/// @nodoc
class _$EditTodoStateCopyWithImpl<$Res, $Val extends EditTodoState>
    implements $EditTodoStateCopyWith<$Res> {
  _$EditTodoStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EditTodoState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? title = freezed,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EditTodoStateImplCopyWith<$Res>
    implements $EditTodoStateCopyWith<$Res> {
  factory _$$EditTodoStateImplCopyWith(
          _$EditTodoStateImpl value, $Res Function(_$EditTodoStateImpl) then) =
      __$$EditTodoStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool loading, String? title, String? description});
}

/// @nodoc
class __$$EditTodoStateImplCopyWithImpl<$Res>
    extends _$EditTodoStateCopyWithImpl<$Res, _$EditTodoStateImpl>
    implements _$$EditTodoStateImplCopyWith<$Res> {
  __$$EditTodoStateImplCopyWithImpl(
      _$EditTodoStateImpl _value, $Res Function(_$EditTodoStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of EditTodoState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? title = freezed,
    Object? description = freezed,
  }) {
    return _then(_$EditTodoStateImpl(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$EditTodoStateImpl
    with DiagnosticableTreeMixin
    implements _EditTodoState {
  const _$EditTodoStateImpl(
      {this.loading = false, this.title, this.description});

  @override
  @JsonKey()
  final bool loading;
  @override
  final String? title;
  @override
  final String? description;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'EditTodoState(loading: $loading, title: $title, description: $description)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'EditTodoState'))
      ..add(DiagnosticsProperty('loading', loading))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('description', description));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditTodoStateImpl &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @override
  int get hashCode => Object.hash(runtimeType, loading, title, description);

  /// Create a copy of EditTodoState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EditTodoStateImplCopyWith<_$EditTodoStateImpl> get copyWith =>
      __$$EditTodoStateImplCopyWithImpl<_$EditTodoStateImpl>(this, _$identity);
}

abstract class _EditTodoState implements EditTodoState {
  const factory _EditTodoState(
      {final bool loading,
      final String? title,
      final String? description}) = _$EditTodoStateImpl;

  @override
  bool get loading;
  @override
  String? get title;
  @override
  String? get description;

  /// Create a copy of EditTodoState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EditTodoStateImplCopyWith<_$EditTodoStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
