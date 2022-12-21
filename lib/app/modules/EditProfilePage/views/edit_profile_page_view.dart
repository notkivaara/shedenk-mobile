import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shedenk_mobile/app/modules/EditProfilePage/controllers/edit_profile_page_controller.dart';
import 'package:shedenk_mobile/app/modules/ProfilePage/views/profile_page_view.dart';

class EditProfilePage extends StatelessWidget {
  final FieldForgotPasswordPageController =
      Get.put((EditProfilePageController));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Profile',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
        child: Container(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              // shrinkWrap: true,
              children: <Widget>[
                
                SizedBox(
                  height: 20,
                ),
                TextField(
                  // controller:,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      labelText: "Username"),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  // controller:,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      labelText: "Hobi"),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  // controller:,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      labelText: "Email"),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  // controller: ,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      labelText: "Nomor Telepon"),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 50,
                  child: ElevatedButton(
                    // style: ,
                    onPressed: () {
                      Get.off(() => ProfilePage());
                    },
                    child: Text("Simpan",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600)),
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size.fromHeight(40),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
