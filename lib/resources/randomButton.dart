import 'dart:math';
import 'package:flutter/material.dart';
import 'package:make_decisions/resources/textAndButton.dart';

int roll(int itemCount) {
  return Random().nextInt(itemCount);
}

class RandomButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const RandomButton({Key? key,this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xff0573CE),
            Color(0xff2A5298),
          ]
        ),
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: ElevatedButton(
        child: const Text("สุ่มเลย!",
          style: TextStyle(
            fontSize: 30, 
            fontWeight: FontWeight.w400,
            fontFamily: "Mitr"
          ),
        ),
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
          primary: Colors.transparent,
          onSurface: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
      ),
    );
  }
}