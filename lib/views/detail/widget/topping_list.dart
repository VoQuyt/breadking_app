import 'package:breadking_model/breadking_model.dart';
import 'package:flutter/material.dart';

class ToppingList extends StatelessWidget {
  const ToppingList({Key? key, required this.toppings}) : super(key: key);
  final List<ModelTopping> toppings;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: toppings.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 20),
              child: _buildDecorationTopping(toppings[index].image),
            );
          }),
    );
  }

  Widget _buildDecorationTopping(String path) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(path), fit: BoxFit.cover),
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
      ),
    );
  }
}
