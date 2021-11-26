import 'package:breakingapp/utils/brecolor.dart';
import 'package:flutter/material.dart';

class DecorationRating extends StatelessWidget {
  const DecorationRating({Key? key, required this.rating}) : super(key: key);
  final double rating;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 100,
      decoration: BoxDecoration(
        color: BreColor.colorBlack,
        borderRadius: const BorderRadius.all(Radius.circular(30))
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.star_rounded, size: 30, color: BreColor.colorOrangeBrown),
          const SizedBox(width: 5),
          Text(rating.toString(), style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500))
        ],
      ),
    );
  }
}