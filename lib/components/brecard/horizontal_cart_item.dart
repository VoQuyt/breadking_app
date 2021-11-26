import 'package:breadking_model/breadking_model.dart';
import 'package:breakingapp/routers/navigation.dart';
import 'package:breakingapp/utils/brecolor.dart';
import 'package:breakingapp/views/detail/detail_screen.dart';
import 'package:flutter/material.dart';

class HorizontalCartItem extends StatelessWidget {
  const HorizontalCartItem({Key? key, required this.modelFood, required this.toppings})
      : super(key: key);
  final ModelFood modelFood;
  final List<ModelTopping> toppings;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigation.goto(DetailScreen(modelFood: modelFood, key: key, toppings: toppings)),
      child: Container(
        height: 100,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(25)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  _buildimageItem(),
                  const SizedBox(width: 10),
                  _buildInfoItem(),
                ],
              ),
              const SizedBox(width: 10),
              Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: _buildPriceItem())
            ],
          ),
        ),
      ),
    );
  }

  _buildInfoItem() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(modelFood.name,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
        _buildRating(),
        Text(modelFood.kind,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: const TextStyle(fontSize: 14)),
      ],
    );
  }

  _buildPriceItem() {
    return Text('\$' + modelFood.price.toString(),
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700));
  }

  _buildimageItem() {
    return Hero(
      tag: key.toString() + modelFood.image,
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(modelFood.image), fit: BoxFit.cover),
          borderRadius: const BorderRadius.all(
            Radius.circular(15),
          ),
        ),
      ),
    );
  }

  _buildRating() => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.star_rounded,
            color: BreColor.colorOrangeBrown,
            size: 20,
          ),
          Icon(
            Icons.star_rounded,
            color: BreColor.colorOrangeBrown,
            size: 20,
          ),
          Icon(
            Icons.star_rounded,
            color: BreColor.colorOrangeBrown,
            size: 20,
          ),
          Icon(
            Icons.star_rounded,
            color: BreColor.colorOrangeBrown,
            size: 20,
          ),
          Icon(
            Icons.star_rounded,
            color: BreColor.colorOrangeBrown,
            size: 20,
          ),
        ],
      );
}
