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
              child: Icon(
                  Icons.settings,
                  color: Colors.black,
                  size: 32.0,
                  semanticLabel: 'Text to announce in accessibility modes',
                ),
            ),
            Text("data"),
            SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(25)),
                color: Colors.grey,
              ),
              child: Column(
                children: [
                  Text("data"),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        Text("data"),
                        Icon(
                          Icons.question_mark_rounded,
                          color: Colors.black,
                          size: 32.0,
                          semanticLabel: 'Text to announce in accessibility modes',
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        Text("data"),
                        Icon(
                          Icons.question_mark_rounded,
                          color: Colors.black,
                          size: 32.0,
                          semanticLabel: 'Text to announce in accessibility modes',
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        Text("data"),
                        Icon(
                          Icons.question_mark_rounded,
                          color: Colors.black,
                          size: 32.0,
                          semanticLabel: 'Text to announce in accessibility modes',
                        ),
                      ],
                    ),
                  ),
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
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(25)),
        color: Colors.white,
                    ),
      child: Column(
        children: [
          Text(titleName),
          Icon(
            Icons.iconName,
            color: Colors.black,
            size: 32.0,
            semanticLabel: 'Text to announce in accessibility modes',
          ),
        ],
      ),
    );
  }
}