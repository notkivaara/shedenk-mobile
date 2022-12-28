// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:shedenk_mobile/app/modules/ForgotPasswordPage/views/forgot_password_page_view.dart';
import 'package:shedenk_mobile/app/modules/LoginPage/controllers/login_page_controller.dart';
import 'package:shedenk_mobile/app/modules/ProfilePage/views/profile_page_view.dart';
import 'package:shedenk_mobile/screens/home/home_screen.dart';
import '../../RegisterPage/views/register_page_view.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shedenk_mobile/url.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final FieldLoginController = Get.put(LoginPageController());
  Future<void> _login() async {
    Uri url = Uri.parse(
        "http://10.0.2.2/shedenk-web/service/loginservice.php?email=${FieldLoginController.UsernameController.text.toString()}&password=${FieldLoginController.PasswordController.text.toString()}");

    var response = await http.get(url);
    print('kata kata');

    if (response.statusCode == 200) {
      //Server response into variable
      print(response.body);
      Get.off(() => HomeScreen());
    }
  }

  bool _showPassword = true;

  void showPassword() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
        ),
        title: Text(
          "Masuk",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
        child: Container(
          alignment: Alignment.center,
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              Image.asset(
                "assets/img/logo.png",
                height: 150,
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: SizedBox(
                  width: 250,
                  height: 60,
                  child: TextField(
                    controller: FieldLoginController.UsernameController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        labelText: "Username"),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: SizedBox(
                  width: 250,
                  height: 60,
                  child: TextField(
                    controller: FieldLoginController.PasswordController,
                    obscureText: true,
                    decoration: InputDecoration(
                        suffixIcon: InkWell(
                          // onTap: ,
                          child: Icon(Icons.visibility),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        labelText: "Kata Sandi"),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: GestureDetector(
                  onTap: () {
                    Get.to(ForgotPasswordPage());
                  },
                  child: Text(
                    "Lupa password?",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.blueAccent,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 50,
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  // style: ,
                  onPressed: () async {
                    // final isValidForm = ();
                    // if (_formKey.currentState!.validate()) {
                    _login();
                    print('hiya');
                    // } else {
                    // print('Gagal');
                    // return null;
                    // }
                  },
                  // _login();
                  // Get.to(() => ProfilePage());
                  child: Text("Masuk",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Belum punya akun?",
                    style: TextStyle(fontSize: 12),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.off(() => RegisterPage());
                    },
                    child: Text(
                      "Daftar",
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
