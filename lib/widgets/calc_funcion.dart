import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc_component/calculadora/calculadora_bloc.dart';
import 'button.dart';

class SectionOne extends StatelessWidget {
  const SectionOne({super.key});
  @override
  Widget build(BuildContext context) {
    final calculadoraBloc =BlocProvider.of<CalculadoraBloc>(context);
    return Expanded(
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(20, 20, 0, 20),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ReusableButton(text: '↹', onPressed: () { }, textColor: Color.fromARGB(255, 61, 61, 61), bgColor: const Color.fromARGB(221, 41, 40, 40), hoverColor: Color.fromARGB(115, 94, 36, 3)),
                  ReusableButton(text: 'sin', onPressed: ()=>calculadoraBloc.add(SineEvent(),),),
                  ReusableButton(text: 'ln', onPressed: ()=>calculadoraBloc.add(NaturalLogarithm(),)),
                  ReusableButton(text: 'eᵡ', onPressed: () { print('e^'); },),
                  ReusableButton(text: '|x|', onPressed: () { print('abs'); },),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ReusableButton(text: 'Rad', onPressed: () { print('rad'); }, textColor: Color.fromARGB(255, 61, 61, 61), bgColor: const Color.fromARGB(221, 41, 40, 40), hoverColor: Color.fromARGB(115, 94, 36, 3)),
                  ReusableButton(text: 'cos', onPressed: ()=>calculadoraBloc.add(CosineEvent(),),),
                  ReusableButton(text: 'log', onPressed: ()=>calculadoraBloc.add(Logarithm(),),),
                  ReusableButton(text: 'x²', onPressed:()=>calculadoraBloc.add(PowerEvent()),),
                  ReusableButton(text: 'π', onPressed: ()=>calculadoraBloc.add((PiConstant())),),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              
                children: [
                  ReusableButton(text: '√', onPressed: ()=>calculadoraBloc.add(SquareRootEvent()),),
                  ReusableButton(text: 'tan', onPressed: ()=>calculadoraBloc.add(TangentEvent()),),
                  ReusableButton(text: 'x⁻¹', onPressed:()=>calculadoraBloc.add(Inverse()),),
                  ReusableButton(text: 'xᵞ', onPressed:()=>calculadoraBloc.add(PowerEvent()),),
                  ReusableButton(text: 'e', onPressed:()=>calculadoraBloc.add(EConstant()),),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

