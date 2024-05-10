import 'dart:async';
import 'package:flutter/material.dart';
import 'package:washere/ekranlar/splash_screen.dart'; // Splash screen dosya yolunu ekleyin.

class LogoScreen extends StatefulWidget {
  @override
  _LogoScreenState createState() => _LogoScreenState();
}

class _LogoScreenState extends State<LogoScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 5), // 3 saniye sonra splash screen'e geçmek için zamanlayıcı başlatın.
          () => Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => SplashScreen(),
      )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo görüntüsünü buraya ekleyin
            Image.asset('assets/washere.jpeg'),
          ],
        ),
      ),
    );
  }
}
