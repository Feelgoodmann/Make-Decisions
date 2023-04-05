import 'package:flutter/material.dart';
import 'colors.dart';

class specialBackButton extends StatelessWidget{
  const specialBackButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.arrow_back_ios_rounded,
        color: notgrey,
        size: 40.0,
        semanticLabel: 'Text to announce in accessibility modes',
        ),
      tooltip: 'Back',
      onPressed: () {
        Navigator.pop(context);
      },
      
    );
  }
}