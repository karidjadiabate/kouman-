import 'package:flutter/material.dart';
import 'package:kouman/montant.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(const Pass());

class Pass extends StatelessWidget {
  const Pass({super.key});

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Kouman';
    return MaterialApp(
      routes: {
          '/montant': (BuildContext context) => Montant(),
          '/pass': (BuildContext context) => Pass(),
      },
      debugShowCheckedModeBanner:false,
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
        ),
        body: const MyCustomForm(),
      ),
    );
  }
}

class MyCustomForm extends StatelessWidget {
  const MyCustomForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Entrez votre mot de pass',
            ),
          ),
        ),
      ],
    );
  }
}