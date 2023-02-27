import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../resources/backButton.dart';

int i = 0;

class RandomFoodScreen extends StatefulWidget{

  final Map<dynamic, dynamic> info;

  const RandomFoodScreen({Key? key, required this.info}) : super(key: key);
  
  @override
  RandomFoodState createState() => RandomFoodState();
}

class RandomFoodState extends State<RandomFoodScreen> {
  late String type;
  late String imageUrl;
  

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
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.white,
                          width: 10
                        )
                      ),
                    ),
                  ),
                  CarouselSlider.builder(
                    itemCount: 12, 
                    options: CarouselOptions(height: 100),
                    itemBuilder: (context, index, realIndex) {
                      final urlImage = widget.info[i++].;

                      return buildImage(urlImage, index);
                    }, 
                  )
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
      margin: EdgeInsets.all(20),
      child: image,
    );
  }
}