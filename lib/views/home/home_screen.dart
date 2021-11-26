import 'package:breakingapp/components/brebutton/cate_button.dart';
import 'package:breakingapp/components/bresearch/widget_search.dart';
import 'package:breakingapp/views/home/widget/favourite_list.dart';
import 'package:breakingapp/views/home/widget/more_list.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: _buildWelcome(),
            ),
            const SizedBox(height: 20),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: WidgetSearch()),
            const SizedBox(height: 15),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: _buildCateButton(),
            ),
            const SizedBox(height: 15),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: const FavouriteList(),
            ),
            const SizedBox(height: 15),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: const MoreRestaurantList(),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  _buildWelcome() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text('Hello Quyt,',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
        Text('Welcome back!',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
      ],
    );
  }

  _buildCateButton() {
    return SizedBox(
      height: 45,
      child: ListView(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        children: [
          CateButton(
              child: const Icon(
                Icons.cake_rounded,
                color: Colors.white,
              ),
              title: 'Fast food'),
          const SizedBox(width: 5),
          CateButton(
              child: const Icon(Icons.cake_rounded, color: Colors.white),
              title: 'Health foot'),
          const SizedBox(width: 5),
          CateButton(
              child: const Icon(Icons.cake_rounded, color: Colors.white),
              title: 'Fruit',
              width: 100),
          const SizedBox(width: 5),
          CateButton(
              child: const Icon(Icons.cake_rounded, color: Colors.white),
              title: 'Cake',
              width: 100),
          const SizedBox(width: 5),
        ],
      ),
    );
  }
}
