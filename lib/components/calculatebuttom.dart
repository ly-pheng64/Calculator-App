import 'package:calculator_app/provider/calculation_provider.dart';
import 'package:calculator_app/theme/theme.dart';
import 'package:flutter/material.dart' hide BoxShadow, BoxDecoration;
import 'package:flutter/widgets.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart'
    as inset;
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum Shape {
  square,
  circle,
  stadium,
}

class Calculatebuttom extends ConsumerStatefulWidget {
  final String text;
  final Color textcolor;
  final double fontSize;
  final FontWeight fontWeight;
  final double width;
  final Shape shape;

  const Calculatebuttom(
    this.text, {
    this.textcolor = secondartColor,
    this.fontSize = 40,
    this.fontWeight = FontWeight.bold,
    this.width = 68,
    this.shape = Shape.square,
    super.key,
  });

  @override
  ConsumerState<Calculatebuttom> createState() => _CalculatebuttomState();
}

class _CalculatebuttomState extends ConsumerState<Calculatebuttom> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    final borderRadius = widget.shape == Shape.circle
        ? null
        : BorderRadius.circular(widget.shape == Shape.square ? 20 : 36);

    final boxShape =
        widget.shape == Shape.circle ? BoxShape.circle : BoxShape.rectangle;

    return Listener(
      onPointerDown: (_) => setState(() {
        isPressed = true;
      }),
      onPointerUp: (_) => setState(() {
        isPressed = false;
        final Provider = ref.read(calculationProvider.notifier);
        if (widget.shape == Shape.square) {
          Provider.addSign(widget.text);
        } else{
           Provider.addNumber(widget.text);
        }
      }),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        width: widget.width,
        height: 68,
        decoration: inset.BoxDecoration(
          borderRadius: borderRadius,
          shape: boxShape,
          color: primaryColor,
          boxShadow: [
            inset.BoxShadow(
              color: Color(0x80ffffff),
              offset: const Offset(-2, -2),
              blurRadius: 5,
              inset: isPressed,
            ),
            inset.BoxShadow(
              color: Color(0x80838e9e),
              offset: const Offset(2, 2),
              blurRadius: 5,
              inset: isPressed,
            ),
            inset.BoxShadow(
              color: isPressed ? Colors.transparent : Color(0xccffffff),
              offset: const Offset(2, 2),
              blurRadius: 5,
              inset: true,
            ),
            inset.BoxShadow(
              color: isPressed ? Colors.transparent : Color(0x66838e9e),
              offset: const Offset(-2, -2),
              blurRadius: 5,
              inset: true,
            ),
          ],
        ),
        child: Center(
          child: Text(
            widget.text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: widget.textcolor,
              fontSize: widget.fontSize,
              fontWeight: widget.fontWeight,
            ),
          ),
        ),
      ),
    );
  }
}
