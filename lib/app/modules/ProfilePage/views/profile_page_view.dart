import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:get/get.dart';
import 'package:shedenk_mobile/app/modules/EditProfilePage/views/edit_profile_page_view.dart';
import 'package:shedenk_mobile/app/modules/LoginPage/views/login_page_view.dart';

import '../controllers/profile_page_controller.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final SettingController = Get.put(ProfilePageController());

  final bottomNavController = Get.put(BottomNavController());

  bool showWidget = false;
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
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true,
        showUnselectedLabels: true,
        onTap: bottomNavController.tabIndex,
        currentIndex: bottomNavController.tabIndex.value,
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.grey[400],
        selectedItemColor: Colors.blue,
        // selectedLabelStyle: SelectedStyle,
        items: [
          BottomNavigationBarItem(
              icon: Container(
                child: Icon(
                  Icons.home_outlined,
                  size: 30,
                ),
              ),
              label: "Beranda",
              backgroundColor: Colors.amber),
          BottomNavigationBarItem(
              icon: Container(
                child: Icon(
                  Icons.error_outlined,
                  size: 30,
                ),
              ),
              label: "Beranda",
              backgroundColor: Colors.amber),
          BottomNavigationBarItem(
              icon: Container(
                child: Icon(
                  Icons.account_circle_outlined,
                  size: 30,
                ),
              ),
              label: "Beranda",
              backgroundColor: Colors.amber),
        ],
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
  bool _showPassword = true;
  void showPassword() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: widget.SettingController.PasswordLamaController,
          obscureText: _showPassword,
          decoration: InputDecoration(
              suffixIcon: GestureDetector(
                onTap: () {
                  showPassword();
                },
                child: Icon(
                    _showPassword ? Icons.visibility : Icons.visibility_off),
              ),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              labelText: "Kata Sandi Lama"),
        ),
        SizedBox(
          height: 6,
        ),
        TextField(
          controller: widget.SettingController.PasswordBaruController,
          obscureText: _showPassword,
          decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              labelText: "Kata Sandi Baru"),
        ),
        SizedBox(
          height: 6,
        ),
        TextField(
          controller: widget.SettingController.KonfirmasiPasswordController,
          obscureText: true,
          decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              labelText: "Konfirmasi Kata Sandi"),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 50,
          width: MediaQuery.of(context).size.width,
          child: ElevatedButton(
            // style: ,
            onPressed: () {
              CircularProgressIndicator();
            },
            child: Text("Simpan",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
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
