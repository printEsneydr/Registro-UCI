// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'registro_nutricional.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RegistroNutricional {
  String get idRegistroNutricional =>
      throw _privateConstructorUsedError; // ANTROPOMETRÍA
  double get peso => throw _privateConstructorUsedError; // kg
  double get talla => throw _privateConstructorUsedError; // cm
  double? get pesoUsual =>
      throw _privateConstructorUsedError; // kg (antes de enfermar)
  double get imc =>
      throw _privateConstructorUsedError; // calculado automáticamente
// TIPO DE ALIMENTACIÓN
  TipoAlimentacion get tipoAlimentacion => throw _privateConstructorUsedError;
  String? get formulaEnteral =>
      throw _privateConstructorUsedError; // Si es enteral, nombre de fórmula
// REGISTRO DIARIO
  double get caloriasAdministradas =>
      throw _privateConstructorUsedError; // kcal
  double get caloriasRequeridas =>
      throw _privateConstructorUsedError; // kcal (calculado)
  double get balanceNutricional =>
      throw _privateConstructorUsedError; // calculado
// MACRONUTRIENTES (opcional)
  double? get proteinas => throw _privateConstructorUsedError; // gramos
  double? get carbohidratos => throw _privateConstructorUsedError; // gramos
  double? get lipidos => throw _privateConstructorUsedError; // gramos
// TOLERANCIA
  bool get toleraAlimentacion => throw _privateConstructorUsedError;
  String? get efectosSecundarios =>
      throw _privateConstructorUsedError; // náuseas, vómitos, diarrea, etc.
// METADATOS
  DateTime get fecha => throw _privateConstructorUsedError;
  DateTime get hora => throw _privateConstructorUsedError;
  String? get observaciones => throw _privateConstructorUsedError;

  /// Create a copy of RegistroNutricional
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RegistroNutricionalCopyWith<RegistroNutricional> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegistroNutricionalCopyWith<$Res> {
  factory $RegistroNutricionalCopyWith(
          RegistroNutricional value, $Res Function(RegistroNutricional) then) =
      _$RegistroNutricionalCopyWithImpl<$Res, RegistroNutricional>;
  @useResult
  $Res call(
      {String idRegistroNutricional,
      double peso,
      double talla,
      double? pesoUsual,
      double imc,
      TipoAlimentacion tipoAlimentacion,
      String? formulaEnteral,
      double caloriasAdministradas,
      double caloriasRequeridas,
      double balanceNutricional,
      double? proteinas,
      double? carbohidratos,
      double? lipidos,
      bool toleraAlimentacion,
      String? efectosSecundarios,
      DateTime fecha,
      DateTime hora,
      String? observaciones});
}

/// @nodoc
class _$RegistroNutricionalCopyWithImpl<$Res, $Val extends RegistroNutricional>
    implements $RegistroNutricionalCopyWith<$Res> {
  _$RegistroNutricionalCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RegistroNutricional
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idRegistroNutricional = null,
    Object? peso = null,
    Object? talla = null,
    Object? pesoUsual = freezed,
    Object? imc = null,
    Object? tipoAlimentacion = null,
    Object? formulaEnteral = freezed,
    Object? caloriasAdministradas = null,
    Object? caloriasRequeridas = null,
    Object? balanceNutricional = null,
    Object? proteinas = freezed,
    Object? carbohidratos = freezed,
    Object? lipidos = freezed,
    Object? toleraAlimentacion = null,
    Object? efectosSecundarios = freezed,
    Object? fecha = null,
    Object? hora = null,
    Object? observaciones = freezed,
  }) {
    return _then(_value.copyWith(
      idRegistroNutricional: null == idRegistroNutricional
          ? _value.idRegistroNutricional
          : idRegistroNutricional // ignore: cast_nullable_to_non_nullable
              as String,
      peso: null == peso
          ? _value.peso
          : peso // ignore: cast_nullable_to_non_nullable
              as double,
      talla: null == talla
          ? _value.talla
          : talla // ignore: cast_nullable_to_non_nullable
              as double,
      pesoUsual: freezed == pesoUsual
          ? _value.pesoUsual
          : pesoUsual // ignore: cast_nullable_to_non_nullable
              as double?,
      imc: null == imc
          ? _value.imc
          : imc // ignore: cast_nullable_to_non_nullable
              as double,
      tipoAlimentacion: null == tipoAlimentacion
          ? _value.tipoAlimentacion
          : tipoAlimentacion // ignore: cast_nullable_to_non_nullable
              as TipoAlimentacion,
      formulaEnteral: freezed == formulaEnteral
          ? _value.formulaEnteral
          : formulaEnteral // ignore: cast_nullable_to_non_nullable
              as String?,
      caloriasAdministradas: null == caloriasAdministradas
          ? _value.caloriasAdministradas
          : caloriasAdministradas // ignore: cast_nullable_to_non_nullable
              as double,
      caloriasRequeridas: null == caloriasRequeridas
          ? _value.caloriasRequeridas
          : caloriasRequeridas // ignore: cast_nullable_to_non_nullable
              as double,
      balanceNutricional: null == balanceNutricional
          ? _value.balanceNutricional
          : balanceNutricional // ignore: cast_nullable_to_non_nullable
              as double,
      proteinas: freezed == proteinas
          ? _value.proteinas
          : proteinas // ignore: cast_nullable_to_non_nullable
              as double?,
      carbohidratos: freezed == carbohidratos
          ? _value.carbohidratos
          : carbohidratos // ignore: cast_nullable_to_non_nullable
              as double?,
      lipidos: freezed == lipidos
          ? _value.lipidos
          : lipidos // ignore: cast_nullable_to_non_nullable
              as double?,
      toleraAlimentacion: null == toleraAlimentacion
          ? _value.toleraAlimentacion
          : toleraAlimentacion // ignore: cast_nullable_to_non_nullable
              as bool,
      efectosSecundarios: freezed == efectosSecundarios
          ? _value.efectosSecundarios
          : efectosSecundarios // ignore: cast_nullable_to_non_nullable
              as String?,
      fecha: null == fecha
          ? _value.fecha
          : fecha // ignore: cast_nullable_to_non_nullable
              as DateTime,
      hora: null == hora
          ? _value.hora
          : hora // ignore: cast_nullable_to_non_nullable
              as DateTime,
      observaciones: freezed == observaciones
          ? _value.observaciones
          : observaciones // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RegistroNutricionalImplCopyWith<$Res>
    implements $RegistroNutricionalCopyWith<$Res> {
  factory _$$RegistroNutricionalImplCopyWith(_$RegistroNutricionalImpl value,
          $Res Function(_$RegistroNutricionalImpl) then) =
      __$$RegistroNutricionalImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String idRegistroNutricional,
      double peso,
      double talla,
      double? pesoUsual,
      double imc,
      TipoAlimentacion tipoAlimentacion,
      String? formulaEnteral,
      double caloriasAdministradas,
      double caloriasRequeridas,
      double balanceNutricional,
      double? proteinas,
      double? carbohidratos,
      double? lipidos,
      bool toleraAlimentacion,
      String? efectosSecundarios,
      DateTime fecha,
      DateTime hora,
      String? observaciones});
}

/// @nodoc
class __$$RegistroNutricionalImplCopyWithImpl<$Res>
    extends _$RegistroNutricionalCopyWithImpl<$Res, _$RegistroNutricionalImpl>
    implements _$$RegistroNutricionalImplCopyWith<$Res> {
  __$$RegistroNutricionalImplCopyWithImpl(_$RegistroNutricionalImpl _value,
      $Res Function(_$RegistroNutricionalImpl) _then)
      : super(_value, _then);

  /// Create a copy of RegistroNutricional
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idRegistroNutricional = null,
    Object? peso = null,
    Object? talla = null,
    Object? pesoUsual = freezed,
    Object? imc = null,
    Object? tipoAlimentacion = null,
    Object? formulaEnteral = freezed,
    Object? caloriasAdministradas = null,
    Object? caloriasRequeridas = null,
    Object? balanceNutricional = null,
    Object? proteinas = freezed,
    Object? carbohidratos = freezed,
    Object? lipidos = freezed,
    Object? toleraAlimentacion = null,
    Object? efectosSecundarios = freezed,
    Object? fecha = null,
    Object? hora = null,
    Object? observaciones = freezed,
  }) {
    return _then(_$RegistroNutricionalImpl(
      idRegistroNutricional: null == idRegistroNutricional
          ? _value.idRegistroNutricional
          : idRegistroNutricional // ignore: cast_nullable_to_non_nullable
              as String,
      peso: null == peso
          ? _value.peso
          : peso // ignore: cast_nullable_to_non_nullable
              as double,
      talla: null == talla
          ? _value.talla
          : talla // ignore: cast_nullable_to_non_nullable
              as double,
      pesoUsual: freezed == pesoUsual
          ? _value.pesoUsual
          : pesoUsual // ignore: cast_nullable_to_non_nullable
              as double?,
      imc: null == imc
          ? _value.imc
          : imc // ignore: cast_nullable_to_non_nullable
              as double,
      tipoAlimentacion: null == tipoAlimentacion
          ? _value.tipoAlimentacion
          : tipoAlimentacion // ignore: cast_nullable_to_non_nullable
              as TipoAlimentacion,
      formulaEnteral: freezed == formulaEnteral
          ? _value.formulaEnteral
          : formulaEnteral // ignore: cast_nullable_to_non_nullable
              as String?,
      caloriasAdministradas: null == caloriasAdministradas
          ? _value.caloriasAdministradas
          : caloriasAdministradas // ignore: cast_nullable_to_non_nullable
              as double,
      caloriasRequeridas: null == caloriasRequeridas
          ? _value.caloriasRequeridas
          : caloriasRequeridas // ignore: cast_nullable_to_non_nullable
              as double,
      balanceNutricional: null == balanceNutricional
          ? _value.balanceNutricional
          : balanceNutricional // ignore: cast_nullable_to_non_nullable
              as double,
      proteinas: freezed == proteinas
          ? _value.proteinas
          : proteinas // ignore: cast_nullable_to_non_nullable
              as double?,
      carbohidratos: freezed == carbohidratos
          ? _value.carbohidratos
          : carbohidratos // ignore: cast_nullable_to_non_nullable
              as double?,
      lipidos: freezed == lipidos
          ? _value.lipidos
          : lipidos // ignore: cast_nullable_to_non_nullable
              as double?,
      toleraAlimentacion: null == toleraAlimentacion
          ? _value.toleraAlimentacion
          : toleraAlimentacion // ignore: cast_nullable_to_non_nullable
              as bool,
      efectosSecundarios: freezed == efectosSecundarios
          ? _value.efectosSecundarios
          : efectosSecundarios // ignore: cast_nullable_to_non_nullable
              as String?,
      fecha: null == fecha
          ? _value.fecha
          : fecha // ignore: cast_nullable_to_non_nullable
              as DateTime,
      hora: null == hora
          ? _value.hora
          : hora // ignore: cast_nullable_to_non_nullable
              as DateTime,
      observaciones: freezed == observaciones
          ? _value.observaciones
          : observaciones // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$RegistroNutricionalImpl implements _RegistroNutricional {
  const _$RegistroNutricionalImpl(
      {required this.idRegistroNutricional,
      required this.peso,
      required this.talla,
      this.pesoUsual,
      required this.imc,
      required this.tipoAlimentacion,
      this.formulaEnteral,
      required this.caloriasAdministradas,
      required this.caloriasRequeridas,
      required this.balanceNutricional,
      this.proteinas,
      this.carbohidratos,
      this.lipidos,
      required this.toleraAlimentacion,
      this.efectosSecundarios,
      required this.fecha,
      required this.hora,
      this.observaciones});

  @override
  final String idRegistroNutricional;
// ANTROPOMETRÍA
  @override
  final double peso;
// kg
  @override
  final double talla;
// cm
  @override
  final double? pesoUsual;
// kg (antes de enfermar)
  @override
  final double imc;
// calculado automáticamente
// TIPO DE ALIMENTACIÓN
  @override
  final TipoAlimentacion tipoAlimentacion;
  @override
  final String? formulaEnteral;
// Si es enteral, nombre de fórmula
// REGISTRO DIARIO
  @override
  final double caloriasAdministradas;
// kcal
  @override
  final double caloriasRequeridas;
// kcal (calculado)
  @override
  final double balanceNutricional;
// calculado
// MACRONUTRIENTES (opcional)
  @override
  final double? proteinas;
// gramos
  @override
  final double? carbohidratos;
// gramos
  @override
  final double? lipidos;
// gramos
// TOLERANCIA
  @override
  final bool toleraAlimentacion;
  @override
  final String? efectosSecundarios;
// náuseas, vómitos, diarrea, etc.
// METADATOS
  @override
  final DateTime fecha;
  @override
  final DateTime hora;
  @override
  final String? observaciones;

  @override
  String toString() {
    return 'RegistroNutricional(idRegistroNutricional: $idRegistroNutricional, peso: $peso, talla: $talla, pesoUsual: $pesoUsual, imc: $imc, tipoAlimentacion: $tipoAlimentacion, formulaEnteral: $formulaEnteral, caloriasAdministradas: $caloriasAdministradas, caloriasRequeridas: $caloriasRequeridas, balanceNutricional: $balanceNutricional, proteinas: $proteinas, carbohidratos: $carbohidratos, lipidos: $lipidos, toleraAlimentacion: $toleraAlimentacion, efectosSecundarios: $efectosSecundarios, fecha: $fecha, hora: $hora, observaciones: $observaciones)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegistroNutricionalImpl &&
            (identical(other.idRegistroNutricional, idRegistroNutricional) ||
                other.idRegistroNutricional == idRegistroNutricional) &&
            (identical(other.peso, peso) || other.peso == peso) &&
            (identical(other.talla, talla) || other.talla == talla) &&
            (identical(other.pesoUsual, pesoUsual) ||
                other.pesoUsual == pesoUsual) &&
            (identical(other.imc, imc) || other.imc == imc) &&
            (identical(other.tipoAlimentacion, tipoAlimentacion) ||
                other.tipoAlimentacion == tipoAlimentacion) &&
            (identical(other.formulaEnteral, formulaEnteral) ||
                other.formulaEnteral == formulaEnteral) &&
            (identical(other.caloriasAdministradas, caloriasAdministradas) ||
                other.caloriasAdministradas == caloriasAdministradas) &&
            (identical(other.caloriasRequeridas, caloriasRequeridas) ||
                other.caloriasRequeridas == caloriasRequeridas) &&
            (identical(other.balanceNutricional, balanceNutricional) ||
                other.balanceNutricional == balanceNutricional) &&
            (identical(other.proteinas, proteinas) ||
                other.proteinas == proteinas) &&
            (identical(other.carbohidratos, carbohidratos) ||
                other.carbohidratos == carbohidratos) &&
            (identical(other.lipidos, lipidos) || other.lipidos == lipidos) &&
            (identical(other.toleraAlimentacion, toleraAlimentacion) ||
                other.toleraAlimentacion == toleraAlimentacion) &&
            (identical(other.efectosSecundarios, efectosSecundarios) ||
                other.efectosSecundarios == efectosSecundarios) &&
            (identical(other.fecha, fecha) || other.fecha == fecha) &&
            (identical(other.hora, hora) || other.hora == hora) &&
            (identical(other.observaciones, observaciones) ||
                other.observaciones == observaciones));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      idRegistroNutricional,
      peso,
      talla,
      pesoUsual,
      imc,
      tipoAlimentacion,
      formulaEnteral,
      caloriasAdministradas,
      caloriasRequeridas,
      balanceNutricional,
      proteinas,
      carbohidratos,
      lipidos,
      toleraAlimentacion,
      efectosSecundarios,
      fecha,
      hora,
      observaciones);

  /// Create a copy of RegistroNutricional
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RegistroNutricionalImplCopyWith<_$RegistroNutricionalImpl> get copyWith =>
      __$$RegistroNutricionalImplCopyWithImpl<_$RegistroNutricionalImpl>(
          this, _$identity);
}

abstract class _RegistroNutricional implements RegistroNutricional {
  const factory _RegistroNutricional(
      {required final String idRegistroNutricional,
      required final double peso,
      required final double talla,
      final double? pesoUsual,
      required final double imc,
      required final TipoAlimentacion tipoAlimentacion,
      final String? formulaEnteral,
      required final double caloriasAdministradas,
      required final double caloriasRequeridas,
      required final double balanceNutricional,
      final double? proteinas,
      final double? carbohidratos,
      final double? lipidos,
      required final bool toleraAlimentacion,
      final String? efectosSecundarios,
      required final DateTime fecha,
      required final DateTime hora,
      final String? observaciones}) = _$RegistroNutricionalImpl;

  @override
  String get idRegistroNutricional; // ANTROPOMETRÍA
  @override
  double get peso; // kg
  @override
  double get talla; // cm
  @override
  double? get pesoUsual; // kg (antes de enfermar)
  @override
  double get imc; // calculado automáticamente
// TIPO DE ALIMENTACIÓN
  @override
  TipoAlimentacion get tipoAlimentacion;
  @override
  String? get formulaEnteral; // Si es enteral, nombre de fórmula
// REGISTRO DIARIO
  @override
  double get caloriasAdministradas; // kcal
  @override
  double get caloriasRequeridas; // kcal (calculado)
  @override
  double get balanceNutricional; // calculado
// MACRONUTRIENTES (opcional)
  @override
  double? get proteinas; // gramos
  @override
  double? get carbohidratos; // gramos
  @override
  double? get lipidos; // gramos
// TOLERANCIA
  @override
  bool get toleraAlimentacion;
  @override
  String? get efectosSecundarios; // náuseas, vómitos, diarrea, etc.
// METADATOS
  @override
  DateTime get fecha;
  @override
  DateTime get hora;
  @override
  String? get observaciones;

  /// Create a copy of RegistroNutricional
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RegistroNutricionalImplCopyWith<_$RegistroNutricionalImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
