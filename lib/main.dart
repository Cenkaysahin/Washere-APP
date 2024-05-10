import 'package:flutter/material.dart';
import 'package:washere/ekranlar/logoekranı.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LogoScreen(), // İlk olarak logo ekranını gösterin.
    );
  }
}

