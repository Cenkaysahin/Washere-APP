import 'package:flutter/material.dart';
import 'package:washere/data/database_helper.dart';
import 'package:washere/ekranlar/register_screen.dart';
import 'package:washere/ekranlar/Ana_sayfa.dart'; // RegisterScreen import edildi

class LoginScreen extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'WASHERE',
          style: TextStyle(
            color: Colors.black, // Başlık metni rengi
            fontSize: 40.0, // Başlık metni font büyüklüğü
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: SizedBox.expand(
              child: Container(
                color: Colors.white,
              ),
            ),
          ),
          Expanded(
            flex: 10,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50.0),
                  topRight: Radius.circular(50.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(1), // Gölge rengi ve opaklığı
                    spreadRadius: 8, // Gölgenin yayılma yarıçapı
                    blurRadius: 7, // Gölge bulanıklığı
                    offset: Offset(0, 2), // Gölgenin X ve Y yönündeki ofseti
                  ),
                ],
                color: Colors.black,
              ),
              child: Padding(
                padding: EdgeInsets.all(20.0), // Padding eklendi
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 20.0),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.grey.withOpacity(0.2), // Açık gri opak renk
                        border: Border.all(color: Colors.white),
                      ),
                      child: TextFormField(
                        controller: _usernameController,
                        textAlign: TextAlign.center, // Kullanıcı adı kutusunu ortala
                        style: TextStyle(color: Colors.white), // Metin rengini burada ayarlayabilirsiniz
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Username',
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.grey.withOpacity(0.2), // Açık gri opak renk
                        border: Border.all(color: Colors.white),
                      ),
                      child: TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        textAlign: TextAlign.center, // Şifre kutusunu ortala
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Password',
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    TextButton.icon(
                      onPressed: () async {
                        final username = _usernameController.text;
                        final password = _passwordController.text;

                        final user = await DatabaseHelper.instance.getUserByUsername(username);

                        if (user != null && user['password'] == password) {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AnaSayfa()));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Invalid username or password'),
                              backgroundColor: Colors.red,
                            ),
                          );
                        }
                      },
                      icon: Icon(Icons.login, color: Colors.white), // Giriş yap iconu ve rengi
                      label: Text(
                        'GİRİŞ YAP',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                      ),
                    ),

                    TextButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => RegisterScreen()),
                        );
                      },
                      icon: Icon(Icons.person_add, color: Colors.white), // Üye ol iconu ve rengi
                      label: Text(
                        'ÜYE OL',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
