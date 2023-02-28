import 'dart:math';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import '../resources/backButton.dart';
import '../resources/colors.dart';
import '../resources/randomButton.dart';
import '../resources/textAndButton.dart';
import 'package:vibration/vibration.dart';
import '/screens/setting.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class AutoRandom extends StatefulWidget{
  const AutoRandom({Key? key}) : super(key: key);
  
  @override
  AutoRandomState createState() => AutoRandomState();
}

class AutoRandomState extends State<AutoRandom> {
  int minNumber = 1;
  int maxNumber = 10;
  int randomNumber = 0;
  final bool isAnimating = false;

  final _formKey = GlobalKey<FormState>();
  TextEditingController minController = TextEditingController();
  TextEditingController maxController = TextEditingController();

  void handleRandom() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        minNumber = int.parse(minController.text);
        maxNumber = int.parse(maxController.text);
        randomNumber =
          Random().nextInt(maxNumber - minNumber + 1) +
          minNumber;
      });
    }
    AudioPlayer().play(AssetSource('audio/s2s.mp3'));
    Vibration.vibrate(duration: 200);
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
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 130),
                headerText("สุ่มอัตโนมัติ"),
                SizedBox(height: 20,),
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
                                labelText: 'สุ่มตัวเลขจาก',
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

                            SizedBox(height: 16),

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
                                labelText: 'จนถึง',
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
                            SizedBox(height: 6),
                            Center(child: normalText('ผลลัพธ์')),
                            SizedBox(height: 6),
                            Center(child: Container(
                              width: 120,
                              height: 60,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(Radius.circular(25)),
                                color: Colors.white
                              ),
                              child: Center(child:Text(((randomNumber == 0) ? "" : randomNumber.toString()),
                              style: TextStyle(
                                fontSize:40,color: Colors.blue, fontWeight: FontWeight.w800, fontFamily: "Mitr"))))),
                            SizedBox(height: 16),
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
                      )
                    ]
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [specialBackButton()],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}