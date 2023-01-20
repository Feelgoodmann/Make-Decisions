import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
Widget mainMenuButton(String text, String asset){
  AssetImage assetImage = AssetImage(asset);
  Image image = Image(image: assetImage, width: 75);
  return Container(
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(25)),
      color: Colors.white,
                    ),
      child: Row(
              children: <Widget> [
                const SizedBox(width:30),
                Container(
                  child: Row(
                    children: [
                      image
                    ],
                  )
                ),
                const SizedBox(width: 30),
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