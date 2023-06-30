import 'package:flutter/material.dart';

import '../widgets/calc_basic.dart';
import '../widgets/calc_funcion.dart';
import '../widgets/vista_respuesta.dart';

class CalculadoraVista extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
      return Scaffold(
      backgroundColor: const Color(0xFF0E0E0E),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 233, 73, 10),
        title: const Text('Calculadora',style: TextStyle(color: Colors.white,fontSize: 30),
        ),
      ),
      body: SafeArea(
        top: true,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const Expanded(
              flex: 2,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [AnswerSection()],
              ),
            ),
            const Divider(
              thickness: 2,
              color: Color(0xB3EE8B60),
            ),
             Expanded(
              flex: 5,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  if (screenWidth >= 640)
                    const Expanded(
                      flex: 3,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                         children: [SectionOne()],
                      ),
                    ),
                  const Expanded(
                    flex: 4,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [SectionTwo()],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}