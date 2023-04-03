import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '/resources/colors.dart';
import '../resources/textAndButton.dart';
import '/screens/auto_random.dart';

bool _sound = true;
bool _vibrate = true;
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              headerText("Setting", notblack),
              const SizedBox(height: 10),
              Container(
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(25)),
                  color: lightgrey,
                ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:  <Widget> [
                      ListTile(
                          leading: const Icon(Icons.music_note_rounded),
                          title: normalText("เสียง", notblack),
                          trailing : CupertinoSwitch(
                            value: _sound,
                            activeColor: notgreen,
                            onChanged: (bool isOn) {
                                setState(() {
                                  _sound = isOn;
                                });
                            },
                          )
                      ),
                      ListTile(
                          leading: const Icon(Icons.vibration_rounded),
                          title: normalText("การสั่น", notblack),
                          trailing : CupertinoSwitch(
                            value: _vibrate,
                            activeColor: notgreen,
                            onChanged: (bool isOn) {
                                setState(() {
                                  _vibrate = isOn;
                                });
                            },
                          )
                      ),
                    ],
                  )
              ),
              const SizedBox(height: 30),
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