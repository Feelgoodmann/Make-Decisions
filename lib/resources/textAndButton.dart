import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:make_decisions/screens/mainmenu.dart';
import 'package:make_decisions/screens/randomFood.dart';
import 'package:make_decisions/screens/spin_bilnd.dart';
import 'package:make_decisions/screens/auto_random.dart';
import '../screens/setting.dart';
import '/resources/colors.dart';
import 'foodInfo.dart';


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
Widget buttonText(text){
  return Text(text,
  style:
    const TextStyle(fontSize: 30, fontWeight: FontWeight.w400,fontFamily: "Mitr"),
    );
}
Widget smallText(text){
  return Text(text,
  style:
    const TextStyle(fontSize: 16, fontWeight: FontWeight.w400,fontFamily: "Mitr"),
    );
}

Widget spinText(text, double size){
  return Text(text,
  style:
    TextStyle(fontSize: size, fontWeight: FontWeight.w400,fontFamily: "Mitr"),
    );
}

Widget mainMenuButton(String text, String asset, BuildContext context) {
  AssetImage assetImage = AssetImage(asset);
  Image image = Image(image: assetImage, width: 75);
  return ElevatedButton(
    onPressed: () {
      if(text == 'สุ่มตัวเลข'){
        Navigator.push(context, MaterialPageRoute(builder: (context) => AutoRandom())); //wwwwwwwwwwwwwwwwwwwwwwwwww
      }
      else if(text == 'หมุนวงล้อ'){
        Navigator.push(context, MaterialPageRoute(builder: (context) => SpinBilndWheel())); //wwwwwwwwwwwwwwwwwwwwwwwww
      }
      else if(text == 'กินอะไรดี'){
        Navigator.push(context, MaterialPageRoute(builder: (context) => FoodResInfo()));
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