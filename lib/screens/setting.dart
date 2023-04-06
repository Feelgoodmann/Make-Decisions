import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../resources/backButton.dart';
import '/resources/colors.dart';
import '../resources/textAndButton.dart';
import 'package:shared_preferences/shared_preferences.dart';

bool _sound = true;
bool _vibrate = true;
class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {

  // เรียกใช้งาน SharedPreferences และกำหนดค่าให้กับ _sound และ _vibrate
  Future<void> _loadSettings() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _sound = prefs.getBool('sound') ?? true; // ถ้าไม่มีค่า sound ให้ใช้ค่าเริ่มต้นเป็น true
      _vibrate = prefs.getBool('vibrate') ?? true; // ถ้าไม่มีค่า vibrate ให้ใช้ค่าเริ่มต้นเป็น true
    });
  }

  // บันทึกค่า _sound และ _vibrate ลงใน SharedPreferences
  Future<void> _saveSettings() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('sound', _sound);
    await prefs.setBool('vibrate', _vibrate);
  }

  @override
  void initState() {
    super.initState();
    _loadSettings();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          //padding: const EdgeInsets.only(left: 30, right: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 30, right: 30),
                child: Column(children: [
                  const SizedBox(height: 250),
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
                                  _saveSettings();
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
                                  _saveSettings();
                                });
                            },
                          )
                      ),
                    ],
                  )
              ),
                ],)
              ),
              Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(bottom: 20, left: 15),
                        child: const godBackButton()
                      )
                    ],
                  ),
                ],
              )
            )
            ],
          ),
        ),
        )
      );
    }
}