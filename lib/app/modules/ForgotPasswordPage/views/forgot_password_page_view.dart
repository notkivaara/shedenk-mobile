import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shedenk_mobile/app/modules/LoginPage/views/login_page_view.dart';

import '../controllers/forgot_password_page_controller.dart';

class ForgotPasswordPage extends StatelessWidget {
  final FieldForgotPasswordPageController =
      Get.put(ForgotPasswordPageController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Lupa Password',
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
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                // Image.asset(
                //   "assets/img/logo.png",
                //   height: 150,
                // ),
                SizedBox(
                  height: 20,
                ),

                SizedBox(
                  width: 250,
                  height: 60,
                  child: TextField(
                    controller:
                        FieldForgotPasswordPageController.UsernameController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        labelText: "Username"),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),

                SizedBox(
                  width: 250,
                  height: 60,
                  child: TextField(
                    controller:
                        FieldForgotPasswordPageController.HobiController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        labelText: "Hobi"),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),

                SizedBox(
                  width: 250,
                  height: 60,
                  child: TextField(
                    controller:
                        FieldForgotPasswordPageController.EmailController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        labelText: "Email"),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),

                SizedBox(
                  width: 250,
                  height: 60,
                  child: TextField(
                    controller: FieldForgotPasswordPageController
                        .NomorTeleponController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        labelText: "Nomor Telepon"),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),

                SizedBox(
                  width: 250,
                  height: 60,
                  child: TextField(
                    controller: FieldForgotPasswordPageController
                        .PasswordBaruController,
                    obscureText: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        labelText: "Password Baru"),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 250,
                  height: 60,
                  child: TextField(
                    controller: FieldForgotPasswordPageController
                        .KonfirmasiPasswordController,
                    obscureText: true,
                    decoration: InputDecoration(
                        suffixIcon: InkWell(
                          // onTap: ,
                          child: Icon(Icons.visibility),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        labelText: "Konfirmasi Password"),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 50,
                  child: ElevatedButton(
                    // style: ,
                    onPressed: () {
                      Get.off(() => LoginPage());
                    },
                    child: Text("Simpan",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600)),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
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
