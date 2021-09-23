// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'ticket_price.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TicketPrice _$TicketPriceFromJson(Map<String, dynamic> json) {
  return _TicketPrice.fromJson(json);
}

/// @nodoc
class _$TicketPriceTearOff {
  const _$TicketPriceTearOff();

  _TicketPrice call(
      {required int id,
      required String name,
      required double price,
      required MoneyCurrency currency}) {
    return _TicketPrice(
      id: id,
      name: name,
      price: price,
      currency: currency,
    );
  }

  TicketPrice fromJson(Map<String, Object> json) {
    return TicketPrice.fromJson(json);
  }
}

/// @nodoc
const $TicketPrice = _$TicketPriceTearOff();

/// @nodoc
mixin _$TicketPrice {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  MoneyCurrency get currency => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TicketPriceCopyWith<TicketPrice> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TicketPriceCopyWith<$Res> {
  factory $TicketPriceCopyWith(
          TicketPrice value, $Res Function(TicketPrice) then) =
      _$TicketPriceCopyWithImpl<$Res>;
  $Res call({int id, String name, double price, MoneyCurrency currency});
}

/// @nodoc
class _$TicketPriceCopyWithImpl<$Res> implements $TicketPriceCopyWith<$Res> {
  _$TicketPriceCopyWithImpl(this._value, this._then);

  final TicketPrice _value;
  // ignore: unused_field
  final $Res Function(TicketPrice) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? price = freezed,
    Object? currency = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      currency: currency == freezed
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as MoneyCurrency,
    ));
  }
}

/// @nodoc
abstract class _$TicketPriceCopyWith<$Res>
    implements $TicketPriceCopyWith<$Res> {
  factory _$TicketPriceCopyWith(
          _TicketPrice value, $Res Function(_TicketPrice) then) =
      __$TicketPriceCopyWithImpl<$Res>;
  @override
  $Res call({int id, String name, double price, MoneyCurrency currency});
}

/// @nodoc
class __$TicketPriceCopyWithImpl<$Res> extends _$TicketPriceCopyWithImpl<$Res>
    implements _$TicketPriceCopyWith<$Res> {
  __$TicketPriceCopyWithImpl(
      _TicketPrice _value, $Res Function(_TicketPrice) _then)
      : super(_value, (v) => _then(v as _TicketPrice));

  @override
  _TicketPrice get _value => super._value as _TicketPrice;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? price = freezed,
    Object? currency = freezed,
  }) {
    return _then(_TicketPrice(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      currency: currency == freezed
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as MoneyCurrency,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TicketPrice with DiagnosticableTreeMixin implements _TicketPrice {
  const _$_TicketPrice(
      {required this.id,
      required this.name,
      required this.price,
      required this.currency});

  factory _$_TicketPrice.fromJson(Map<String, dynamic> json) =>
      _$_$_TicketPriceFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final double price;
  @override
  final MoneyCurrency currency;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TicketPrice(id: $id, name: $name, price: $price, currency: $currency)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TicketPrice'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('price', price))
      ..add(DiagnosticsProperty('currency', currency));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TicketPrice &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.price, price) ||
                const DeepCollectionEquality().equals(other.price, price)) &&
            (identical(other.currency, currency) ||
                const DeepCollectionEquality()
                    .equals(other.currency, currency)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(price) ^
      const DeepCollectionEquality().hash(currency);

  @JsonKey(ignore: true)
  @override
  _$TicketPriceCopyWith<_TicketPrice> get copyWith =>
      __$TicketPriceCopyWithImpl<_TicketPrice>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_TicketPriceToJson(this);
  }
}

abstract class _TicketPrice implements TicketPrice {
  const factory _TicketPrice(
      {required int id,
      required String name,
      required double price,
      required MoneyCurrency currency}) = _$_TicketPrice;

  factory _TicketPrice.fromJson(Map<String, dynamic> json) =
      _$_TicketPrice.fromJson;

  @override
  int get id => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  double get price => throw _privateConstructorUsedError;
  @override
  MoneyCurrency get currency => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$TicketPriceCopyWith<_TicketPrice> get copyWith =>
      throw _privateConstructorUsedError;
}
