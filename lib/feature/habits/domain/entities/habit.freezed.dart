// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'habit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Habit {

 String get id; String get name; int get colorValue; int get iconCodePoint; String get iconFontFamily;// DateTime.weekday values: 1=Mon .. 7=Sun
 List<int> get scheduledWeekdays; DateTime get createdAt;
/// Create a copy of Habit
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HabitCopyWith<Habit> get copyWith => _$HabitCopyWithImpl<Habit>(this as Habit, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Habit&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.colorValue, colorValue) || other.colorValue == colorValue)&&(identical(other.iconCodePoint, iconCodePoint) || other.iconCodePoint == iconCodePoint)&&(identical(other.iconFontFamily, iconFontFamily) || other.iconFontFamily == iconFontFamily)&&const DeepCollectionEquality().equals(other.scheduledWeekdays, scheduledWeekdays)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,colorValue,iconCodePoint,iconFontFamily,const DeepCollectionEquality().hash(scheduledWeekdays),createdAt);

@override
String toString() {
  return 'Habit(id: $id, name: $name, colorValue: $colorValue, iconCodePoint: $iconCodePoint, iconFontFamily: $iconFontFamily, scheduledWeekdays: $scheduledWeekdays, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $HabitCopyWith<$Res>  {
  factory $HabitCopyWith(Habit value, $Res Function(Habit) _then) = _$HabitCopyWithImpl;
@useResult
$Res call({
 String id, String name, int colorValue, int iconCodePoint, String iconFontFamily, List<int> scheduledWeekdays, DateTime createdAt
});




}
/// @nodoc
class _$HabitCopyWithImpl<$Res>
    implements $HabitCopyWith<$Res> {
  _$HabitCopyWithImpl(this._self, this._then);

  final Habit _self;
  final $Res Function(Habit) _then;

/// Create a copy of Habit
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? colorValue = null,Object? iconCodePoint = null,Object? iconFontFamily = null,Object? scheduledWeekdays = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,colorValue: null == colorValue ? _self.colorValue : colorValue // ignore: cast_nullable_to_non_nullable
as int,iconCodePoint: null == iconCodePoint ? _self.iconCodePoint : iconCodePoint // ignore: cast_nullable_to_non_nullable
as int,iconFontFamily: null == iconFontFamily ? _self.iconFontFamily : iconFontFamily // ignore: cast_nullable_to_non_nullable
as String,scheduledWeekdays: null == scheduledWeekdays ? _self.scheduledWeekdays : scheduledWeekdays // ignore: cast_nullable_to_non_nullable
as List<int>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [Habit].
extension HabitPatterns on Habit {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Habit value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Habit() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Habit value)  $default,){
final _that = this;
switch (_that) {
case _Habit():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Habit value)?  $default,){
final _that = this;
switch (_that) {
case _Habit() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  int colorValue,  int iconCodePoint,  String iconFontFamily,  List<int> scheduledWeekdays,  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Habit() when $default != null:
return $default(_that.id,_that.name,_that.colorValue,_that.iconCodePoint,_that.iconFontFamily,_that.scheduledWeekdays,_that.createdAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  int colorValue,  int iconCodePoint,  String iconFontFamily,  List<int> scheduledWeekdays,  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _Habit():
return $default(_that.id,_that.name,_that.colorValue,_that.iconCodePoint,_that.iconFontFamily,_that.scheduledWeekdays,_that.createdAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  int colorValue,  int iconCodePoint,  String iconFontFamily,  List<int> scheduledWeekdays,  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _Habit() when $default != null:
return $default(_that.id,_that.name,_that.colorValue,_that.iconCodePoint,_that.iconFontFamily,_that.scheduledWeekdays,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc


class _Habit implements Habit {
  const _Habit({required this.id, required this.name, required this.colorValue, required this.iconCodePoint, required this.iconFontFamily, required final  List<int> scheduledWeekdays, required this.createdAt}): _scheduledWeekdays = scheduledWeekdays;
  

@override final  String id;
@override final  String name;
@override final  int colorValue;
@override final  int iconCodePoint;
@override final  String iconFontFamily;
// DateTime.weekday values: 1=Mon .. 7=Sun
 final  List<int> _scheduledWeekdays;
// DateTime.weekday values: 1=Mon .. 7=Sun
@override List<int> get scheduledWeekdays {
  if (_scheduledWeekdays is EqualUnmodifiableListView) return _scheduledWeekdays;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_scheduledWeekdays);
}

@override final  DateTime createdAt;

/// Create a copy of Habit
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HabitCopyWith<_Habit> get copyWith => __$HabitCopyWithImpl<_Habit>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Habit&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.colorValue, colorValue) || other.colorValue == colorValue)&&(identical(other.iconCodePoint, iconCodePoint) || other.iconCodePoint == iconCodePoint)&&(identical(other.iconFontFamily, iconFontFamily) || other.iconFontFamily == iconFontFamily)&&const DeepCollectionEquality().equals(other._scheduledWeekdays, _scheduledWeekdays)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,colorValue,iconCodePoint,iconFontFamily,const DeepCollectionEquality().hash(_scheduledWeekdays),createdAt);

@override
String toString() {
  return 'Habit(id: $id, name: $name, colorValue: $colorValue, iconCodePoint: $iconCodePoint, iconFontFamily: $iconFontFamily, scheduledWeekdays: $scheduledWeekdays, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$HabitCopyWith<$Res> implements $HabitCopyWith<$Res> {
  factory _$HabitCopyWith(_Habit value, $Res Function(_Habit) _then) = __$HabitCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, int colorValue, int iconCodePoint, String iconFontFamily, List<int> scheduledWeekdays, DateTime createdAt
});




}
/// @nodoc
class __$HabitCopyWithImpl<$Res>
    implements _$HabitCopyWith<$Res> {
  __$HabitCopyWithImpl(this._self, this._then);

  final _Habit _self;
  final $Res Function(_Habit) _then;

/// Create a copy of Habit
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? colorValue = null,Object? iconCodePoint = null,Object? iconFontFamily = null,Object? scheduledWeekdays = null,Object? createdAt = null,}) {
  return _then(_Habit(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,colorValue: null == colorValue ? _self.colorValue : colorValue // ignore: cast_nullable_to_non_nullable
as int,iconCodePoint: null == iconCodePoint ? _self.iconCodePoint : iconCodePoint // ignore: cast_nullable_to_non_nullable
as int,iconFontFamily: null == iconFontFamily ? _self.iconFontFamily : iconFontFamily // ignore: cast_nullable_to_non_nullable
as String,scheduledWeekdays: null == scheduledWeekdays ? _self._scheduledWeekdays : scheduledWeekdays // ignore: cast_nullable_to_non_nullable
as List<int>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
