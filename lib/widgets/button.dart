import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class ReusableButton extends StatefulWidget {
  final Color bgColor;
  final Color textColor;
  final Color hoverColor;
  final Color txtHoverColor;
  final String text;
  final Function onPressed;


  ReusableButton({
    Key? key,
    bgColor,
    textColor,
    hoverColor,

    txtHoverColor,
    required this.text,
    required this.onPressed,
  })  : this.textColor = textColor ?? Colors.white,
        this.bgColor = bgColor ?? Color.fromARGB(255, 41, 40, 40),
        this.hoverColor = hoverColor ?? Color.fromARGB(255, 233, 73, 10),
        this.txtHoverColor = txtHoverColor ?? Colors.white,

        super(key: key);

  @override
  State<StatefulWidget> createState() => _ReusableButtonState();
}

class _ReusableButtonState extends State<ReusableButton> {
  late Color bgColor;
  late Color textColor;
  late Color hoverColor;
  late String text;
  late Color txtHoverColor;
  late Function onPressed;


  @override
  void initState() {
    super.initState();
    bgColor = widget.bgColor;
    textColor = widget.textColor;
    hoverColor = widget.hoverColor;
    txtHoverColor = widget.txtHoverColor;
    text = widget.text;
    onPressed = widget.onPressed;

  }

  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    final buttonStyle = ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(bgColor),
      foregroundColor: MaterialStateProperty.all<Color>(textColor),
      overlayColor: MaterialStateProperty.all<Color>(hoverColor),

      side: MaterialStateProperty.all<BorderSide>(
        const BorderSide(
          color: Color.fromARGB(255, 93, 93, 93),
          width: 1,
        ),
      ),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    );

    return Expanded(
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 10),
        child: SizedBox(
          width: double.infinity,
          child:MouseRegion(
              onEnter: (event) {
                setState(() {
                  isHovered = true;
                });
              },
              onExit: (event) {
                setState(() {
                  isHovered = false;
                });
              },
              child: ElevatedButton(
            onPressed: () => this.onPressed(),

            style: buttonStyle,
      
            child: AutoSizeText(
                text,
                textAlign: TextAlign.center,
                maxLines: 1,
                style: TextStyle(
                  color: isHovered ? Colors.white :textColor,
                  fontSize: 24,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
