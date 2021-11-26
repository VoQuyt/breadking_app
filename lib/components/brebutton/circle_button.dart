import 'package:breakingapp/utils/brecolor.dart';
import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  const CircleButton(
      {Key? key, required this.child, required this.onPressed, this.radius})
      : super(key: key);
  final Widget child;
  final Function onPressed;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPressed(),
      child: Container(
        width: radius ?? 30,
        height: radius ?? 30,
        decoration: BoxDecoration(
            color: BreColor.colorBrownDark,
            borderRadius: const BorderRadius.all(Radius.circular(20))),
        child: child,
      ),
    );
  }
}
