import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hydro_chronicle/firebase_options.dart';
import 'package:hydro_chronicle/loading_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: LoadingScreen(),
      ),
    ),
  );
}
