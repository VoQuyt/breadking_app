import 'package:breadking_model/breadking_model.dart';
import 'package:breakingapp/components/brecard/horizontal_cart_item.dart';
import 'package:breakingapp/routers/navigation.dart';
import 'package:breakingapp/utils/brecolor.dart';
import 'package:breakingapp/utils/bredata.dart';
import 'package:breakingapp/views/home/widget/see_all_list.dart';
import 'package:flutter/material.dart';

class MoreRestaurantList extends StatefulWidget {
  const MoreRestaurantList({Key? key}) : super(key: key);
  @override
  State<MoreRestaurantList> createState() => _MoreRestaurantListState();
}

class _MoreRestaurantListState extends State<MoreRestaurantList> {
  List<ModelFood> foods = [];
  List<ModelTopping> toppings = [];

  @override
  void initState() {
    _fetchListFood();
    super.initState();
  }

  _fetchListFood() {
    for (var data in dataFoods) {
      foods.add(ModelFood.fromMap(data));
    }
    for (var data in dataToppings) {
      toppings.add(ModelTopping.fromMap(data));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Hero(
              tag: 'morerestaurants',
              child: Material(
                child: Text('More restaurants',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
              ),
            ),
            GestureDetector(
              onTap: () => Navigation.goto(
                  SeeAllListScreen(foods: foods, toppings: toppings)),
              child: Text('See all',
                  style:
                      TextStyle(fontSize: 14, color: BreColor.colorBrownDark)),
            ),
          ],
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 220,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            padding: EdgeInsets.zero,
            itemCount: foods.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: HorizontalCartItem(
                  modelFood: foods[index],
                  toppings: toppings,
                  key: const Key('morelist'),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
