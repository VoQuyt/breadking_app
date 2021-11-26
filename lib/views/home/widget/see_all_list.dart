import 'package:breadking_model/breadking_model.dart';
import 'package:breakingapp/components/brecard/horizontal_cart_item.dart';
import 'package:breakingapp/routers/navigation.dart';
import 'package:flutter/material.dart';

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
            const SizedBox(height: 40),
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
          child: Text('More restaurants',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
        ),
      ],
    );
  }

  _buildListItem() {
    return SizedBox(
      height: Navigation.size.height - 80,
      child: ListView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          itemCount: foods.length,
          itemBuilder: (context, index) {
            return HorizontalCartItem(
                modelFood: foods[index], toppings: toppings);
          }),
    );
  }
}
