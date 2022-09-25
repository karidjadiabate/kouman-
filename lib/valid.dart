import 'package:flutter/material.dart';
// import 'package:kouman/accueil.txt';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:kouman/main.dart';
import 'package:kouman/inscription.dart';
import 'package:kouman/main.dart';
import 'package:kouman/valid.dart';

void main() {
  runApp(MyValid());
}

class MyValid extends StatelessWidget {
  const MyValid({key});

  // This widget is the root of your application.
  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      home: Scaffold(
       body: Container(
        child: Image(
          image : AssetImage(
            "assets/logo.png")
            ),
       ),
      ),
    );
 }
}