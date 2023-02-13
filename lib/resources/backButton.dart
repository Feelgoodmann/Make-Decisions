import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:make_decisions/screens/mainmenu.dart';

import 'colors.dart';

class specialBackButton extends StatelessWidget{
  
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