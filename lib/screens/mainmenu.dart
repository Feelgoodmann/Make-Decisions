import 'package:flutter/material.dart';
import '/resources/colors.dart';
import '../resources/textAndButton.dart';
import '/screens/setting.dart';
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
        padding: const EdgeInsets.only(left: 30, right: 30, top: 0, bottom: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(height: 40),
            Center(
              child: Column(
                children: const [
                  Image (image: AssetImage('assets/images/logo1.png'), width: 100,)
                ],
              )
            ),
            headerText("MakeDecision"),
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
                  
                  mainMenuButton('สุ่มตัวเลข', 'assets/images/dice2.png', context),

                  const SizedBox(height: 20),
                  
                  mainMenuButton('หมุนวงล้อ', 'assets/images/wheel5.png', context),

                  const SizedBox(height: 20),
                  
                  mainMenuButton('กินอะไรดี', 'assets/images/sandwich1.png', context),

                ],
              ),
            ),
          IconButton(
                padding: EdgeInsets.zero,
                icon: Icon(
                    Icons.settings,
                    color: notgrey,
                    size: 40.0,
                    semanticLabel: 'Text to announce in accessibility modes',
                ),
                  tooltip: 'Setting',
                  onPressed: () {
                    Navigator.push(
                      context,MaterialPageRoute(builder: (context) => const Setting())
                      );
                  }
            )
          ],
        ),
      ),
    );
  }
}