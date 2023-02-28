import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../resources/backButton.dart';
import 'package:make_decisions/resources/foodInfo.dart';

int i = 0;

class RandomFoodScreen extends StatefulWidget{

  final int num = 1;
  final Map<dynamic, dynamic> info;
  final List<String> foodImg;

  const RandomFoodScreen({Key? key, required this.info, required this.foodImg}) : super(key: key);
  
  @override
  State<RandomFoodScreen> createState() => RandomFoodState();
}

class RandomFoodState extends State<RandomFoodScreen> {
  late String typeFood;
  late String imageUrl;
  
  @override
  void initState() {
    super.initState();
    
    typeFood = widget.info[widget.num]["typeFood"];
    imageUrl = widget.info[widget.num]["imageUrl"];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                specialBackButton()
              ],
            ),
            Container(
              padding: EdgeInsets.all(25),
              margin: EdgeInsets.only(top: 20, bottom: 20),
              decoration: BoxDecoration(
                color: Colors.black,
                
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
              )
            ),

            Container(
              margin: EdgeInsets.only(left: 110, right: 110, bottom: 20),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Colors.black
              ),
              child: Center(
                child: ElevatedButton(
                  onPressed: null,
                  child: Text(
                    "สุ่มเลย",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                )
              ),
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