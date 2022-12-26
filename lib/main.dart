import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shedenk_mobile/app/modules/AboutPage/views/about_page_view.dart';
import 'package:shedenk_mobile/app/modules/EditProfilePage/views/edit_profile_page_view.dart';
import 'package:shedenk_mobile/app/modules/ForgotPasswordPage/views/forgot_password_page_view.dart';
import 'package:shedenk_mobile/app/modules/RatePage/views/rate_page_view.dart';
import 'package:shedenk_mobile/app/modules/ProfilePage/views/profile_page_view.dart';
import 'package:shedenk_mobile/screens/home/home_screen.dart';

import 'app/modules/LoginPage/views/login_page_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  final List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    AboutPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Beranda',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.error),
              label: 'Tentang',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Akun',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blue,
          onTap: _onItemTapped,
        ),
        body: _widgetOptions[_selectedIndex],
      ),
    );
  }
}

//
