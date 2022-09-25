import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:kouman/accueil.dart';
import 'package:kouman/connexion.dart';
import 'package:kouman/inscription.dart';
import 'package:kouman/main.dart';
import 'package:kouman/pass.dart';
import 'package:kouman/valid.dart';
import 'package:http/http.dart' as http;


void main() {
  runApp(LoginPage());
}

class LoginPage extends StatelessWidget {
  const LoginPage({key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
     routes: {
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

  final nom_prenom =  TextEditingController();
     final numero =  TextEditingController();
      final mot_de_pass =  TextEditingController();

      var reponse;

  Future<void> insertion() async {
    if(nom_prenom.text != "" ||
        numero.text != "" ||
        mot_de_pass.text != "") {
    
        //String uri ="https://loyerplus.simplonien-da.net/ajouter_bailleur.php";
      try {
        
        final res = await http.post(Uri.parse("https://kouman.ksi.ci/kouman/inscription.php"), body: {
          "nom_prenom": nom_prenom.text,
          "numero": numero.text,
          "mot_de_pass": mot_de_pass.text,
          
        });

        if(res.statusCode == 200){
          // _showMyDialog();
          print("connected");
          reponse = json.decode(res.body); 
          print(reponse);
          //return allmaisons;
        }else {
         
          print('not connected');
          print(reponse);
        }
          
          // Clean();
          // print('record inserted');
          // print(response);
          //print(response);
        
      } catch (e) {
        print(e);
      
        //_showErrorMyDialog();
      
      }
    
    } else {
      print("erreur d'access");
      print("please fill all fileds");
    }
  }
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
              ]),
                 child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 90),

                TextField(
                    controller:nom_prenom,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 5,
                      vertical: 10,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(width: 2, color: Colors.black38),
                    ),
                    labelText: 'Entrez votre nom & prenoms',
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
                  controller:numero,
                  maxLength: 10,
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
                    labelText: 'Entrez votre numero ',
                    labelStyle: TextStyle(),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(width: 2, color: Colors.black),
                    ),
                  ),
                ),
                 const SizedBox(height: 40),
                TextField(
                  controller:mot_de_pass,
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
                const SizedBox(
                   height: 20.0,
                    ),
                 ElevatedButton(
                    style: ElevatedButton.styleFrom(
                         foregroundColor: Colors.amberAccent,
                         backgroundColor: Colors.black),
                     onPressed: () {
                      insertion();
                       Navigator.of(context).pushNamed('/accueil');
                     },
                     child: const Text('Créer un compte')),
                 const SizedBox(
                   height: 12.0,
                    ),
             ElevatedButton(
                     style: ElevatedButton.styleFrom(
                     foregroundColor: Colors.amberAccent,
                     backgroundColor: Colors.black),
                     onPressed: () { 
                      Navigator.of(context).pushNamed('/connexion');
                    },
                      child: Text('Connexion'),
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
