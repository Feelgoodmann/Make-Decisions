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
  List<int> history = [];
  final bool isAnimating = false;
  Future<void> showHistoryDialog() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(child: buttonText('ประวัติการสุ่ม')),
          shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(25.0))),
          content: SizedBox(
            width: double.maxFinite,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: history.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  padding: EdgeInsets.only(left: 15),
                  child: normalText(
                  '${index + 1}) ${history.reversed.toList()[index]}',
                  )
                );
              },
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: smallText('Clear History', Color.fromARGB(255, 33, 112, 215)),
              onPressed: () {
                setState(() {
                  history.clear();
                });
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: smallText('Close', Color.fromARGB(255, 215, 33, 33)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

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
        if (history.length == 10) {
          history.removeAt(0);
        }
        history.add(randomNumber);
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
              children: [
                Column(
                  children: [
                    const SizedBox(height: 60,),
                    img.logoImage('assets/images/dice2.png'),
                    headerText("สุ่มตัวเลข"),
                    const SizedBox(height: 20,),
                  ],
                ),
                Column(
                  children: [
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
                                normalText('ผลลัพธ์')
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
                  ],
                ),
                IconButton(
                  color: history.isEmpty ? lightgrey : notblack,
                  onPressed: () {
                    history.isEmpty ? null : showHistoryDialog();
                  },
                  icon: Icon(Icons.history_rounded, size: 40)
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 15,bottom: 20),
                            child: specialBackButton()
                          )
                        ],
                      ),
                    ],
                  )
                )
              ],
            ),
        ),
      ),
    );
  }
}