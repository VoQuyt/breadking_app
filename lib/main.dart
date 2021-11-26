import 'package:breakingapp/routers/navigation.dart';
import 'package:breakingapp/utils/brecolor.dart';
import 'package:breakingapp/views/home/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Breaking App',
      navigatorKey: Navigation.navigatorKey,
      scaffoldMessengerKey: Navigation.messengerKey,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        backgroundColor: BreColor.colorGreyLight,
        brightness: Brightness.light
      ),
      home: const HomeScreen(),
    );
  }
}
