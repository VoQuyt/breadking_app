import 'package:breadking_model/breadking_model.dart';
import 'package:breakingapp/components/brecard/horizontal_cart_item.dart';
import 'package:breakingapp/routers/navigation.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SeeAllListScreen extends StatelessWidget {
  SeeAllListScreen({Key? key, required this.foods, required this.toppings})
      : super(key: key);
  List<ModelFood> foods;
  List<ModelTopping> toppings;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 50),
            _buildBackButon(),
            const SizedBox(height: 20),
            _buildListItem(),
          ],
        ),
      ),
    );
  }

  _buildBackButon() {
    return Row(
      children: [
        GestureDetector(
            onTap: () => Navigation.back(),
            child: const Icon(Icons.arrow_back, size: 20)),
        const SizedBox(width: 20),
        const Hero(
          tag: 'morerestaurants',
          child: Material(
            child: Text('More restaurants',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
          ),
        ),
      ],
    );
  }

  _buildListItem() {
    return SizedBox(
      height: Navigation.size.height - 110,
      child: ListView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          itemCount: foods.length,
          itemBuilder: (context, index) {
            return _buildAnimationSlider(
              child: HorizontalCartItem(
                  modelFood: foods[index], toppings: toppings),
              index: index
            );
          }),
    );
  }

  _buildAnimationSlider({required Widget child, required int index}) {
    return TweenAnimationBuilder<double>(
      duration: Duration(milliseconds: (index + 1) * 200),
      tween: Tween(begin: -5.0, end: 1.0),
      child: child,
      builder: (context, value, child) {
        return Transform.translate(
          offset: Offset(value * 100 - 100, 0),
          child: child,
        );
      },
    );
  }
}
