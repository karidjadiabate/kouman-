// import 'dart:async';
import 'package:flutter/material.dart';
import 'package:kouman/accueil.dart';                  
import 'package:kouman/connexion.dart';       
import 'package:kouman/inscription.dart';     
import 'package:kouman/main.dart';
import 'package:kouman/valid.dart';

void main() {
  runApp(MyApp());
 }

class MyApp extends StatelessWidget {
  const MyApp({key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      routes:{
        '/inscription': (BuildContext context) => LoginPage(),
        '/accueil': (BuildContext context) => Accueil(),
        '/connexion': (BuildContext context) => MyConnect(),
        '/main': (BuildContext context) => MyApp(),
        '/valid': (BuildContext context) => MyValid(),
      },
      home: Scaffold(
        body: Center(child: Square()),
      ),
    );
  }
}

class Square extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final Width = MediaQuery.of(context).size.width;
    // final height = MediaQuery.of(context).size.height;
    return Stack(alignment: Alignment.topCenter,
      children: [
        Container(
          margin: EdgeInsets.only(top:140),
          height: 480,
          width: 320,
          decoration: const BoxDecoration(
              color: Colors.amberAccent,
              borderRadius: BorderRadius.all(Radius.circular(40)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(4.0, 4.0),
                  blurRadius: 15.0,
                  spreadRadius: 1.0,
                ),
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(-4.0, -4.0),
                  blurRadius: 15.0,
                  spreadRadius: 1.0,
                ),
              ],
              ),
                 child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 90),

                TextField(
                      maxLength: 10,
                      // maxLengthEnforcement: MaxLengthEnforcement.enforced,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                      horizontal: 5,
                      vertical: 10,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(width: 2, color: Colors.black38),
                    ),
                    labelText: ('Entrez votre numero'),
                    labelStyle: TextStyle(),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(
                        width: 2,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                TextField(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 5,
                      vertical: 10,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(
                        width: 2,
                        color: Colors.black,
                      ),
                    ),
                    labelText: ('Entrez votre mot de passe'),
                    labelStyle: TextStyle(),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(width: 2, color: Colors.black),
                    ),
                  ),
                ),
              const SizedBox(
                   height: 50.0,
                    ),  

                 ElevatedButton(
                    style: ElevatedButton.styleFrom(
                         foregroundColor: Colors.amberAccent,
                         backgroundColor: Colors.black),
                     onPressed: () {
                       Navigator.of(context).pushNamed('/accueil');
                     },
                     child: const Text('Connexion'),
                   ),
                      const SizedBox(
                       height: 20.0,
                     ),
                     ElevatedButton(
                     style: ElevatedButton.styleFrom(
                     foregroundColor: Colors.amberAccent,
                     backgroundColor: Colors.black),
                     onPressed: () { 
                      Navigator.of(context).pushNamed('/inscription');
                    },
                      child: Text('Créer un compte'),
                     ),
                   ],
                 ),
                ),
                 ),
                  CircleAvatar(
                  foregroundImage: AssetImage("assets/logo.png"),
                  radius: 50,
        ),
      ],
    );
  }
}
