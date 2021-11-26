import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BreDecorationBox extends StatelessWidget {
  BreDecorationBox(
      {Key? key,
      required this.child,
      required this.onPressed,
      this.width = 80,
      this.height = 70,
      this.radius = 15,
      this.color = Colors.white})
      : super(key: key);

  final Widget child;
  final Function onPressed;
  double? width;
  double? height;
  double? radius;
  Color? color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPressed(),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.all(Radius.circular(radius!))),
        child: child,
      ),
    );
  }
}
