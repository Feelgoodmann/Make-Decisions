import 'package:flutter/material.dart';
import 'package:make_decisions/resources/foodInfo.dart';
import 'package:make_decisions/screens/auto_random.dart';
import 'package:make_decisions/screens/mainmenu.dart';
import 'package:make_decisions/screens/mapScreen.dart';
import 'package:make_decisions/screens/setting.dart';
import 'package:make_decisions/screens/spin_bilnd.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //initialRoute: '/',
      //routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
      //  '/': (context) =>  MainMenu(),
        // When navigating to the "/second" route, build the SecondScreen widget.
      //  '/setting': (context) =>  Setting(),
      //  },
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainMenu(),
      routes: {
        '/home':(context) => MainMenu(),
        '/setting':(context) => Setting(),
        '/randomNum':(context) => AutoRandom(),
        '/randomSpin':(context) => SpinBilndWheel(),
        '/randomFood':(context) => FoodResInfo(),
      },
    );
  }
}