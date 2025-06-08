import 'package:flutter/material.dart';
import 'package:hello2fa/app.dart';

void main() {
  _ensureInitialized();
  runApp(const MyApp());
}

void _ensureInitialized() {
  WidgetsFlutterBinding.ensureInitialized();
}
