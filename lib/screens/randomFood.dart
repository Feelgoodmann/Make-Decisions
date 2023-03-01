import 'dart:math';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:make_decisions/resources/resources.dart';

import '../resources/backButton.dart';
import 'package:make_decisions/resources/foodInfo.dart';

import '../resources/colors.dart';

int i = 0;
bool randomYet = false;
class RandomFoodScreen extends StatefulWidget{

  final int num = 1;
  final List<String> info;
  final List<String> foodImg;

  const RandomFoodScreen({Key? key, required this.info, required this.foodImg}) : super(key: key);
  
  @override
  State<RandomFoodScreen> createState() => RandomFoodState();
}

class RandomFoodState extends State<RandomFoodScreen> {
  late String typeFood;
  late String imageUrl;
  late int randomNumber = 1;
  
  // @override
  // void initState() {
  //   super.initState();
    
  //   typeFood = widget.info[widget.num]["typeFood"];
  //   imageUrl = widget.info[widget.num]["imageUrl"];
  // }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            headerText("กินอะไรดี"),
            Container(
              padding: EdgeInsets.only(top: 25, bottom: 25),
              margin: EdgeInsets.only(top: 20, bottom: 20),
              decoration: BoxDecoration(
                color: lightgrey,
                
              ),
              child: Stack(
                children: [
                  Center(
                    child: 
                    Container(
                      height: 180,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(width: 10.0, color: Colors.white),
                          bottom: BorderSide(width: 10.0, color: Colors.white),
                        )
                      ),
                      child: Stack(
                        children: [
                           Center(
                    child: Container(
                      height: 125,
                      width: 125,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.white,
                          width: 10
                        )
                      ),
                    ),
                  ),
                  Center(
                    child: CarouselSlider.builder(
                      itemCount: 12, 
                      options: CarouselOptions(
                        height: 120,
                        autoPlay: true,
                        autoPlayAnimationDuration: Duration(seconds: 1),
                        viewportFraction: 0.35

                      ),

                      itemBuilder: (context, index, realIndex) {
                        final urlImage = widget.foodImg[index];

                        return buildImage(urlImage, index++);
                      }, 
                    ),
                  ),
                        ],
                      ),
                    ),
                  ),
 
                ],
              )
            ),
            Container(
              child: Visibility(
                visible: randomYet,
                maintainSize: true, 
                maintainAnimation: true,
                maintainState: true,
                child: Text(
                  widget.info[randomNumber],
                  style: TextStyle(
                    fontSize: 25,
                    fontFamily: "FCSound"
                  ),
                ),
              ),
            ),

            Container(
              margin: EdgeInsets.only(left: 110, right: 110, bottom: 20),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
              ),
              child: Center(
                child: RollButton(
                  onPressed: () {
                    setState(() {
                      randomYet = true;
                      randomNumber = Random().nextInt(11 - 0 + 1) + 0;
                      // print(randomNumber);
                    });
                  },
                  name: "สุ่มเลย",
                )
              ),
            ),
            Center(
              child: (
                specialBackButton()
              )
            ),
          ],
        ),
      ),
    );
  }
  
  Widget buildImage(urlImage, int index) {
    AssetImage assetImage = AssetImage(urlImage);
    Image image = Image(image: assetImage, width: 75);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2),
      child: image,
    );
  }
}