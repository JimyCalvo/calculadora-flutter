import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class InputElement extends StatelessWidget {
  final String text;
  const InputElement({Key? key, required this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AutoSizeText(
            this.text,
            maxLines: 1,
            textAlign: TextAlign.end,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 30,
            ),
          )
        ],
      
    );
  }
}
