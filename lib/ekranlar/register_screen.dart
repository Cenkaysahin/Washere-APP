import 'package:flutter/material.dart';
import 'package:washere/data/database_helper.dart';
import 'package:washere/ekranlar/login_screen.dart';

class RegisterScreen extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'ÜYE OL',
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
                padding: EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.grey.withOpacity(0.2), // Açık gri opak renk
                        border: Border.all(color: Colors.white),
                      ),
                      child: TextFormField(
                        controller: _usernameController,
                        textAlign: TextAlign.center,
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
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white), // Metin rengini burada ayarlayabilirsiniz
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Password',
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    TextButton(
                      onPressed: () async {
                        final username = _usernameController.text;
                        final password = _passwordController.text;

                        // Veritabanında kullanıcı adını kontrol et
                        final existingUser = await DatabaseHelper.instance.getUserByUsername(username);
                        if (existingUser != null) {
                          // Kullanıcı adı zaten mevcut
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Bu kullanıcı adı zaten kullanılıyor. Lütfen farklı bir kullanıcı adı seçin.'),
                              backgroundColor: Colors.red,
                            ),
                          );
                        } else {
                          // Kullanıcıyı kaydet
                          await DatabaseHelper.instance.insertUser(username, password);

                          // Yeşil tik ekranı göster
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Row(
                                children: [
                                  Icon(Icons.check, color: Colors.green),
                                  SizedBox(width: 10),
                                  Text(
                                    'Üye olundu!',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                              backgroundColor: Colors.black,
                              duration: Duration(seconds: 3),
                            ),
                          );

                          // 3 saniye sonra login ekranına geri dön
                          Future.delayed(Duration(seconds: 3), () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => LoginScreen()),
                            );
                          });
                        }
                      },
                      child: Text(
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
