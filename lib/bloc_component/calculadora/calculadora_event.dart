

part of 'calculadora_bloc.dart';

@immutable
abstract class CalculadoraEvent {
  
}

class AddNumero extends CalculadoraEvent{
  final String numero;
  AddNumero(this.numero);
}




class AddDot extends CalculadoraEvent{}
class ClearC extends CalculadoraEvent{}

class CambioSigno extends CalculadoraEvent{}

class DeleteUltimo extends CalculadoraEvent{}

class OperationBasic extends CalculadoraEvent{
  final String operation;
  OperationBasic(this.operation);
}

class ResultadoCalculadora extends CalculadoraEvent{}



class PowerEvent extends CalculadoraEvent {
}

class SquareRootEvent extends CalculadoraEvent {

}

class SineEvent extends CalculadoraEvent {}

class CosineEvent extends CalculadoraEvent {}

class PowerDividedByTwoEvent extends CalculadoraEvent {
  final double base;

  PowerDividedByTwoEvent(this.base);
}

class TangentEvent extends CalculadoraEvent {}

class Inverse extends CalculadoraEvent {}

class Logarithm extends CalculadoraEvent {}

class NaturalLogarithm extends CalculadoraEvent {}

class PowerButtonPressed extends CalculadoraEvent {}

class DecimalButtonPressed extends CalculadoraEvent {
  final String currentValue;

  DecimalButtonPressed({required this.currentValue});
}

class AbsoluteValue extends CalculadoraEvent {}
class EConstant extends CalculadoraEvent {}
class PiConstant extends CalculadoraEvent {}