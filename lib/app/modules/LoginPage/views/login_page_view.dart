// import 'dart:html';

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shedenk_mobile/app/modules/EditProfilePage/views/edit_profile_page_view.dart';
import 'package:shedenk_mobile/app/modules/ForgotPasswordPage/views/forgot_password_page_view.dart';
import 'package:shedenk_mobile/app/modules/LoginPage/controllers/login_page_controller.dart';
import 'package:shedenk_mobile/app/modules/ProfilePage/views/profile_page_view.dart';
import 'package:shedenk_mobile/main.dart';
import 'package:shedenk_mobile/screens/home/home_screen.dart';
import '../../RegisterPage/views/register_page_view.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shedenk_mobile/url.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final FieldLoginController = Get.put(LoginPageController());
  List result = [];
  Future<void> _login() async {
    Uri url = Uri.parse(
        "http://shedenk.wstif3d.id/service/loginservice.php?email=${FieldLoginController.UsernameController.text.toString()}&password=${FieldLoginController.PasswordController.text.toString()}");

    var response = await http.get(url);

    if (response.statusCode == 200) {
      //Server response into variable
      // print(response.body);
      // Get.off(() => HomeScreen());
      final msg = jsonDecode(response.body);
      // print(msg['akun']['id']);

      //Check Login Status
      if (msg['loginStatus'] == true) {
        final prefs = await SharedPreferences.getInstance();
        prefs.setBool('isLoggedIn', true);

        await prefs.setString(
          'id',
          msg['akun']['id'],
        );
        await prefs.setString(
          'nama',
          msg['akun']['nama'],
        );
        await prefs.setString(
          'email',
          msg['akun']['email'],
        );
        await prefs.setString(
          'password',
          msg['akun']['password'],
        );
        await prefs.setString(
          'hobi',
          msg['akun']['hobi'],
        );
        await prefs.setString(
          'id_role',
          msg['akun']['id_role'],
        );
        // await prefs.setString(
        //   'gambar',
        //   msg['akun']['gambar'],
        // );
        final myMapPref = json.encode(
          {
            'id': '${msg['akun']['id']}',
            'nama': '${msg['akun']['nama']}',
            'email': '${msg['akun']['email']}',
            'password': '${msg['akun']['password']}',
            'hobi': '${msg['akun']['hobi']}',
          },
        );
        prefs.setString('authData', myMapPref);
        Get.off(() => MainPage());
      } else {
        setState(() {
          //Show Error Message
          showMessage(msg["message"]);
        });
      }
    } else {
      setState(() {
        showMessage("Error during connecting to server");
      });
    }
    Future<void> autoLogin() async {
      final sharedPref = await SharedPreferences.getInstance();
      final myData = sharedPref.get('authData') as Map<String, dynamic>;
    }
  }

  Future<void> showMessage(String _msg) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text(_msg),
          actions: <Widget>[
            TextButton(
              child: new Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
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
        // leading: IconButton(
        //   onPressed: () {
        //     Get.off(() => MainPage());
        //   },
        //   icon: Icon(Icons.arrow_back),
        //   color: Colors.black,
        // ),
        title: Text(
          "Masuk",
          // style: TextStyle(color: Colors.black),
        ),
        // backgroundColor: Colors.transparent,
        // shadowColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
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
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Data tidak boleh kosong";
                  } else {
                    return null;
                  }
                },
                controller: FieldLoginController.UsernameController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(16)),
                  hintText: 'Email',
                ),
              ),
              SizedBox(
                height: 8,
              ),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Data tidak boleh kosong";
                  } else {
                    return null;
                  }
                },
                controller: FieldLoginController.PasswordController,
                obscureText: true,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(16)),
                  hintText: 'Kata Sandi',
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
                      Get.to(() => RegisterPage());
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
