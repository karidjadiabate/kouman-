// import 'dart:developer';
// import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:flutter_azure_tts/flutter_azure_tts.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:text_to_speech/text_to_speech.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:kouman/montant.dart';
import 'package:kouman/valid.dart';
import 'package:kouman/pass.dart';

import 'accueil.dart';
import 'pass.dart';

// import 'inscription.dart';
// import 'main.dart';

void main() {
  runApp(const Montant());
}

class Montant extends StatelessWidget {
  const Montant({key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        // '/inscription': (BuildContext context) => LoginPage(),
        '/accueil': (BuildContext context) => Accueil(),
        '/montant': (BuildContext context) => Montant(),
        '/pass': (BuildContext context) => Pass(),
        '/valid': (BuildContext context) => MyValid(),
      },
      title: 'KOUMAN',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: const MyHomePage(title: 'Kouman'),
    );
  }
  
  MyLily() {}
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

@override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Variables
  final SpeechToText _speechToText = SpeechToText();
  TextToSpeech tts = TextToSpeech();
  bool _speechEnabled = false;
  bool StartReading = false;
  double volume = 1.0;
  double rate = 1.0;
  double pitch = 8.0;
  String language = 'fr-FR';
  static String _lastWords = '';
  static String  InfoSpeak = ''; 
  static const defaultFinalTimeout = Duration(seconds: 80);
  static const _minFinalTimeout = Duration(seconds: 80);
  final TextEditingController _pauseForController =
        TextEditingController(text: '30');
  final TextEditingController _listenForController =
        TextEditingController(text: '30');
  
  // End variables

  //Functions

  //-Les fonctions de reconnaissance
  @override
  void initState() {
    super.initState();
    _initSpeech();
   _initSpeack();
    _lastWords = "";
  }
  void _initSpeech() async {
    _speechEnabled = await _speechToText.initialize();
    setState(() {});
  }

  void _initSpeack()async{
    tts.setLanguage(language);
    tts.setVolume(volume);
    tts.setRate(rate);
    tts.setPitch(pitch);
  }

  void _startListening() async {
    await _speechToText.listen(
      onResult: _onSpeechResult,
       listenFor: const Duration(seconds:60 ),
       pauseFor: const Duration(seconds: 3),
       partialResults: true,
       listenMode: ListenMode.confirmation,
      );
    setState(() {
      InfoSpeak = 'En ecoute';
    });
  }

  void _stopListening() async {
    await _speechToText.stop();
    setState(() {
      InfoSpeak = 'Parler maintenant';
    });
 Speak();
  }
// Afficher le resultat de la reconnaissance
  void _onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      _lastWords = result.recognizedWords;
      InfoSpeak = '';
    });
    _stopListening();
  }
  //-Fin Les fonctions de reconnaissance

  //Fonction TTS
  void Speak(){

    if(_lastWords!=''){
      String text = _lastWords;
      tts.speak(text);
    } 
}
 
  //Fin Fonction TTS
final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  
  final NumbersInput = TextEditingController();
  
// Fonction de stockage
  Future<void> AddNumb() async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setString('text', NumbersInput.text);
  }
  //End Functions
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Entrez le montant',
              style: Theme.of(context).textTheme.headline4,
            ),
            const SizedBox(
              height: 2.0,
            ),

            Text('$InfoSpeak'
            ),
            const SizedBox(
              height: 2.0,
            ),
            Text('$_lastWords'
            ),

            const SizedBox(
              height: 2.0,
            ),
        IconButton(
          alignment: Alignment.bottomRight,
          icon: const Icon(Icons.navigate_next,
          size:70,
          ),
          onPressed: () async{
            final prefs = await SharedPreferences.getInstance();
            await prefs.setString('text', NumbersInput.text);
            print('saved');
            Navigator.of(context).pushNamed('/pass');
          }
          ),
          ],
        ),
      ),
       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.mic_none, size:36),
          onPressed: () async {
          _startListening() {};// Ecoute et Affiche,
          },
      ),
      
    );
  }
}
