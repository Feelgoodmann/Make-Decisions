import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainMenu extends StatefulWidget {

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      
      body: Container(
        padding: EdgeInsets.only(left: 30, right: 30, top: 50, bottom: 40),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  Icons.settings,
                  color: Colors.black,
                  size: 32.0,
                  semanticLabel: 'Text to announce in accessibility modes',
                ),
              ],
            ),
            Center(
              child: Column(
                children: [
                  Image (image: AssetImage('images/test.png'), width: 100,)
                ],
              )
            ),
            Text("MakeDecision"),
            SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(25)),
                color: Colors.grey,
              ),
              child: Column(
                children: [
                  Text(
                    "โปรดเลือกรูปแบบการสุ่ม"
                    ),
                  
                  ButtonMainMenu('สุ่มอัตโนมัติ', 'images/test.png'),

                  SizedBox(height: 20,),
                  
                  ButtonMainMenu('หมุนวงล้อ', 'images/test.png'),

                  SizedBox(height: 20,),
                  
                  ButtonMainMenu('กินอะไรดี', 'images/test.png')

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ButtonMainMenu extends StatelessWidget{

  final String titleName;
  final String iconName;
  const ButtonMainMenu(this.titleName,this.iconName);

  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = AssetImage(iconName);
    Image image = Image(image: assetImage, width: 100);
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(25)),
        color: Colors.white,
                    ),
      child: Row(
              children: <Widget> [

                Expanded(
                  child: Row(
                    children: [
                      image
                    ],
                  )
                ),

                Expanded(
                  child: Text(
                    titleName,
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      fontFamily: "Mali",
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                      color: Colors.black
                    ),
                  ),
                )
              ],
            ),
    );
  }
}