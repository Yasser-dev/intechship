import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import './app/dependencies.dart' as di;
import 'my_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  di.init();
  runApp(MyApp());
}
