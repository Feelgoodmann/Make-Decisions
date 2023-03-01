import 'dart:math';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:make_decisions/resources/Images.dart';
import '../resources/backButton.dart';
import '../resources/colors.dart';
import '../resources/randomButton.dart';
import '../resources/textAndButton.dart';
import 'package:vibration/vibration.dart';
import '/resources/images.dart' as img;
class AutoRandom extends StatefulWidget{
  const AutoRandom({Key? key}) : super(key: key);
  
  @override
  AutoRandomState createState() => AutoRandomState();
}

class AutoRandomState extends State<AutoRandom> {
  int minNumber = 1;
  int maxNumber = 10;
  int randomNumber = 0;
  int isFirst = 0;
  final bool isAnimating = false;

  final _formKey = GlobalKey<FormState>();
  TextEditingController minController = TextEditingController(text: '1');
  TextEditingController maxController = TextEditingController(text: '10');

  void handleRandom() { 
    if (_formKey.currentState!.validate()) {
      AudioPlayer().play(AssetSource('audio/s2s.mp3'));
      Vibration.vibrate(duration: 500);
      setState(() {
        isFirst = 1;
        minNumber = int.parse(minController.text);
        maxNumber = int.parse(maxController.text);
        randomNumber =
          Random().nextInt(maxNumber - minNumber + 1) +
          minNumber;
      });
    }
   else {
      AudioPlayer().play(AssetSource('audio/s1.mp3'));
      Vibration.vibrate(duration: 500);
   }
  }
  @override
  void dispose() {
    minController.dispose();
    maxController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                img.logoImage('assets/images/dice2.png'),
                headerText("สุ่มตัวเลข"),
                const SizedBox(height: 20,),
                //Image.asset('assets/images/dice2.png', width: 100),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 30.0),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(25)),
                    color: lightgrey,
                  ),
                  child: Column(
                    children: [
                      Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            TextFormField(
                              controller: minController,
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'กรุณากรอกเลข';
                                }
                                  return null;
                                },
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.start_rounded, color: notgrey,),
                                labelText: 'จาก',
                                labelStyle: TextStyle(color: notblack, fontFamily: "Mitr"),
                                filled: true,
                                fillColor: Colors.white,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: notgrey,
                                    width: 2
                                  ),
                                ),
                              ),
                            ),

                            const SizedBox(height: 16),

                            TextFormField(
                              controller: maxController,
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'กรุณากรอกตัวเลข';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.stop_rounded, color: notgrey,),
                                labelText: 'ถึง',
                                labelStyle: TextStyle(color: notblack, fontFamily: "Mitr"),
                                filled: true,
                                fillColor: Colors.white,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: notgrey,
                                    width: 2
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 6),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                normalText('ผลลัพธ์'),
                                IconButton(onPressed: null, icon: Icon(Icons.history_rounded, size: 25, color: notblack,))
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(child: Container(
                              width: 120,
                              height: 60,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(25)),
                                color: Colors.white
                              ),
                              child: Center(child:Text(((isFirst == 0) ? "" : randomNumber.toString()),
                              style: const TextStyle(
                                fontSize:40,color: Colors.blue, fontWeight: FontWeight.w800, fontFamily: "Mitr",
                                ))))),
                              ],
                            ),
                            
                            const SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RandomButton(
                                  onPressed: isAnimating ? null : handleRandom,
                                ),
                              ]
                            ),
                        ]
                      )
                      ),
                    ]
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    specialBackButton(),
                    ],
                ),
              ],
            ),
        ),
      ),
    );
  }
}