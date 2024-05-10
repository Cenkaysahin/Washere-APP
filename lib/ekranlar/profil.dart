import 'package:flutter/material.dart';

class Profil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Profil'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 50,
                // Profil fotoğrafı buraya eklenebilir
                // backgroundImage: AssetImage('assets/profil_fotografi.jpg'),
              ),
              SizedBox(height: 20),
              Text(
                'Kullanıcı Adı',
                style: TextStyle(fontSize: 24),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
