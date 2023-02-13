import 'package:flutter/material.dart';

import '../resources/backButton.dart';

class RandomFoodScreen extends StatefulWidget{

  const RandomFoodScreen({Key? key}) : super(key: key);
  
  @override
  RandomFoodState createState() => RandomFoodState();
}

class RandomFoodState extends State<RandomFoodScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 30),
        child: Column(
          children: [
            Row(
              children: [
                specialBackButton()
              ],
            ),
          ],
        ),
      ),
    );
  }

}