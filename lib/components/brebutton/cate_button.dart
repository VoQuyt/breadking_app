import 'package:breakingapp/utils/brecolor.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CateButton extends StatelessWidget {
  CateButton(
      {Key? key,
      required this.child,
      required this.title,
      this.titleStyle,
      this.height, this.width})
      : super(key: key);
  Widget child;
  String title;
  TextStyle? titleStyle;
  double? height;
  double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 45,
      width: width,
      decoration: BoxDecoration(
        color: BreColor.colorBrownDark,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            child,
            const SizedBox(width: 5),
            Text(title, style: titleStyle ?? const TextStyle(fontSize: 16, color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
