import 'dart:convert';
import 'dart:ui';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shedenk_mobile/app/modules/CartPage/views/cart_page_view.dart';
import 'package:shedenk_mobile/app/modules/LoginPage/views/login_page_view.dart';
import '../../app/modules/AboutPage/views/about_page_view.dart';
import '../../app/modules/ProfilePage/views/profile_page_view.dart';
import 'components/top_navbar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'components/body.dart';

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  static bool isShow = false;
  int _selectedIndex = 0;

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
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.error),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
      body: _widgetOptions[_selectedIndex],
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isShow = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: Drawer(),
      appBar: AppBar(
          // backgroundColor: Colors.white,
          // leadingWidth: 70,
          // // leading: TextButton(
          //   onPressed: () {
          //     setState(() {
          //       isShow = !isShow;
          //     });
          //   },
          //   child: Text(
          //     "Kategori",
          //     style: TextStyle(color: Colors.black),
          //   ),
          // ),
          // shadowColor: Colors.black.withOpacity(isShow ? 0 : 1),
          title: Text('Dashboard')
          // Container(
          //   width: MediaQuery.of(context).size.width,
          //   decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(5),
          //       color: Colors.grey.shade200),
          //   padding: EdgeInsets.only(left: 8),
          //   child: TextField(
          //     minLines: 1,
          //     decoration: InputDecoration(
          //       border: InputBorder.none,
          //       icon: Icon(
          //         Icons.search,
          //         color: Colors.grey,
          //       ),
          //     ),
          //   ),
          // ),
          // actions: [
          //   IconButton(
          //     icon: Icon(Icons.shopping_cart_outlined),
          //     color: Colors.black,
          //     onPressed: () {},
          //   ),
          // ],
          ),
      body: BodyHome(),
    );
  }
}
