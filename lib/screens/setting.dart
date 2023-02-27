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
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Column(
            children: [
              const SizedBox(height: 250),
              headerText("Setting"),
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                  color: lightgrey,
                ),
                child: SizedBox(
                  height: 150,
                  child: ListView(
                    children:  <Widget> [
                      ListTile(
                          leading: Icon(Icons.music_note_rounded),
                          title: normalText("เสียง"),
                          trailing : SwitchSetting()
                      ),
                      ListTile(
                          leading: Icon(Icons.vibration_rounded),
                          title: normalText("การสั่น"),
                          trailing : SwitchSetting()
                      ),
                    ],
                  )
                )
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
              )
            ],
          ),
        ),
        )
      );
    }
}