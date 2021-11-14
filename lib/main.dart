import 'package:flutter/material.dart';
import 'package:le_libros/app/inject_depencies.dart';
import 'package:le_libros/app/my_app.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  injectDependencies();
  runApp(const MyApp());
}
