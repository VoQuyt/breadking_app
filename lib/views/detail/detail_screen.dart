import 'package:breadking_model/breadking_model.dart';
import 'package:breakingapp/components/brebutton/circle_button.dart';
import 'package:breakingapp/components/brebutton/square_button.dart';
import 'package:breakingapp/components/bredecoration/decoration_box.dart';
import 'package:breakingapp/components/bredecoration/decoration_rating.dart';
import 'package:breakingapp/routers/navigation.dart';
import 'package:breakingapp/utils/brecolor.dart';
import 'package:breakingapp/views/cart/cart_screen.dart';
import 'package:breakingapp/views/detail/widget/topping_list.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen(
      {Key? key, required this.modelFood, required this.toppings})
      : super(key: key);
  final ModelFood modelFood;
  final List<ModelTopping> toppings;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildItemImage(),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
            alignment: Alignment.topCenter,
            child: _buildBackShareButton(),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: _buildDecorationInfo(),
          ),
        ],
      ),
    );
  }

  Widget _buildDecorationInfo() {
    return Container(
      height: Navigation.size.height / 2,
      width: Navigation.size.width,
      decoration: BoxDecoration(
          color: BreColor.colorGreyLight,
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(50))),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DecorationRating(rating: modelFood.rating),
                  _buildInDecrementButton(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, bottom: 10),
              child: Text(modelFood.name,
                  style:
                      const TextStyle(fontWeight: FontWeight.w700, fontSize: 18)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, bottom: 15),
              child: Text(modelFood.description,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: const TextStyle(fontSize: 13)),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 30, right: 30, bottom: 15),
              child: Text('Add toping',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, bottom: 15),
              child: ToppingList(toppings: toppings),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, bottom: 15),
              child: _buildButonAction(),
            ),
          ],
        ),
      ),
    );
  }

  _buildButonAction() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: BreDecorationBox(
            width: Navigation.size.width,
            color: BreColor.colorBrownLight,
            onPressed: () {},
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text('Total price'),
                  SizedBox(height: 10),
                  Text('\$32.00', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700))
                ],
              ),
            ),
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: BreDecorationBox(
            width: Navigation.size.width,
            color: BreColor.colorBlack,
            onPressed: () => Navigation.goto(CartScreen(toppings: toppings)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.shopping_cart, size: 30, color: BreColor.colorBrownDark),
                const SizedBox(width: 10),
                const Text('Go To Cart', style: TextStyle(fontSize: 16, color: Colors.white))
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildItemImage() {
    return SizedBox(
      height: Navigation.size.height / 3 * 2,
      width: Navigation.size.width,
      child: Hero(
          tag: key.toString() + modelFood.image,
          child: Image.asset(modelFood.image, fit: BoxFit.cover)),
    );
  }

  Widget _buildBackShareButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircleButton(
            child: const Icon(Icons.arrow_back, size: 20, color: Colors.white),
            onPressed: () => Navigation.back()),
        CircleButton(
          child: const Icon(Icons.share, size: 20, color: Colors.white),
          onPressed: () {},
        )
      ],
    );
  }

  Widget _buildInDecrementButton() {
    return Row(
      children: [
        SquareButton(
            child: const Icon(Icons.add, color: Colors.white),
            onPressed: () {}),
        const SizedBox(width: 10),
        const Text('2'),
        const SizedBox(width: 10),
        SquareButton(
            child: const Icon(Icons.remove, color: Colors.white),
            onPressed: () {})
      ],
    );
  }
}
