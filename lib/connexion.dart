import 'package:flutter/material.dart';
import 'package:kouman/accueil.dart';
import 'package:kouman/connexion.dart';
import 'package:kouman/inscription.dart';
import 'package:kouman/main.dart';
import 'package:kouman/valid.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyConnect());
}

class MyConnect extends StatelessWidget {
  const MyConnect({key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
       routes: {
        '/accueil': (BuildContext context) => Accueil(),
        '/inscription': (BuildContext context) => LoginPage(),
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

class MyAccueil {
}

class Square extends StatelessWidget {

  final numero = TextEditingController();
  final mot_de_pass = TextEditingController();

  var reponse;

  Future<void> insertion() async {
    if (numero.text != "" || mot_de_pass.text != "") {
      try {
        final res = await http.post(
            Uri.parse(
                "https://koumann.000webhostrapp.com/kouman/connexion.php"),
            body: {
              "numero": numero.text,
              "mot_de_pass": mot_de_pass.text,
            });

        if (res.statusCode == 200) {
          // _showMyDialog();
          print("connected");
          reponse = json.decode(res.body);
          print(reponse);
          //return allmaisons;
        } else {
          print('not connected');
          print(reponse);
        }

      } catch (e) {
        print(e);

      }
    } else {
      print("erreur d'access");
      print("please fill all fileds");
    }
  }
  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.topCenter,
      children: [
        Container(
          margin: const EdgeInsets.only(top:140),
          height: 480,
          width: 320,
          decoration: BoxDecoration(
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
              ]),
                 child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 90),
                TextField(
                  controller: mot_de_pass,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 5,
                      vertical: 10,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(width: 2, color: Colors.black38),
                    ),
                    labelText: 'Entrez votre numero',
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

                const SizedBox(height: 40),

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
                    labelText: 'Entrez votre mot de pass ',
                    labelStyle: TextStyle(),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(width: 2, color: Colors.black),
                    ),
                  ),
                ),
                 ElevatedButton(
                    style: ElevatedButton.styleFrom(
                         foregroundColor: Colors.amberAccent,
                         backgroundColor: Colors.black),
                     onPressed: () {
                       Navigator.of(context).pushNamed('/accueil');
                     },
                     child: const Text('Connexion')
                     ),

                 const SizedBox(
                   height: 12.0,
                    ),

             ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/inscription');
                }, child: const Text("Créer un compte")),
            const SizedBox(
              height: 10.0,
            ),
              ],
            ),
          ),
        ),
        const CircleAvatar(
                foregroundImage: AssetImage("assets/logo.png"),
                radius: 60,
              ),
      ],
    );
  }
}
