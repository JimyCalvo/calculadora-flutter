import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class ResultadoText extends StatelessWidget {
  final String text;

  const ResultadoText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: SelectionArea(
        child: AutoSizeText(
          text,
          
          style: const TextStyle(
            color: Colors.white,
            fontFamily: 'Open Sans',
            fontSize: 38,
        
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          presetFontSizes: [40, 20, 14],
        ),
      ),
    );
  }
}
