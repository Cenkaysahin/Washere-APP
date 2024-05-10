import 'package:flutter/material.dart';
import 'package:washere/ekranlar/Ana_sayfa.dart'; // Ana sayfa dosya yolunu ekleyin
import 'package:washere/ekranlar/login_screen.dart'; // LoginScreen dosya yolunu ekleyin

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          PageView(
            onPageChanged: (int index) {
              setState(() {
                _currentPage = index;
              });
            },
            children: [
              // İlk sayfa
              Container(
                color: Colors.black,
                child: Center(
                  child: Text(
                    'Sayfa 1',
                    style: TextStyle(fontSize: 24.0, color: Colors.white),
                  ),
                ),
              ),
              // İkinci sayfa
              Container(
                color: Colors.black,
                child: Center(
                  child: Text(
                    'Sayfa 2',
                    style: TextStyle(fontSize: 24.0, color: Colors.white),
                  ),
                ),
              ),
              // Üçüncü sayfa
              Container(
                color: Colors.black,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Sayfa 3',
                          style: TextStyle(fontSize: 24.0, color: Colors.white),
                        ),
                        SizedBox(height: 20.0),
                      ],
                    ),
                    Positioned(
                      bottom: 20.0,
                      right: 20.0,
                      child: _currentPage == 2 ? GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => LoginScreen(), // LoginScreen'e geçin
                          ));
                        },
                        child: Text('Başla', style: TextStyle(fontSize: 18.0, color: Colors.white)),
                      ) : SizedBox(),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 20.0,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                3, // Toplam sayfa sayısı
                    (index) => _buildDot(index),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDot(int index) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      height: 5.0,
      width: _currentPage == index ? 20.0 : 10.0,
      decoration: BoxDecoration(
        color: _currentPage == index ? Colors.white : Colors.white54,
        borderRadius: BorderRadius.circular(5.0),
      ),
    );
  }
}
