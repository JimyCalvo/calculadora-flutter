part of 'calculadora_bloc.dart';

class CalculadoraState {
  final String mathResultado;
  final String valor1;
  final String valor2;
  final String operacion;

  CalculadoraState({
    this.mathResultado = '0',
    this.valor1 = '0',
    this.valor2 = '',
    this.operacion = '',
  });
  CalculadoraState copyWith({
    String ? mathResultado,
    String ? valor1,
    String ? valor2,
    String ? operacion,
  })=>CalculadoraState(
    mathResultado: mathResultado ?? this.mathResultado,
    valor1: valor1 ?? this.valor1,
    valor2: valor2 ?? this.valor2,
    operacion: operacion ?? this.operacion,
  );


}





