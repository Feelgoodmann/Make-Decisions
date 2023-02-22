import 'package:flutter/material.dart';
import 'package:make_decisions/screens/mainmenu.dart';
import 'package:make_decisions/screens/randomFood.dart';
import 'package:make_decisions/screens/spin_bilnd.dart';
import '../screens/setting.dart';
import '/resources/colors.dart';

Widget headerText(text) {
  return Text(text,
  style:
    const TextStyle(fontSize: 35, fontFamily: "FCSound"),
    );
}
Widget normalText(text){
  return Text(text,
  style:
    const TextStyle(fontSize: 20, fontWeight: FontWeight.w400,fontFamily: "Mitr"),
    );
}
Widget mainMenuButton(String text, String asset, BuildContext context) {
  AssetImage assetImage = AssetImage(asset);
  Image image = Image(image: assetImage, width: 75);
  return ElevatedButton(
    onPressed: () {
      if(text == 'สุ่มอัตโนมัติ'){
        Navigator.push(context, MaterialPageRoute(builder: (context) => MainMenu())); //wwwwwwwwwwwwwwwwwwwwwwwwww
      }
      else if(text == 'หมุนวงล้อ'){
        Navigator.push(context, MaterialPageRoute(builder: (context) => SpinBilndWheel())); //wwwwwwwwwwwwwwwwwwwwwwwww
      }
      else if(text == 'กินอะไรดี'){
        Navigator.push(context, MaterialPageRoute(builder: (context) => RandomFoodScreen()));
      }
    },
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)
      )
    ),
    child: Row(
              children: <Widget> [
                //const SizedBox(width:30),
                Row(
                  children: [
                    image
                  ],
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Text(
                    text,
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      fontFamily: "Mitr",
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
                      color: notblack,
                    ),
                  ),
                )
              ],
            ),
  );
}
class SwitchSetting extends StatefulWidget {
  const SwitchSetting({Key? key}) : super(key: key);


  @override
  State<SwitchSetting> createState() => _SwitchSettingState();
}

class _SwitchSettingState extends State<SwitchSetting> {
  bool light = true;

  @override
  Widget build(BuildContext context) {
    return Switch(
      // This bool value toggles the switch.
      value: light,
      activeColor: notgreen,
      onChanged: (bool value) {
        // This is called when the user toggles the switch.
        setState(() {
          light = value;
        });
      },
    );
  }
}