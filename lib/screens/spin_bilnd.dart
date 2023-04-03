import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../resources/resources.dart';

class SpinBilndWheel extends StatefulWidget {
  const SpinBilndWheel({Key? key}) : super(key: key);

  @override
  State<SpinBilndWheel> createState() => _SpinBilndWheelState();
}

class _SpinBilndWheelState extends State<SpinBilndWheel> {
  StreamController<int> selected = StreamController<int>();
  final List<String> choices = [
    "หมูน้อย",
    "ชิวเล้า",
    "kinn",
    "On-Son",
    "BKK",
    "ธนาต"
  ];
  bool isAnimating = false;
  bool? isCheck = false;

  void handleRoll() {
    selected.add(
      roll(choices.length),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                headerText("หมุนวงล้อ", notblack),
                Container(
                  height: 300.0,
                  width: 300.0,
                  padding: EdgeInsets.all(20.0),
                  child: Expanded(
                    child: FortuneWheel(
                      animateFirst: false,
                      onAnimationStart: () {
                        setState(() {
                          isAnimating = true;
                        });
                      },
                      onAnimationEnd: () {
                        setState(() {
                          isAnimating = false;
                        });
                      },
                      selected: selected.stream,
                      indicators: const <FortuneIndicator>[
                        FortuneIndicator(
                          alignment: Alignment
                              .topCenter, // <-- changing the position of the indicator
                          child: TriangleIndicator(
                            color: Color(
                                0xFFF0BA75), // <-- changing the color of the indicator
                          ),
                        ),
                      ],
                      items: List.generate(choices.length, (index) {
                        return FortuneItem(
                            child: Text(
                          choices[index],
                          style: TextStyle(fontSize: 25.0),
                          textAlign: TextAlign.center,
                        ));
                      }),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 30.0),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(25)),
                    color: lightgrey,
                  ),
                  child: Column(
                    children: [
                      ChiocesField(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Checkbox(
                              value: isCheck,
                              activeColor: notgreen,
                              onChanged: (value) {
                                setState(() {
                                  isCheck = value;
                                });
                              }),
                          smallText("สุ่มค่าไม่ซ้ำกัน", notblack),
                        ],
                      ),
                      RollButton(
                        onPressed: isAnimating ? null : handleRoll,
                        name: 'หมุนเลย',
                      ),
                    ],
                  ),
                ),
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

Widget ChiocesField() {
  return Column(
    children: <Widget>[
      normalText("เพิ่มตัวเลือกในการสุ่ม", notblack),
      const SizedBox(height: 10.0),
      Container(
        padding: const EdgeInsets.only(right: 10.0, left: 10.0),
        child: const TextField(
          maxLines: 4,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                borderSide: BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                ),
              ),
              hintText: 'ตัวเลือกจะแสดงตรงนี้ด้วย',
              fillColor: Colors.white,
              filled: true),
        ),
      ),
      const SizedBox(height: 10.0),
      Row(
        children: [
          Container(
            height: 50,
            width: 140,
            padding: const EdgeInsets.only(left: 10.0),
            child: const TextField(
              maxLines: 1,
              style: TextStyle(fontSize: 15.0),
              decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  hintText: 'ใส่ตัวเลือก',
                  fillColor: Colors.white,
                  filled: true),
            ),
          ),
          const SizedBox(width: 10.0),
          spinText(":", 30.0),
          Container(
            height: 50,
            width: 60,
            padding: const EdgeInsets.only(left: 10.0),
            child: const TextField(
              maxLines: 1,
              decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  fillColor: Colors.white,
                  filled: true),
            ),
          ),
          const SizedBox(width: 10.0),
          spinText("%", 25.0),
          AddButton(),
        ],
      ),
    ],
  );
}

class AddButton extends StatefulWidget {
  const AddButton({Key? key}) : super(key: key);

  @override
  State<AddButton> createState() => _AddButtonState();
}

class _AddButtonState extends State<AddButton> {
  int num = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
    decoration: const BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color(0xff50C878),
            Color(0xff3EC3A4),
          ]),
      shape: BoxShape.circle,
    ),
    child: ElevatedButton(
      child: const Icon(Icons.add),
      onPressed: () {
        num++;
        debugPrint("${num}");
      },
      style: ElevatedButton.styleFrom(
        primary: Colors.transparent,
        onSurface: Colors.transparent,
        shadowColor: Colors.transparent,
        disabledBackgroundColor: Colors.transparent,
      ),
    ),
  );
  }
}
/*
const TextField(
        maxLines: 1,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(40)),
            borderSide: BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
          hintText: 'ใส่ตัวเลือก',
          fillColor: Colors.white,
          filled: true),
        ),
*/