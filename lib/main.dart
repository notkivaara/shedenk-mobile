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
      home: ProfilePage(),
    );
  }
}

// final TextStyle UnSelectedStyle = TextStyle(
  //   color: Colors.grey[400],
  //   fontWeight: FontWeight.w500,
  //   fontSize: 12,
  // );
  // final TextStyle SelectedStyle = TextStyle(
  //   color: Colors.blue,
  //   fontWeight: FontWeight.bold,
  //   fontSize: 14,
  // );
  // buildBottomNavigationMenu(context, BottomNavController) {
  //   return Obx(() => MediaQuery(
  //       data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
  //       child:  SizedBox(
  //         height: 54,
  //         child: BottomNavigationBar(
  //           showSelectedLabels: true,
  //           showUnselectedLabels: true,
  //           onTap: BottomNavController.tabIndex,
  //           currentIndex: BottomNavController.tabIndex.value,
  //           backgroundColor: Colors.white,
  //           unselectedItemColor: Colors.grey[400],
  //           selectedItemColor: Colors.blue,
  //           selectedLabelStyle: SelectedStyle,
  //           items: [
  //             BottomNavigationBarItem(
  //                 icon: Container(
  //                   child: Icon(
  //                     Icons.home_outlined,
  //                     size: 30,
  //                   ),
  //                 ),
  //                 label: "Beranda",
  //                 backgroundColor: Colors.amber),
  //             BottomNavigationBarItem(
  //                 icon: Container(
  //                   child: Icon(
  //                     Icons.error_outlined,
  //                     size: 30,
  //                   ),
  //                 ),
  //                 label: "Beranda",
  //                 backgroundColor: Colors.amber),
  //             BottomNavigationBarItem(
  //                 icon: Container(
  //                   child: Icon(
  //                     Icons.account_circle_outlined,
  //                     size: 30,
  //                   ),
  //                 ),
  //                 label: "Beranda",
  //                 backgroundColor: Colors.amber),
  //           ],
  //         ),
  //       )));
  // }

// class BottomNavController extends GetxController {
//   var tabIndex = 0.obs;

//   void changeTabIndex(int index) {
//     tabIndex.value = index;
//   }

//   @override
//   void onInit() {
//     super.onInit();
//   }

//   @override
//   void dispose() {
//     super.dispose();
//   }
// }