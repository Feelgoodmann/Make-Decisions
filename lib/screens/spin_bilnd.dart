import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:make_decisions/resources/backButton.dart';
import '/resources/colors.dart';
import '../resources/textAndButton.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';

class SpinBilndWheel extends StatefulWidget {
  const SpinBilndWheel({Key? key}) : super(key: key);

  @override
  State<SpinBilndWheel> createState() => _SpinBilndWheelState();
}

class _SpinBilndWheelState extends State<SpinBilndWheel> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                  specialBackButton()
                  ],
                ),
                SpinningWheel(),
                Container(
                margin: const EdgeInsets.symmetric(horizontal: 30.0),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(25)),
                  color: lightgrey,
                ),
                child: Column(
                  children:  <Widget>[
                    normalText("เพิ่มตัวเลือกในการสุ่ม"),
                    const SizedBox(height: 10.0),
                    Container(
                      padding: const EdgeInsets.only(right: 10.0, left: 10.0),
                      child: const TextField(
                        maxLines: 4,
                        decoration: InputDecoration(  
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                          ),
                          hintText: 'ใส่ตัวเลือก', 
                          fillColor: Colors.white,
                          filled: true
                        ), 
                      ),
                    ),
                  ],
                ),
              ), 
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SpinningWheel extends StatefulWidget {
  const SpinningWheel({Key? key}) : super(key: key);

  @override
  State<SpinningWheel> createState() => _SpinningWheelState();
}

class _SpinningWheelState extends State<SpinningWheel> {
  StreamController<int> selected = StreamController<int>();
  final List<String> choices = ["หมูน้อย","ชิวเล้า","kinn","On-Son"];

  @override
  void dispose() {
    selected.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 340.0,
      width: 340.0,
      padding: EdgeInsets.all(20.0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            selected.add(
              Fortune.randomInt(0, choices.length),
            );
          });
        },
        child: Expanded(
          child: FortuneWheel(
          selected: selected.stream,
          indicators: const <FortuneIndicator>[
            FortuneIndicator(
              alignment: Alignment.topCenter, // <-- changing the position of the indicator
              child: TriangleIndicator(
                color: Colors.green, // <-- changing the color of the indicator
              ),
            ),
          ],
            items: List.generate(choices.length, (index) {
              return FortuneItem(child: Text(choices[index]));
            }),
          ),
        ),     
      ),  
    );
  }
}