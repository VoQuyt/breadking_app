import 'package:breadking_model/breadking_model.dart';
import 'package:breakingapp/routers/navigation.dart';
import 'package:breakingapp/utils/brecolor.dart';
import 'package:breakingapp/views/detail/detail_screen.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class VerticalCardItem extends StatelessWidget {
  const VerticalCardItem({
    Key? key,
    required this.modelFood,
    required this.toppings,
  }) : super(key: key);
  final ModelFood modelFood;
  final List<ModelTopping> toppings;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigation.goto(
          DetailScreen(modelFood: modelFood, key: key, toppings: toppings)),
      child: Stack(
        children: [
          _buildItemImage(),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: Navigation.size.width / 2 - 30,
              height: Navigation.size.width / 3,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(25),
                ),
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    BreColor.colorBlack,
                    Colors.transparent,
                  ],
                ),
              ),
              child: Container(
                alignment: Alignment.bottomCenter,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                padding: const EdgeInsets.only(bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(modelFood.name,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500)),
                    const SizedBox(height: 5),
                    Text(modelFood.kind,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: const TextStyle(color: Colors.white)),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildRating(),
                        Text('\$' + modelFood.price.toString(),
                            style: const TextStyle(color: Colors.white))
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _buildItemImage() {
    return Hero(
      tag: key.toString() + modelFood.image,
      child: Container(
        width: Navigation.size.width / 2 - 30,
        height: Navigation.size.width / 3 * 2,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(modelFood.image), fit: BoxFit.cover),
          borderRadius: const BorderRadius.all(
            Radius.circular(25),
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
            size: 15,
          ),
          Icon(
            Icons.star_rounded,
            color: BreColor.colorOrangeBrown,
            size: 15,
          ),
          Icon(
            Icons.star_rounded,
            color: BreColor.colorOrangeBrown,
            size: 15,
          ),
          Icon(
            Icons.star_rounded,
            color: BreColor.colorOrangeBrown,
            size: 15,
          ),
          Icon(
            Icons.star_rounded,
            color: BreColor.colorOrangeBrown,
            size: 15,
          ),
        ],
      );
}
