import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart'; // LineIcons paketini import edin
import 'package:washere/ekranlar/harita.dart'; // Harita sayfasını import edin
import 'package:washere/ekranlar/profil.dart';
import 'package:washere/ekranlar/login_screen.dart';// Profil sayfasını import edin

class AnaSayfa extends StatefulWidget {
  @override
  _AnaSayfaState createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          'WASHERE',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: _getSelectedWidget(),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: Colors.black,
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: Duration(milliseconds: 400),
              tabBackgroundColor: Colors.grey[100]!,
              color: Colors.black,
              tabs: [
                GButton(
                  icon: LineIcons.home,
                  text: 'Ana Sayfa',
                ),
                GButton(
                  icon: LineIcons.map,
                  text: 'Harita',
                ),
                GButton(
                  icon: LineIcons.user,
                  text: 'Profil',
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _getSelectedWidget() {
    switch (_selectedIndex) {
      case 0:
        return _buildAnaSayfa();
      case 1:
        return Harita();
      case 2:
        return Profil();
      default:
        return Container();
    }
  }

  Widget _buildAnaSayfa() {
    return Center(
        child: InkWell(
        onTap: () => FocusScope.of(context).unfocus(),
      child: Text(
        'Bu ana sayfadır!',
        style: TextStyle(fontSize: 24.0),
       ),
      )
    );
  }
}
