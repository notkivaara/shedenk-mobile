import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shedenk_mobile/app/modules/AboutPage/views/about_page_view.dart';
import 'package:shedenk_mobile/app/modules/EditProfilePage/views/edit_profile_page_view.dart';
import 'package:shedenk_mobile/app/modules/ForgotPasswordPage/views/forgot_password_page_view.dart';
import 'package:shedenk_mobile/app/modules/RatePage/views/rate_page_view.dart';
import 'package:shedenk_mobile/app/modules/ProfilePage/views/profile_page_view.dart';

import 'app/modules/LoginPage/views/login_page_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
