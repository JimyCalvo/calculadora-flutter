import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'dart:math' as math;

part 'calculadora_event.dart';
part 'calculadora_state.dart';

class CalculadoraBloc extends Bloc<CalculadoraEvent, CalculadoraState> {
  CalculadoraBloc() : super(CalculadoraState()) {
    on<CalculadoraEvent>(
      (event, emit) {
        if (event is ClearC)
          _clearEvent(event, emit);
        else if (event is AddNumero)
          _addNumeroEvent(state, event, emit);
        else if (event is AddDot)
          _addDotEvent(state, event, emit);
        else if (event is CambioSigno)
          _cambioSignoEvent(state, event, emit);
        else if (event is DeleteUltimo)
          _deleteUltimoEvent(state, event, emit);
        else if (event is OperationBasic)
          _operationBasicEvent(state, event, emit);
        else if (event is ResultadoCalculadora)
          _resultadoCalculadoraEvent(state, event, emit);
        else if (event is SineEvent)
          _sineEvent(state, event, emit);
        else if (event is CosineEvent)
          _cosineEvent(state, event, emit);
        else if (event is TangentEvent)
          _tangentEvent(state, event, emit);
        else if (event is Inverse)
          _inversoEvent(state, event, emit);
        else if (event is Logarithm)
          _logarithmEvent(state, event, emit);
        else if (event is NaturalLogarithm)
          _naturalLogarithmEvent(state, event, emit);
        else if (event is PowerEvent)
          _powerEvent(state, event, emit);
        else if (event is PowerEvent)
          _powerEvent(state, event, emit);
        else if (event is SquareRootEvent)
          _squareRootEvent(state, event, emit);
        else if (event is PiConstant)
          _piConstantEvent(state, event, emit);
        else if (event is EConstant)
          _eConstantEvent(state, event, emit);
        else if (event is AbsoluteValue)
          _absoluteValueEvent(state, event, emit);
        else if (event is PowerDividedByTwoEvent) {
          final double result = math.pow(event.base, 2) / 2;

          emit(state.copyWith(
            valor2: state.mathResultado,
            mathResultado: result.toString(),
          ));
        }
      },
    );
  }

  void _clearEvent(ClearC event, Emitter<CalculadoraState> emit) {
    emit(CalculadoraState(
      valor1: '0',
      mathResultado: '0',
      valor2: '',
      operacion: '',
    ));
  }
}

void _squareRootEvent(CalculadoraState state, CalculadoraEvent event,
    Emitter<CalculadoraState> emit) {
  final double value = double.parse(state.mathResultado);
  final double result = math.sqrt(value);

  emit(state.copyWith(
    operacion: '√' + state.mathResultado ,
    mathResultado: result.toString(),
    valor1: '',
  ));
}

void _powerEvent(CalculadoraState state, CalculadoraEvent event,
    Emitter<CalculadoraState> emit) {
  
}

void _addDotEvent(CalculadoraState state, CalculadoraEvent event,
    Emitter<CalculadoraState> emit) {
  final String currentValue = state.mathResultado;
  if (currentValue.contains('.')) {
    emit(state);
  } else {
    if (currentValue == '0') {
      emit(state.copyWith(
        mathResultado: '0.',
      ));
    } else {
      emit(state.copyWith(
        mathResultado: currentValue + '.',
      ));
    }
  }
}

void _absoluteValueEvent(CalculadoraState state, CalculadoraEvent event,
    Emitter<CalculadoraState> emit) {
  final double currentValue = double.parse(state.mathResultado);
  final double absoluteValue = currentValue.abs();
  emit(state.copyWith(
    operacion: '|' + state.mathResultado + '|',
    mathResultado: absoluteValue.toString(),
    valor1: '',
  ));
}

void _eConstantEvent(CalculadoraState state, CalculadoraEvent event,
    Emitter<CalculadoraState> emit) {
  emit(state.copyWith(
    operacion: 'e',
    mathResultado: math.e.toString(),
    valor1: '',
  ));
}

void _piConstantEvent(CalculadoraState state, CalculadoraEvent event,
    Emitter<CalculadoraState> emit) {
  emit(state.copyWith(
    operacion: 'π',
    mathResultado: math.pi.toString(),
    valor1: '',
  ));
}

void _naturalLogarithmEvent(CalculadoraState state, CalculadoraEvent event,
    Emitter<CalculadoraState> emit) {
  final double currentValue = double.parse(state.mathResultado);
  final double lnValue = math.log(currentValue);

  emit(state.copyWith(
      operacion: 'ln(' + state.mathResultado + ')',
      mathResultado: lnValue.toString(),
      valor1: ''));
}

void _logarithmEvent(CalculadoraState state, CalculadoraEvent event,
    Emitter<CalculadoraState> emit) {
  final num currentValue = double.parse(state.mathResultado);
  final double logValue = math.log(currentValue) / math.log(10);

  emit(state.copyWith(
      operacion: 'log(' + state.mathResultado + ')',
      mathResultado: logValue.toString(),
      valor1: ''));
}

void _inversoEvent(CalculadoraState state, CalculadoraEvent event,
    Emitter<CalculadoraState> emit) {
  final double currentValue = double.parse(state.mathResultado);
  final double inverseValue = 1 / currentValue;

  emit(state.copyWith(
      operacion: state.mathResultado + '⁻¹',
      mathResultado: inverseValue.toString(),
      valor1: ''));
}

void _tangentEvent(CalculadoraState state, TangentEvent event,
    Emitter<CalculadoraState> emit) {
  final double result = math.tan(double.parse(state.mathResultado));
  emit(state.copyWith(
      operacion: 'tan(' + state.mathResultado + ')',
      mathResultado: result.toString(),
      valor1: ''));
}

void _cosineEvent(
    CalculadoraState state, CosineEvent event, Emitter<CalculadoraState> emit) {
  final double result = math.cos(double.parse(state.mathResultado));
  emit(state.copyWith(
      operacion: 'cos(' + state.mathResultado + ')',
      mathResultado: result.toString(),
      valor1: ''));
}

void _sineEvent(
    CalculadoraState state, SineEvent event, Emitter<CalculadoraState> emit) {
  final double result = math.sin(double.parse(state.mathResultado));
  emit(state.copyWith(
      operacion: 'sin(' + state.mathResultado + ')',
      mathResultado: result.toString(),
      valor1: ''));
}

void _resultadoCalculadoraEvent(CalculadoraState state,
    ResultadoCalculadora event, Emitter<CalculadoraState> emit) {
  final double num1 = double.parse(state.valor1);
  final double num2 = double.parse(state.mathResultado);

  switch (state.operacion) {
    case '+':
      emit(state.copyWith(
          valor2: state.mathResultado, mathResultado: '${num1 + num2}'));
      break;
    case '-':
      emit(state.copyWith(
        valor2: state.mathResultado,
        mathResultado: '${num1 - num2}',
      ));
      break;
    case 'x':
      emit(state.copyWith(
          valor2: state.mathResultado, mathResultado: '${num1 * num2}'));
    case '÷':
      emit(state.copyWith(
          valor2: state.mathResultado, mathResultado: '${num1 / num2}'));
      break;

    default:
      emit(CalculadoraState(
        valor1: '0',
        mathResultado: '0',
        valor2: '',
        operacion: '',
      ));
  }
}

void _operationBasicEvent(CalculadoraState state, OperationBasic event,
    Emitter<CalculadoraState> emit) {
  emit(state.copyWith(
      valor1: state.mathResultado,
      mathResultado: '0',
      operacion: event.operation,
      valor2: '0'));
}

void _deleteUltimoEvent(CalculadoraState state, DeleteUltimo event,
    Emitter<CalculadoraState> emit) {
  if (state.mathResultado != '0') {
    if (state.mathResultado == '-0') {
      emit(state.copyWith(mathResultado: '0'));
    } else if (state.mathResultado.endsWith('.0')) {
      emit(state.copyWith(
          mathResultado: state.mathResultado
              .substring(0, state.mathResultado.length - 2)));
    } else {
      emit(state.copyWith(
          mathResultado: state.mathResultado.length > 1
              ? state.mathResultado.substring(0, state.mathResultado.length - 1)
              : '0'));
    }
  } else if (state.valor2 != '') {
    if (state.valor2.endsWith('.0')) {
      emit(state.copyWith(
          valor2: state.valor2.substring(0, state.valor2.length - 2)));
    } else {
      emit(state.copyWith(
          valor2: state.valor2.length > 1
              ? state.valor2.substring(0, state.valor2.length - 1)
              : ''));
    }
  } else if (state.operacion != '') {
    emit(state.copyWith(
        operacion: state.operacion.length > 1
            ? state.operacion.replaceAll(state.operacion, '')
            : ''));
  } else {
    if (state.valor1.endsWith('.0')) {
      emit(state.copyWith(
          valor1: state.valor1.substring(0, state.valor2.length - 2)));
    } else {
      emit(state.copyWith(
          valor1: state.valor1.length > 1
              ? state.valor1.substring(0, state.valor1.length - 1)
              : '0'));
    }
  }
}

void _cambioSignoEvent(
    CalculadoraState state, CambioSigno event, Emitter<CalculadoraState> emit) {
  emit(state.copyWith(
      mathResultado: state.mathResultado.contains('-')
          ? state.mathResultado.replaceFirst('-', '')
          : '-' + state.mathResultado));
}

void _addNumeroEvent(state, AddNumero event, Emitter<CalculadoraState> emit) {
  emit(state.copyWith(
    mathResultado: (state.mathResultado == '0')
        ? event.numero
        : state.mathResultado + event.numero,
  ));
}
