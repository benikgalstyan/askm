import 'package:askm/askm_app.dart';
import 'package:askm/firebase_options.dart';
import 'package:askm/service_locator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  setupServicesLocator();
  runApp(const AskmApp());
}
