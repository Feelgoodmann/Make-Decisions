import 'dart:async';

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
          content: Container(
            width: 100.0,
            height: 100.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                normalText('${choices[selectedValue]}', notblack),
              ],
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
            ElevatedButton(
              onPressed: (choices.length > 2)
                  ? () {
                      setState(() {
                        choices.removeAt(selectedValue);
                        // reset the selected value to the first item
                        selectedValue = 0;
                      });
                      Navigator.of(context).pop();
                    }
                  : null,
              child: const Text('Remove'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
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
                      const SizedBox(height: 40),
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
                                  color: Color(
                                      0xFFF0BA75), // <-- changing the color of the indicator
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
                                normalText("เพิ่มตัวเลือกในการสุ่ม", notblack),
                                const SizedBox(height: 5),
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  padding: const EdgeInsets.all(10),
                                  decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(25)),
                                    color: Colors.white,
                                  ),
                                  constraints: BoxConstraints(
                                    minHeight: 170,
                                    maxHeight: 170,
                                    minWidth: 500,
                                  ),
                                  child: SingleChildScrollView(
                                    child: Wrap(
                                      spacing: 8,
                                      runSpacing: 8,
                                      children: choices.map((value) {
                                        return GestureDetector(
                                          onTap: () => (choices.length > 2)
                                              ? removeChoice(value)
                                              : null,
                                          child: Chip(
                                            label: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text(
                                                  value,
                                                  style:
                                                    const TextStyle(fontSize: 16),
                                                ),
                                                const SizedBox(width: 3),
                                                const CircleAvatar(
                                                  backgroundColor: Color(0xffC85050),
                                                  radius: 9,
                                                  child: Icon(
                                                    Icons.close,
                                                    color: Colors.white,
                                                    size: 11,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            deleteIcon: const Icon(Icons.clear),
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Row(
                                  children: [
                                    Padding(padding: EdgeInsets.only(right: 235)),
                                    Text('Limit: 12',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold
                                      ),
                                    )
                                  ],
                                ),
                                Row(
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
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(15)),
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
                                      height: 40,
                                      width: 60,
                                      padding:
                                          const EdgeInsets.only(left: 10.0),
                                      child: const TextField(
                                        maxLines: 1,
                                        decoration: InputDecoration(
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    vertical: 10,
                                                    horizontal: 10),
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(15)),
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
                                    Container(
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                            begin: Alignment.topRight,
                                            end: Alignment.bottomLeft,
                                            colors: [
                                              Color((choices.length < 12)
                                                  ? 0xff50C878
                                                  : 0xff6f6f6f),
                                              Color((choices.length < 12)
                                                  ? 0xff3EC3A4
                                                  : 0xff6f6f6f),
                                            ]),
                                        shape: BoxShape.circle,
                                      ),
                                      child: ElevatedButton(
                                        child: const Icon(
                                          Icons.add,
                                          size: 30,
                                        ),
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
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 5),
                            /*
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
                            */
                            //const SizedBox(height: 10.0),
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
                child: const Align(
                  alignment: Alignment.bottomLeft,
                  child: specialBackButton(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
