import 'package:breakingapp/utils/brecolor.dart';
import 'package:flutter/material.dart';

class SquareButton extends StatelessWidget {
  const SquareButton({Key? key, required this.child, required this.onPressed, this.height, this.width})
      : super(key: key);
  final Widget child;
  final Function onPressed;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPressed(),
      child: Container(
        width: width ?? 30,
        height: height ?? 30,
        decoration: BoxDecoration(
            color: BreColor.colorBrownDark,
            borderRadius: const BorderRadius.all(Radius.circular(5))),
        child: child,
      ),
    );
  }
}
