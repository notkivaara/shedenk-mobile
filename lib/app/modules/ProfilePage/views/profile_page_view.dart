import 'dart:developer';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:get/get.dart';
import 'package:get_cli/common/utils/json_serialize/sintaxe.dart';
import 'package:shedenk_mobile/app/modules/EditProfilePage/views/edit_profile_page_view.dart';
import 'package:shedenk_mobile/app/modules/LoginPage/views/login_page_view.dart';
import 'package:shedenk_mobile/screens/home/home_screen.dart';
// import 'package:widgets/divider.dart';

import '../controllers/profile_page_controller.dart';
import 'package:flutter/widgets.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final SettingController = Get.put(ProfilePageController());

  static bool showWidget = false;
  final bool showLoading = false;
  String nama = "";
  String email = "";
  // String gambar = "";
  // String noTe = "";

  Future getNama() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      // gambar = (prefs.getString('gambar') ?? "");
      nama = (prefs.getString('nama') ?? "");
      email = (prefs.getString('email') ?? "");
    });
  }

  @override
  void initState() {
    super.initState();
    getNama();
  }

  @override
  Widget build(BuildContext context) {
    return nama != "" && email != ""
        ? Scaffold(
            appBar: AppBar(
              title: Text(
                "Profile",
                style: TextStyle(color: Colors.black),
              ),
              backgroundColor: Colors.white,
              shadowColor: Colors.transparent,
            ),
            body: Padding(
              padding: const EdgeInsets.all(10),
              child: ListView(
                children: <Widget>[
                  SizedBox(
                    height: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            // Text(gambar),
                            // Container(
                            //   width: 100,
                            //   height: 100,
                            //   // color: Colors.grey.withOpacity(0.3),
                            //   decoration: BoxDecoration(
                            //     border: Border.all(
                            //         width: 2,
                            //         style: BorderStyle.solid,
                            //         color: Colors.white),
                            //     shape: BoxShape.circle,
                            //     image: DecorationImage(
                            //         fit: BoxFit.cover, image: ),
                            //   ),
                            // ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  nama,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                                // Text(
                                //   "+62 85123456789",
                                //   style: TextStyle(
                                //     fontSize: 14,
                                //   ),
                                // ),
                                Text(
                                  email,
                                  style: TextStyle(fontSize: 14),
                                ),
                              ],
                            ),
                          ],
                        ),
                        IconButton(
                            onPressed: () {
                              Get.to(() => EditProfilePage());
                            },
                            icon: Icon(Icons.edit))
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Container(
                      // color: Colors.amber,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 40,
                            width: MediaQuery.of(context).size.width - 40,
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                splashColor: Colors.grey,
                                onTap: () {
                                  setState(() {
                                    showWidget = !showWidget;
                                  });
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Ubah Kata Sandi",
                                          textAlign: TextAlign.left,
                                          style: TextStyle(),
                                        ),
                                        showWidget
                                            ? SizedBox(
                                                height: 40,
                                                width: 40,
                                                child: Icon(
                                                    (Icons.keyboard_arrow_up),
                                                    color: Color(0xFFD9D9D9)))
                                            : SizedBox(
                                                height: 40,
                                                width: 40,
                                                child: Icon(
                                                    (Icons.keyboard_arrow_down),
                                                    color: Color(0xFFD9D9D9))),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Column(
                            children: [
                              showWidget
                                  ? FormChangePassword(
                                      SettingController: SettingController)
                                  : Container()
                            ],
                          ),
                          SizedBox(
                            height: 40,
                            width: MediaQuery.of(context).size.width - 40,
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                splashColor: Colors.grey,
                                onTap: () async {
                                  final prefs =
                                      await SharedPreferences.getInstance();
                                  prefs.setBool('isLoggedIn', false);
                                  await prefs.setString(
                                    'id',
                                    "",
                                  );
                                  await prefs.setString(
                                    'nama',
                                    "",
                                  );
                                  await prefs.setString(
                                    'email',
                                    "",
                                  );
                                  await prefs.setString(
                                    'password',
                                    "",
                                  );
                                  await prefs.setString(
                                    'hobi',
                                    "",
                                  );
                                  await prefs.setString(
                                    'id_role',
                                    "",
                                  );
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => MainPage()));
                                },
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Logout",
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        : LoginPage();
  }
}

class FormChangePassword extends StatefulWidget {
  FormChangePassword({
    Key? key,
    required this.SettingController,
  }) : super(key: key);

  final ProfilePageController SettingController;

  @override
  State<FormChangePassword> createState() => _FormChangePasswordState();
}

class _FormChangePasswordState extends State<FormChangePassword> {
  // var _countCharacter1 = 0;
  // var _countCharacter2 = 0;
  // bool _confirmPassword = false;
  @override
  // void initState() {
  //   super.initState();
  //   widget.SettingController.PasswordLamaController.addListener(() {
  //     int countCharacter1 =
  //         widget.SettingController.PasswordLamaController.text.length;
  //     setState(() {
  //       _countCharacter1 = countCharacter1;
  //     });
  //   });
  //   widget.SettingController.PasswordBaruController.addListener(() {
  //     int countCharacter2 =
  //         widget.SettingController.PasswordBaruController.text.length;
  //     setState(() {
  //       _countCharacter2 = countCharacter2;
  //       widget.SettingController.KonfirmasiPasswordController.value.text ==
  //               widget.SettingController.PasswordBaruController.value.text
  //           ? _confirmPassword = true
  //           : _confirmPassword = false;
  //     });
  //   });
  //   widget.SettingController.KonfirmasiPasswordController.addListener(() {
  //     setState(() {
  //       widget.SettingController.KonfirmasiPasswordController.value.text ==
  //               widget.SettingController.PasswordBaruController.value.text
  //           ? _confirmPassword = true
  //           : _confirmPassword = false;
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        textformfield(widget.SettingController.PasswordLamaController,
            "Masukkan Password Lama", false),
        SizedBox(
          height: 6,
        ),
        textformfield(widget.SettingController.PasswordBaruController,
            "Masukkan Password Baru", false),
        SizedBox(
          height: 6,
        ),
        textformfield(widget.SettingController.KonfirmasiPasswordController,
            "Masukkan Kembali Password Baru", false),
        SizedBox(
          height: 10,
        ),
        ElevatedButton(
          onPressed: () {
            Get.defaultDialog(
              contentPadding: EdgeInsets.all(10),
              title: '',
              titleStyle: TextStyle(fontSize: 0),
              content: Text(
                'Simpan Perubahan?',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              cancel: ElevatedButton(
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all(0),
                  minimumSize: MaterialStateProperty.all(
                      Size(MediaQuery.of(context).size.width * .25, 40)),
                  overlayColor:
                      MaterialStateProperty.all(Colors.red.withOpacity(.2)),
                  side: MaterialStateProperty.all(
                      BorderSide(width: 2, color: Colors.red)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
                  backgroundColor:
                      MaterialStateProperty.all(Colors.transparent),
                  shadowColor: MaterialStateProperty.all(Colors.transparent),
                ),
                onPressed: () {},
                child: Text(
                  "Batal",
                  style: TextStyle(color: Colors.red),
                ),
              ),
              confirm: ElevatedButton(
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all(0),
                  minimumSize: MaterialStateProperty.all(
                      Size(MediaQuery.of(context).size.width * .25, 40)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
                ),
                onPressed: () {},
                child: Text("Simpan"),
              ),
            );
          },
          child: Text("Simpan",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
          style: ElevatedButton.styleFrom(
            minimumSize: Size(MediaQuery.of(context).size.width, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    );
  }

  TextFormField textformfield(controller, String text, bool obsuretxt) {
    return TextFormField(
      // initialValue: nama,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Data tidak boleh kosong";
        } else {
          return null;
        }
      },
      obscureText: obsuretxt,
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey.shade200,
        border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(16)),
        hintText: text,
      ),
    );
  }
}

final TextStyle UnSelectedStyle = TextStyle(
  color: Colors.grey[400],
  fontWeight: FontWeight.w500,
  fontSize: 12,
);
final TextStyle SelectedStyle = TextStyle(
  color: Colors.blue,
  fontWeight: FontWeight.bold,
  fontSize: 14,
);

class BottomNavController extends GetxController {
  RxInt tabIndex = 0.obs;

  void changeTabIndex(int index) {
    tabIndex.value = index;
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
