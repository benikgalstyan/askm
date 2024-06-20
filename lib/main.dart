import 'package:askm/askm_app.dart';
import 'package:askm/service_locator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setupServicesLocator();
  runApp(const AskmApp());
}
