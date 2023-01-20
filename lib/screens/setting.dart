// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import '/resources/colors.dart';
import '../resources/textAndButton.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);


  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      
      body: Center(
        child: Container(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 60, bottom: 40),
        child: Column(
          children: [
            const SizedBox(height: 200),

            headerText("Setting"),
            const SizedBox(height: 30,),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(25)),
                color: lightgrey,
              ),
              child: Column(
                children:  [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      normalText("เสียง"),
                      SwitchSetting()
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      normalText("การสั่น"),
                      SwitchSetting()
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30,),
            IconButton(
                padding: EdgeInsets.zero,
                icon: Icon(
                    Icons.arrow_back_ios_rounded,
                    color: notgrey,
                    size: 40.0,
                    semanticLabel: 'Text to announce in accessibility modes',
                ),
                  tooltip: 'Back',
                  onPressed: () {
                    Navigator.pop(context);
                  }
            ),
            //iconBtn(Icons.arrow_back_ios_rounded, notgrey, "Back", Navigator.pop(context))
          ],
        ),
      ),
      )
    );
  }
}