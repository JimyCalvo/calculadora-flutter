import 'package:calculadora/bloc_component/calculadora/calculadora_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'button.dart';


class SectionTwo extends StatelessWidget {
  
  const SectionTwo({super.key});
  @override
  Widget build(BuildContext context) {
    final calculadoraBloc =BlocProvider.of<CalculadoraBloc>(context);
    return Expanded(
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ReusableButton(text: 'C',
                  onPressed: ()=>calculadoraBloc.add(ClearC()), 
                  textColor: Color.fromARGB(255, 226, 21, 6),
                  ),
                  ReusableButton(text: '7',onPressed: ()=>calculadoraBloc.add(AddNumero('7')),),
                  ReusableButton(text: '4',onPressed: ()=>calculadoraBloc.add(AddNumero('4')),),
                  ReusableButton(text: '1',onPressed: ()=>calculadoraBloc.add(AddNumero('1')),),
                  ReusableButton(text: '+/-',onPressed: ()=>calculadoraBloc.add(CambioSigno()),),

                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ReusableButton(text: '( )',onPressed: (){}, textColor: Color.fromARGB(255, 61, 61, 61), bgColor: const Color.fromARGB(221, 41, 40, 40), hoverColor: Color.fromARGB(115, 94, 36, 3)),
                  ReusableButton(text: '8',onPressed: ()=>calculadoraBloc.add(AddNumero('8')),),
                  ReusableButton(text: '5',onPressed: ()=>calculadoraBloc.add(AddNumero('5')),),
                  ReusableButton(text: '2',onPressed: ()=>calculadoraBloc.add(AddNumero('2')),),
                  ReusableButton(text: '0',onPressed: ()=>calculadoraBloc.add(AddNumero('0')),),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ReusableButton(text: '%',onPressed: ()=>calculadoraBloc.add(AddNumero('')),textColor:Color.fromARGB(255, 188, 75, 26)),
                  ReusableButton(text: '9',onPressed: ()=>calculadoraBloc.add(AddNumero('9')),),
                  ReusableButton(text: '6',onPressed: ()=>calculadoraBloc.add(AddNumero('6')),),
                  ReusableButton(text: '3',onPressed: ()=>calculadoraBloc.add(AddNumero('3')),),
                  ReusableButton(text: '.',onPressed: ()=>calculadoraBloc.add(AddDot()),),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ReusableButton(text: '÷',onPressed: ()=>calculadoraBloc.add(OperationBasic('÷')),textColor:Color.fromARGB(255, 188, 75, 26)),
                  ReusableButton(text: 'x',onPressed: ()=>calculadoraBloc.add(OperationBasic('x')),textColor:Color.fromARGB(255, 188, 75, 26)),
                  ReusableButton(text: '-',onPressed: ()=>calculadoraBloc.add(OperationBasic('-')),textColor:Color.fromARGB(255, 188, 75, 26)),
                  ReusableButton(text: '+',onPressed: ()=>calculadoraBloc.add(OperationBasic('+')),textColor:Color.fromARGB(255, 188, 75, 26)),
                  ReusableButton(text: '=',onPressed: ()=>calculadoraBloc.add(ResultadoCalculadora()),bgColor:Color.fromARGB(255, 172, 55, 5) ,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
