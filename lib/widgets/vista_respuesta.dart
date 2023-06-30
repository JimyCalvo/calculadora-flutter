import 'package:auto_size_text/auto_size_text.dart';
import 'package:calculadora/widgets/input_elements.dart';
import 'package:calculadora/widgets/resultado.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc_component/calculadora/calculadora_bloc.dart';

class AnswerSection extends StatelessWidget {
  const AnswerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalculadoraBloc, CalculadoraState>(
      builder: (context, state) {
        return Expanded(
          flex: 2,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 5),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  flex: 6,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  radText(),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 9,
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Expanded(
                                    child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          InputElement(
                                            text: state.valor1.endsWith('.0') 
                                                  ?state.valor1.substring(0,state.valor1.length-2)
                                                  :state.valor1,
                                          ),
                                          InputElement(
                                            text: state.operacion,
                                          ),
                                          InputElement(
                                            text: state.valor2.endsWith('.0') 
                                                  ?state.valor2.substring(0,state.valor2.length-2)
                                                  :state.valor2,
                                          ),
                                        ]),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Divider(
                        height: 0,
                        thickness: 1,
                        color: Color(0xFF464545),
                      ),
                      Expanded(
                        flex: 2,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            ResultadoText(
                              text: state.mathResultado.endsWith('.0') 
                                    ?state.mathResultado.substring(0,state.mathResultado.length-2)
                                    :state.mathResultado,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                          child: SizedBox.expand(
                            child: Padding(
                              padding: EdgeInsets.all(1.1),
                              child: IconButton(
                                icon: const Icon(Icons.backspace_rounded),
                                onPressed: () =>
                                    BlocProvider.of<CalculadoraBloc>(context)
                                        .add(DeleteUltimo()),
                                iconSize: 30,
                                color: MaterialStateColor.resolveWith((states) {
                                  if (states.contains(MaterialState.hovered)) {
                                    return Colors.orange;
                                  }
                                  return Colors.white;
                                }),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

///-------------------------------------------------------------------------------
Widget radText() {
  return const AutoSizeText(
    '',
    maxLines: 1,
    style: TextStyle(
      color: Color.fromARGB(154, 218, 119, 6),
      fontSize: 20,
    ),
  );
}

///-------------------------------------------------------------------------------

// Widget inputText(String valor) {
//   return AutoSizeText(
//     valor,
//     maxLines: 1,
//     textAlign: TextAlign.end,
//     style: const TextStyle(
//       color: Colors.white,
//       fontSize: 35,
//     ),
//   );
// }

///-------------------------------------------------------------------------------

// Widget answerText() {
//   return const SelectionArea(
//     child: AutoSizeText(
//       '0.1256',
//       textAlign: TextAlign.end,
//       maxLines: 1,
//       style: TextStyle(
//         color: Colors.white,
//         fontFamily: 'Open Sans',
//         fontSize: 45,
//         overflow: TextOverflow.ellipsis,
//       ),
//     ),
//   );
// }

///-------------------------------------------------------------------------------

// Widget buttonDelete() {
//   return Expanded(
//     child: Padding(
//       padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
//       child: SizedBox.expand(
//         child: Padding(
//           padding: EdgeInsets.all(1.1),
//           child: IconButton(
//             icon: const Icon(Icons.backspace_rounded),
//             onPressed: () =>
//                 BlocProvider.of<CalculadoraBloc>(context).add(DeleteUltimo()),
//             iconSize: 30,
//             color: MaterialStateColor.resolveWith((states) {
//               if (states.contains(MaterialState.hovered)) {
//                 return Colors.orange;
//               }
//               return Colors.white;
//             }),
//           ),
//         ),
//       ),
//     ),
//   );
// }
