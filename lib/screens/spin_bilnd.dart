import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import '../resources/resources.dart';

class SpinBilndWheel extends StatefulWidget {
  const SpinBilndWheel({Key? key}) : super(key: key);

  @override
  State<SpinBilndWheel> createState() => _SpinBilndWheelState();
}

class _SpinBilndWheelState extends State<SpinBilndWheel> {
  StreamController<int> selected = StreamController<int>();
  final choiceField = TextEditingController();
  int selectedValue = 0;
  List<String> choices = [
    "หมูน้อย",
    "ชิวเล้า",
  ];
  bool _keyboardVisible = false;

  bool isAnimating = false;
  bool? isCheck = false;
  final List<Color> colors = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.purple,
    Colors.pink,
    Colors.brown,
    Colors.blueGrey,
  ];

  void handleRoll() async {
    final index = roll(choices.length);
    selected.add(index);
    setState(() {
      selectedValue = index;
    });
  }

  @override
  void dispose() {
    selected.close();
    super.dispose();
  }

  void addChoice(String value) {
    setState(() {
      choices.add(value);
    });
  }

  void removeChoice(String value) {
    setState(() {
      choices.remove(value);
    });
  }

  void showSelectedItem() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(25.0))),
          content: Container(
            width: 100.0,
            height: 80.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                buttonText('${choices[selectedValue]}', notblack),
              ],
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: (choices.length > 2)
                  ? () {
                      setState(() {
                        choices.removeAt(selectedValue);
                        // reset the selected value to the first item
                        selectedValue = 0;
                      });
                      FocusManager.instance.primaryFocus?.unfocus();
                      Navigator.of(context).pop();
                    }
                  : null,
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xffC85050),
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  ),
              child: normalText('ลบ', Colors.white),
            ),
            ElevatedButton(
              onPressed: () {
                FocusManager.instance.primaryFocus?.unfocus();
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff0573CE),
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),),
              child: normalText('ตกลง', Colors.white),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    _keyboardVisible = MediaQuery.of(context).viewInsets.bottom != 0;
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      headerText("หมุนวงล้อ", notblack),
                      Container(
                        height: 300.0,
                        width: 300.0,
                        padding: const EdgeInsets.all(20.0),
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
                              showSelectedItem();
                            },
                            selected: selected.stream,
                            indicators: const <FortuneIndicator>[
                              FortuneIndicator(
                                alignment: Alignment
                                    .topCenter, // <-- changing the position of the indicator
                                child: TriangleIndicator(
                                  color: Color.fromARGB(255, 17, 144,
                                      255), // <-- changing the color of the indicator
                                ),
                              ),
                            ],
                            items: List.generate(choices.length, (index) {
                              return FortuneItem(
                                  child: wheelText(
                                      choices[index], Colors.white, notblack),
                                  style: FortuneItemStyle(
                                    borderColor: Colors.white,
                                    color: colors[index % colors.length],
                                  ));
                            }),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 30.0),
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(25)),
                          color: lightgrey,
                        ),
                        child: Column(
                          children: [
                            Column(
                              children: [
                                normalText("ตัวเลือกในการสุ่ม", notblack),
                                const SizedBox(height: 5),
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  padding: const EdgeInsets.all(10),
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(25),
                                        topRight: Radius.circular(25),
                                        bottomRight: Radius.circular(25)),
                                    color: Colors.white,
                                  ),
                                  constraints: BoxConstraints(
                                    minHeight: 170,
                                    maxHeight: 170,
                                    minWidth: 500,
                                  ),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Wrap(
                                          spacing: 5,
                                          runSpacing: -7,
                                          children: choices.map((value) {
                                            return GestureDetector(
                                              onTap: () => (choices.length > 2)
                                                  ? removeChoice(value)
                                                  : null,
                                              child: Chip(
                                                label: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    normalText(
                                                      value, notblack
                                                    ),
                                                    const SizedBox(width: 3),
                                                    const CircleAvatar(
                                                      backgroundColor:
                                                          Color(0xffC85050),
                                                      radius: 9,
                                                      child: Icon(
                                                        Icons.close,
                                                        color: Colors.white,
                                                        size: 11,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                deleteIcon:
                                                    const Icon(Icons.clear),
                                              ),
                                            );
                                          }).toList(),
                                        ),
                                        const SizedBox(
                                            height: 85), // Add spacing
                                        Container(
                                          alignment: Alignment
                                              .bottomRight, // Align to the bottom right
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              const Text(
                                                'Limit:',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              const SizedBox(width: 4),
                                              const Text(
                                                '12',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 40,
                                      width: 140,
                                      padding:
                                          const EdgeInsets.only(left: 10.0),
                                      child: TextField(
                                        controller: choiceField,
                                        maxLines: 1,
                                        style: const TextStyle(fontSize: 15.0),
                                        decoration: const InputDecoration(
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    vertical: 10,
                                                    horizontal: 10),
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(15),
                                                  bottomRight:
                                                      Radius.circular(10),
                                                  topRight:
                                                      Radius.circular(10)),
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
                                    const SizedBox(width: 5.0),
                                    spinText(":", 30.0),
                                    Container(
                                      height: 40,
                                      width: 49,
                                      padding:
                                          const EdgeInsets.only(left: 5.0),
                                      child: const TextField(
                                        maxLines: 1,
                                        decoration: InputDecoration(
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    vertical: 5, horizontal: 5),
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)),
                                              borderSide: BorderSide(
                                                width: 0,
                                                style: BorderStyle.none,
                                              ),
                                            ),
                                            fillColor: Colors.white,
                                            filled: true),
                                      ),
                                    ),
                                    const SizedBox(width: 5.0),
                                    spinText("%", 22.0),
                                    ElevatedButton(
                                      onPressed: () {
                                        if (choiceField.text.isEmpty) {
                                          debugPrint("TextField empty");
                                        } else if (choices.length == 12 ||
                                            isAnimating == true) {
                                          null;
                                        } else {
                                          addChoice(choiceField.text);
                                          choiceField.clear();
                                        }
                                      },
                                      style: ElevatedButton.styleFrom(
                                        shape: CircleBorder(),
                                        primary: Colors.transparent,
                                        onSurface: Colors.transparent,
                                        shadowColor: Colors.transparent,
                                        disabledBackgroundColor:
                                            Colors.transparent,
                                      ),
                                      child: CircleAvatar(
                                        backgroundColor: (choices.length < 12)
                                            ? notgreen
                                            : notgrey,
                                        radius: 17,
                                        child: Icon(
                                          Icons.add,
                                          color: Colors.white,
                                          size: 23,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            RollButton(
                              onPressed: isAnimating ? null : handleRoll,
                              name: 'หมุนเลย',
                            ),
                          ],
                        ),
                      ),
                      
                    ],
                  ),
                ),
              ),
              Container(
                        margin: const EdgeInsets.only(bottom: 20.0, left: 20.0),
                        child:  Align(
                          alignment: Alignment.bottomLeft,
                          child: Visibility(visible: !_keyboardVisible, child: specialBackButton())
                        ),
                      ),
            ],
          ),
        ),
      ),
    );
  }
}
