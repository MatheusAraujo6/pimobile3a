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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Alarme PI',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const LoginTela(),
    );
  }
}
