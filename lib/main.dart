import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shedenk_mobile/app/modules/AboutPage/views/about_page_view.dart';
import 'package:shedenk_mobile/app/modules/EditProfilePage/views/edit_profile_page_view.dart';
import 'package:shedenk_mobile/app/modules/ForgotPasswordPage/views/forgot_password_page_view.dart';
import 'package:shedenk_mobile/app/modules/RatePage/views/rate_page_view.dart';
import 'package:shedenk_mobile/app/modules/ProfilePage/views/profile_page_view.dart';
import 'package:shedenk_mobile/app/modules/RegisterPage/views/register_page_view.dart';
import 'package:shedenk_mobile/models/product.dart';
import 'package:shedenk_mobile/screens/details/details_screen.dart';
import 'package:shedenk_mobile/screens/home/home_screen.dart';

import 'app/modules/LoginPage/views/login_page_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: MainPage(),
      ),
    );
  }
}

// _widgetOptions[_selectedIndex]
