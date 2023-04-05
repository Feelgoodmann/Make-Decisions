import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:make_decisions/resources/resources.dart';


import 'mapScreen.dart';

// int timeSpining = 100;
// int timeChanging = 100;

List<bool> _isChecked = [true, true, true, true
, true, true, true, true, true, true, true, true];
List<String> foodChecked = ["assets/images/food2.png"];

class RandomFoodScreen extends StatefulWidget{

  List<String> check = List<String>.filled(12, '');
  String buttonName = "สุ่มเลย";
  final int num = 1;
  final List<String> info;
  final List<String> foodImg;
  late int timeSpining;
  late int timeChanging;
  late bool randomYet;
  late int imgNum;

  RandomFoodScreen(
    {Key? key, required this.info, required this.foodImg, required this.timeSpining,
     required this.timeChanging, required this.randomYet, imgNum}) : super(key: key);
  
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
        padding: const EdgeInsets.only(top: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/sandwich1.png',
              width: 100,
              ),
            headerText("กินอะไรดี", notblack),
            Container(
              padding: const EdgeInsets.only(top: 25, bottom: 25),
              margin: const EdgeInsets.only(top: 20, bottom: 20),
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
                      decoration: const BoxDecoration(
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
                        autoPlay: !widget.randomYet,
                        autoPlayInterval: Duration(milliseconds: widget.timeSpining),
                        autoPlayAnimationDuration: Duration(milliseconds: widget.timeChanging),
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
            // Container(
            //   child: CarouselSlider.builder(
            //     itemCount: 12, 
            //     options: CarouselOptions(
            //       height: 120,
            //       autoPlay: !widget.randomYet,
            //       autoPlayInterval: Duration(milliseconds: widget.timeSpining),
            //       autoPlayAnimationDuration: Duration(milliseconds: widget.timeChanging),
            //     ),

            //     itemBuilder: (context, index, realIndex) {
            //       final imgName = widget.info[index];
                        
            //       return buildText(imgName, index++);
            //     }, 
            //   ),

            // ),
              Container(
                height: 200,
                margin: EdgeInsets.only(left: 10, right: 10),
              padding: EdgeInsets.only(left: 25),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(25)),
                color: lightgrey,
              ),
              child: SingleChildScrollView(
                child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: _buildCheckboxes(0)
              ),
              ), 
              ),

            Container(
              margin: const EdgeInsets.only(left: 110, right: 110, bottom: 20),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
              ),
              child: Center(
                child: RollButton(
                  onPressed: () {
                    if(!widget.randomYet){
                      if(widget.buttonName == "สุ่มเลย"){
                      setState(() {
                        // widget.randomYet = true;
                        randomNumber = Random().nextInt(11);
                        widget.timeSpining = 50;
                        widget.timeChanging = 100;

                      });
                      Timer(const Duration(milliseconds: 500), () {
                        showDialog(
                          context: context, 
                          builder: (BuildContext context) {
                            AssetImage assetImage = AssetImage(widget.foodImg[randomNumber]);
                            Image image = Image(image: assetImage, width: 100);
                            return AlertDialog(
                              content: SizedBox(
                                height: 200,
                                child: TextButton(
                                  onPressed: () {Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => MapScreen(info: widget.info[randomNumber]))
                                    );
                                  },
                                  child: Container(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                      image,
                                      normalText(widget.info[randomNumber], notblack),
                                    ],
                                    ),
                                  ),
                                ),
                              ),
                              // actions: [
                              //   Center(
                              //     child: TextButton(
                              //       onPressed: () {Navigator.push(
                              //         context,
                              //         MaterialPageRoute(builder: (context) => mapScreen())
                              //         );
                              //       },
                              //       child: Text(
                              //         '${widget.info[randomNumber]}',
                              //         style: TextStyle(
                              //           fontSize: 20,
                              //           color: Colors.black,
                              //           fontWeight: FontWeight.bold
                              //         ),
                              //       ),
                              //     ),
                              //   )
                              // ],
                            );
                          }
                          );
                       });

                    }}
                    else{
                      null;
                    }
                  },
                  name: widget.buttonName,
                )
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left: 15,bottom: 20),
                        child: const specialBackButton()
                      )
                    ],
                  ),
                ],
              )
            )
          ],
        ),
      ),
    );
  }
  // int _autoPlayInterval = 5000;
  // void _changeInterval(int newInterval) {
  //   setState(() {
  //     _autoPlayInterval = newInterval;
  //   });
  // }
  
  Widget buildImage(urlImage, int index) {
    AssetImage assetImage = AssetImage(urlImage);
    Image image = Image(image: assetImage, width: 75);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2),
      child: image,
    );
  }

  // Widget buildText(imgName, int index) {

  //   return Container(
  //     margin: const EdgeInsets.symmetric(horizontal: 2),
  //     child: Visibility(
  //               visible: widget.randomYet,
  //               maintainSize: true, 
  //               maintainAnimation: true,
  //               maintainState: true,
  //               child: Text(
  //                 imgName,
  //                 style: const TextStyle(
  //                   fontSize: 25,
  //                   fontFamily: "FCSound"
  //                 ),
  //               ),
  //             ),
  //   );
  // }

  List<Widget> _buildCheckboxes(int numRow) {
  List<Widget> checkboxes = [];
  for (var i = 0; i < 12; i++) {
    checkboxes.add(
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Checkbox(
            value: _isChecked[i + numRow],
            onChanged: (bool? value) {
              setState(() {
                int x = 0;
                int y = 0;
                _isChecked[i + numRow] = value!;
                foodChecked.add(widget.foodImg[i + numRow]);
                print(foodChecked);
                if(value) {
                  while(x < 12){
                    widget.check[x] = foodChecked[y];
                    if(y < foodChecked.length) y = 0; 
                    x++;
                  }
                }
                else{
                  if(value) {
                  widget.check[i + numRow] = " ";
                }
                }
              });
            },
          ),
          smallText(
            widget.info[i + numRow],
            notblack
            
          ),
        ],
      ),
    );
  }
  return checkboxes;
}

}
