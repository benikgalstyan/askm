import 'package:askm/askm_app.dart';
import 'package:askm/service_locator.dart';
import 'package:flutter/material.dart';

void main() {
  setupServicesLocator();
  runApp(const AskmApp());
}
