import 'package:firebase_core/firebase_core.dart';
import 'package:firebasewebexample/firebase_options.dart';
import 'package:firebasewebexample/view/my_app.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}
