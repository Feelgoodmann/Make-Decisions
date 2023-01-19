import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '/resources/colors.dart';
import '/resources/text_format.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({Key? key}) : super(key: key);


  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      
      body: Container(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 50, bottom: 40),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  Icons.settings,
                  color: notblack,
                  size: 32.0,
                  semanticLabel: 'Text to announce in accessibility modes',
                ),
              ],
            ),
            const SizedBox(height: 30),
            Center(
              child: Column(
                children: const [
                  Image (image: AssetImage('assets/images/logo1.png'), width: 100,)
                ],
              )
            ),
            headerText("MakeDecision"),
            const SizedBox(height: 20,),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(25)),
                color: lightgrey,
              ),
              child: Column(
                children:  [
                  normalText("โปรดเลือกรูปแบบการสุ่ม"),
                  const SizedBox(height: 20),
                  
                  mainMenuButton('สุ่มอัตโนมัติ', 'assets/images/dice1.png'),

                  const SizedBox(height: 20),
                  
                  mainMenuButton('หมุนวงล้อ', 'assets/images/wheel4.png'),

                  const SizedBox(height: 20),
                  
                  mainMenuButton('กินอะไรดี', 'assets/images/qdish1.png')

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}