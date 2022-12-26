import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shedenk_mobile/app/modules/EditProfilePage/controllers/edit_profile_page_controller.dart';
import 'package:shedenk_mobile/app/modules/ProfilePage/views/profile_page_view.dart';
import 'package:flutter/widgets.dart';

class EditProfilePage extends StatefulWidget {
  // final Function(ImageSource source) onTap;
  // const EditProfilePage({Key? key, required this.onTap}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final FieldEditProfileController = Get.put(EditProfilePageController());
  File? _image;
  Future _chooseImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image == null) return;
    File? img = File(image.path);
    img = await _cropImage(imageFile: img);
    setState(() {
      _image = img;
    });
  }

  Future<File?> _cropImage({required File imageFile}) async {
    CroppedFile? cropImage =
        await ImageCropper().cropImage(sourcePath: imageFile.path);
    if (cropImage == null) return null;
    return File(cropImage.path);
  }

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
            child: ListView(
              // shrinkWrap: true,
              children: <Widget>[
                Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: 150,
                          height: 150,
                          // color: Colors.grey.withOpacity(0.3),
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 2,
                                style: BorderStyle.solid,
                                color: Colors.white),
                            shape: BoxShape.circle,
                            // image: DecorationImage(
                            //   fit: BoxFit.cover,
                            //   image: ,
                            // ),
                          ),
                          child: Center(
                            child: _image == null
                                ? const Text('No Image')
                                : CircleAvatar(
                                    backgroundImage: FileImage(_image!),
                                    radius: 100,
                                  ),
                          ),
                        ),
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: GestureDetector(
                            onTap: () {
                              Get.bottomSheet(
                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.15,
                                    padding: EdgeInsets.all(10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 30,
                                          child: InkWell(
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                "Ambil Gambar",
                                                style: TextStyle(fontSize: 16),
                                              ),
                                            ),
                                            splashColor: Colors.grey,
                                            onTap: () {
                                              _chooseImage(ImageSource.camera);
                                              print("ea");
                                            },
                                          ),
                                        ),
                                        Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 30,
                                          margin: EdgeInsets.only(top: 10),
                                          child: InkWell(
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                "Pilih Gambar",
                                                style: TextStyle(fontSize: 16),
                                              ),
                                            ),
                                            splashColor: Colors.grey,
                                            onTap: () {
                                              _chooseImage(ImageSource.gallery);
                                              print("ea");
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  backgroundColor: Colors.white);
                            },
                            child: Container(
                              height: 40,
                              width: 40,
                              padding: EdgeInsets.all(6),
                              // color: Colors.blue,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border:
                                      Border.all(width: 4, color: Colors.white),
                                  color: Colors.blue),

                              child: Icon(
                                Icons.edit,
                                size: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: FieldEditProfileController.UsernameController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      labelText: "Username"),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: FieldEditProfileController.HobiController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      labelText: "Hobi"),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: FieldEditProfileController.EmailController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      labelText: "Email"),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: FieldEditProfileController.NomorTeleponController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      labelText: "Nomor Telepon"),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: FieldEditProfileController.PasswordForConfirm,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      labelText:
                          "Masukkan Password untuk Konfirmasi Perubahan"),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    // style: ,
                    onPressed: () {
                      print('USERNAME = ' +
                          FieldEditProfileController
                              .UsernameController.value.text);
                      print('HOBI = ' +
                          FieldEditProfileController.HobiController.value.text);
                      print('EMAIL = ' +
                          FieldEditProfileController
                              .EmailController.value.text);
                      print('NOMOR TELEPON = ' +
                          FieldEditProfileController
                              .NomorTeleponController.value.text);
                      print('KATA SANDI = ' +
                          FieldEditProfileController
                              .PasswordForConfirm.value.text);
                      // Get.back();
                    },
                    child: Text("Simpan",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    style: ElevatedButton.styleFrom(
                        // minimumSize: Size.fromHeight(40),
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
