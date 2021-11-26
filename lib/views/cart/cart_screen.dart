import 'package:breadking_model/breadking_model.dart';
import 'package:breakingapp/components/brecard/horizontal_cart_item.dart';
import 'package:breakingapp/components/bredecoration/decoration_box.dart';
import 'package:breakingapp/routers/navigation.dart';
import 'package:breakingapp/utils/brecolor.dart';
import 'package:breakingapp/utils/bredata.dart';
import 'package:breakingapp/views/home/home_screen.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key, required this.toppings}) : super(key: key);
  final List<ModelTopping> toppings;

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<ModelFood> foods = [];

  @override
  void initState() {
    _fetchListFood();
    super.initState();
  }

  _fetchListFood() {
    for (var data in cartFoods) {
      foods.add(ModelFood.fromMap(data));
    }
    foods.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 40, left: 20, right: 20),
          height: Navigation.size.height - 60,
          child: Column(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                        child: const Icon(Icons.arrow_back, size: 20),
                        onTap: () => Navigation.back()),
                    const Padding(
                      padding: EdgeInsets.only(left: 10.0, top: 10),
                      child: Text('My',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500)),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Text('Cart List',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w700)),
                    ),
                    const SizedBox(height: 20),
                    _buildListItemCart(),
                    const SizedBox(height: 20),
                    _buildDiscount(),
                    const SizedBox(height: 40),
                    _buildInfoPay('Subtotal', '\$38'),
                    const SizedBox(height: 10),
                    _buildInfoPay('Discount', '-\$2'),
                    const SizedBox(height: 10),
                    _buildInfoPay('Delivery', '\$3'),
                    const SizedBox(height: 10),
                    const Divider(),
                    const SizedBox(height: 10),
                    _buildInfoPay('Total', '\$39'),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: _buildCheckoutButton(),
              )
            ],
          ),
        ),
      ),
    );
  }

  _buildListItemCart() {
    return SizedBox(
      height: 220,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.zero,
        itemCount: 2,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: HorizontalCartItem(
              modelFood: foods[index],
              toppings: widget.toppings,
              key: const Key('cartlist'),
            ),
          );
        },
      ),
    );
  }

  _buildDiscount() {
    return BreDecorationBox(
      onPressed: () {},
      width: Navigation.size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.verified_rounded, color: BreColor.colorBrownLight),
          const SizedBox(width: 20),
          const Text('Do you have a discount code?',
              style: TextStyle(fontSize: 16, color: Colors.black))
        ],
      ),
    );
  }

  _buildCheckoutButton() {
    return BreDecorationBox(
      onPressed: () => Navigation.backUntilTo(const HomeScreen()),
      width: Navigation.size.width,
      color: BreColor.colorBlack,
      radius: 20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Checkout',
              style: TextStyle(fontSize: 16, color: Colors.white)),
          const SizedBox(width: 10),
          Icon(Icons.east_rounded, size: 25, color: BreColor.colorBrownDark),
        ],
      ),
    );
  }

  _buildInfoPay(String title, String price) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style: const TextStyle(
                fontSize: 16, color: Colors.grey, fontWeight: FontWeight.w500)),
        Text(price,
            style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.w500)),
      ],
    );
  }
}
