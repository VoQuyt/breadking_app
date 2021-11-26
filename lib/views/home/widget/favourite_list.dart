import 'package:breadking_model/breadking_model.dart';
import 'package:breakingapp/components/brecard/vertical_card_item.dart';
import 'package:breakingapp/routers/navigation.dart';
import 'package:breakingapp/utils/bredata.dart';
import 'package:flutter/material.dart';

class FavouriteList extends StatefulWidget {
  const FavouriteList({Key? key}) : super(key: key);
  @override
  State<FavouriteList> createState() => _FavouriteListState();
}

class _FavouriteListState extends State<FavouriteList> {
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
        const Text('Favourite',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
        const SizedBox(height: 10),
        SizedBox(
          height: Navigation.size.width / 3 * 2,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: foods.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: VerticalCardItem(
                  modelFood: foods[index],
                  toppings: toppings,
                  key: const Key('favourite'),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
