import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:get/get.dart';
import 'package:get_cli/common/utils/json_serialize/sintaxe.dart';
import 'package:shedenk_mobile/app/modules/EditProfilePage/views/edit_profile_page_view.dart';
import 'package:shedenk_mobile/app/modules/LoginPage/views/login_page_view.dart';
// import 'package:widgets/divider.dart';

import '../controllers/profile_page_controller.dart';
import 'package:flutter/widgets.dart';

// class ProfilePageVariable extends InheritedWidget {
//   final bool showWidget;

//   const ProfilePageVariable({
//     Key? key, required this.showWidget, required Widget child,
//   }) : super(key: key, child: child);

//   @override
//   bool updateShouldNotify(ProfilePageVariable oldWidget) => showWidget != oldWidget.showWidget;

//   static ProfilePageVariable? of(BuildContext context) { context.dependOnInheritedWidgetOfExactType<ProfilePageVariable>(); }
// }

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final SettingController = Get.put(ProfilePageController());

  static bool showWidget = false;
  final bool showLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
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
                      Container(
                        width: 100,
                        height: 100,
                        // color: Colors.grey.withOpacity(0.3),
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 2,
                              style: BorderStyle.solid,
                              color: Colors.white),
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  'https://tse4.mm.bing.net/th?id=OIP.pvIrpIuGDqd42wAtJwG0GAHaHa&pid=Api')),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Zainul Karim",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "+62 85123456789",
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                "zainulkarim@gmail.com",
                                style: TextStyle(fontSize: 14),
                              ),
                            ],
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                          child: Icon((Icons.keyboard_arrow_up),
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
                          onTap: () {
                            Get.off(() => LoginPage());
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
    );
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
  var _countCharacter1 = 0;
  var _countCharacter2 = 0;
  bool _confirmPassword = false;
  @override
  void initState() {
    super.initState();
    widget.SettingController.PasswordLamaController.addListener(() {
      int countCharacter1 =
          widget.SettingController.PasswordLamaController.text.length;
      setState(() {
        _countCharacter1 = countCharacter1;
      });
    });
    widget.SettingController.PasswordBaruController.addListener(() {
      int countCharacter2 =
          widget.SettingController.PasswordBaruController.text.length;
      setState(() {
        _countCharacter2 = countCharacter2;
        widget.SettingController.KonfirmasiPasswordController.value.text ==
                widget.SettingController.PasswordBaruController.value.text
            ? _confirmPassword = true
            : _confirmPassword = false;
      });
    });
    widget.SettingController.KonfirmasiPasswordController.addListener(() {
      setState(() {
        widget.SettingController.KonfirmasiPasswordController.value.text ==
                widget.SettingController.PasswordBaruController.value.text
            ? _confirmPassword = true
            : _confirmPassword = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            textfield(widget.SettingController.PasswordLamaController, false,
                'Kata Sandi Lama'),
            // Container(
            //   margin: EdgeInsets.only(left: 8, top: 4),
            //   child: _countCharacter1 < 8 || _countCharacter1 > 16
            //       ? Text(
            //           'minimal 8 - 16 karakter',
            //           style: TextStyle(color: Colors.red),
            //         )
            //       : Text(
            //           'Password telah memenuhi syarat',
            //           style: TextStyle(color: Colors.green),
            //         ),
            // ),
          ],
        ),
        SizedBox(
          height: 6,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            textfield(widget.SettingController.PasswordBaruController, false,
                'Kata Sandi Baru'),
            // TextField(
            //   controller: widget.SettingController.PasswordBaruController,
            //   obscureText: false,
            //   decoration: InputDecoration(
            //       border: OutlineInputBorder(
            //           borderRadius: BorderRadius.circular(10)),
            //       labelText: "Kata Sandi Baru"),
            // ),
            // Container(
            //   margin: EdgeInsets.only(left: 8, top: 4),
            //   child: _countCharacter2 < 8 || _countCharacter2 > 16
            //       ? Text(
            //           'minimal 8 - 16 karakter',
            //           style: TextStyle(color: Colors.red),
            //         )
            //       : Text(
            //           'Password telah memenuhi syarat',
            //           style: TextStyle(color: Colors.green),
            //         ),
            // ),
          ],
        ),
        SizedBox(
          height: 6,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            textfield(widget.SettingController.KonfirmasiPasswordController,
                false, 'Masukkan Ulang Kata Sandi Baru'),
            // TextField(
            //   controller: widget.SettingController.KonfirmasiPasswordController,
            //   obscureText: false,
            //   decoration: InputDecoration(
            //       border: OutlineInputBorder(
            //           borderRadius: BorderRadius.circular(10)),
            //       labelText: "Konfirmasi Kata Sandi"),
            // ),
            // Container(
            //   margin: EdgeInsets.only(left: 8, top: 4),
            //   child: _confirmPassword
            //       ? Text('Benar', style: TextStyle(color: Colors.green))
            //       : Text('Salah', style: TextStyle(color: Colors.red)),
            // ),
          ],
        ),
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

  TextField textfield(controller, bool obsuretxt, String text) {
    return TextField(
      controller: controller,
      obscureText: obsuretxt,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey.shade200,
        border: InputBorder.none,
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
