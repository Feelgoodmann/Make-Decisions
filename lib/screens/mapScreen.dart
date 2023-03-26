import 'package:flutter/material.dart';

class mapScreen extends StatefulWidget {

  mapScreen({Key? key}) : super(key: key);
  
  @override
  State<mapScreen> createState() => mapScreenState();
}

class mapScreenState extends State<mapScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            
            children: [
              // GG MAP
              IconButton(
                onPressed: null, 
                icon: Icon(Icons.arrow_forward_ios)
              )
            ],
          ),
        ),
      ),
    );
  }
}