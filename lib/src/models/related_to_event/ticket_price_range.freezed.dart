// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'ticket_price_range.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$TicketPriceRangeTearOff {
  const _$TicketPriceRangeTearOff();

  _TicketPriceRange call(
      {required double minPrice,
      required double? maxPrice,
      required MoneyCurrency currency}) {
    return _TicketPriceRange(
      minPrice: minPrice,
      maxPrice: maxPrice,
      currency: currency,
    );
  }
}

/// @nodoc
const $TicketPriceRange = _$TicketPriceRangeTearOff();

/// @nodoc
mixin _$TicketPriceRange {
  double get minPrice => throw _privateConstructorUsedError;
  double? get maxPrice => throw _privateConstructorUsedError;
  MoneyCurrency get currency => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TicketPriceRangeCopyWith<TicketPriceRange> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TicketPriceRangeCopyWith<$Res> {
  factory $TicketPriceRangeCopyWith(
          TicketPriceRange value, $Res Function(TicketPriceRange) then) =
      _$TicketPriceRangeCopyWithImpl<$Res>;
  $Res call({double minPrice, double? maxPrice, MoneyCurrency currency});
}

/// @nodoc
class _$TicketPriceRangeCopyWithImpl<$Res>
    implements $TicketPriceRangeCopyWith<$Res> {
  _$TicketPriceRangeCopyWithImpl(this._value, this._then);

  final TicketPriceRange _value;
  // ignore: unused_field
  final $Res Function(TicketPriceRange) _then;

  @override
  $Res call({
    Object? minPrice = freezed,
    Object? maxPrice = freezed,
    Object? currency = freezed,
  }) {
    return _then(_value.copyWith(
      minPrice: minPrice == freezed
          ? _value.minPrice
          : minPrice // ignore: cast_nullable_to_non_nullable
              as double,
      maxPrice: maxPrice == freezed
          ? _value.maxPrice
          : maxPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      currency: currency == freezed
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as MoneyCurrency,
    ));
  }
}

/// @nodoc
abstract class _$TicketPriceRangeCopyWith<$Res>
    implements $TicketPriceRangeCopyWith<$Res> {
  factory _$TicketPriceRangeCopyWith(
          _TicketPriceRange value, $Res Function(_TicketPriceRange) then) =
      __$TicketPriceRangeCopyWithImpl<$Res>;
  @override
  $Res call({double minPrice, double? maxPrice, MoneyCurrency currency});
}

/// @nodoc
class __$TicketPriceRangeCopyWithImpl<$Res>
    extends _$TicketPriceRangeCopyWithImpl<$Res>
    implements _$TicketPriceRangeCopyWith<$Res> {
  __$TicketPriceRangeCopyWithImpl(
      _TicketPriceRange _value, $Res Function(_TicketPriceRange) _then)
      : super(_value, (v) => _then(v as _TicketPriceRange));

  @override
  _TicketPriceRange get _value => super._value as _TicketPriceRange;

  @override
  $Res call({
    Object? minPrice = freezed,
    Object? maxPrice = freezed,
    Object? currency = freezed,
  }) {
    return _then(_TicketPriceRange(
      minPrice: minPrice == freezed
          ? _value.minPrice
          : minPrice // ignore: cast_nullable_to_non_nullable
              as double,
      maxPrice: maxPrice == freezed
          ? _value.maxPrice
          : maxPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      currency: currency == freezed
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as MoneyCurrency,
    ));
  }
}

/// @nodoc

class _$_TicketPriceRange
    with DiagnosticableTreeMixin
    implements _TicketPriceRange {
  _$_TicketPriceRange(
      {required this.minPrice, required this.maxPrice, required this.currency});

  @override
  final double minPrice;
  @override
  final double? maxPrice;
  @override
  final MoneyCurrency currency;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TicketPriceRange(minPrice: $minPrice, maxPrice: $maxPrice, currency: $currency)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TicketPriceRange'))
      ..add(DiagnosticsProperty('minPrice', minPrice))
      ..add(DiagnosticsProperty('maxPrice', maxPrice))
      ..add(DiagnosticsProperty('currency', currency));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TicketPriceRange &&
            (identical(other.minPrice, minPrice) ||
                const DeepCollectionEquality()
                    .equals(other.minPrice, minPrice)) &&
            (identical(other.maxPrice, maxPrice) ||
                const DeepCollectionEquality()
                    .equals(other.maxPrice, maxPrice)) &&
            (identical(other.currency, currency) ||
                const DeepCollectionEquality()
                    .equals(other.currency, currency)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(minPrice) ^
      const DeepCollectionEquality().hash(maxPrice) ^
      const DeepCollectionEquality().hash(currency);

  @JsonKey(ignore: true)
  @override
  _$TicketPriceRangeCopyWith<_TicketPriceRange> get copyWith =>
      __$TicketPriceRangeCopyWithImpl<_TicketPriceRange>(this, _$identity);
}

abstract class _TicketPriceRange implements TicketPriceRange {
  factory _TicketPriceRange(
      {required double minPrice,
      required double? maxPrice,
      required MoneyCurrency currency}) = _$_TicketPriceRange;

  @override
  double get minPrice => throw _privateConstructorUsedError;
  @override
  double? get maxPrice => throw _privateConstructorUsedError;
  @override
  MoneyCurrency get currency => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$TicketPriceRangeCopyWith<_TicketPriceRange> get copyWith =>
      throw _privateConstructorUsedError;
}
