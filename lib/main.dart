import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:alarme_pi/screens/login.dart';
import 'firebase_options.dart';

/////////////////////////////////////////////////////////////
/// Requer o arquivo "firebase_options.dart" na pasta lib ///
/////////////////////////////////////////////////////////////

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // Incluir o arquivo firebase_options.dart junto com este arquivo main.dart
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Alarme PI',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blueGrey,
      ),
      //home: const MyHomePage(title: 'Flutter Demo Home Page'),
      home: const LoginTela(),
    );
  }
}
