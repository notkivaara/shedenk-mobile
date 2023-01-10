import 'package:flutter/material.dart';
import 'package:shedenk_mobile/app/modules/RegisterPage/views/register_page_view.dart';
import 'package:shedenk_mobile/screens/RegiserPage.dart';
import 'package:shedenk_mobile/screens/SettingPage.dart';
import 'package:shedenk_mobile/screens/home/home_screen.dart';

class Lp extends StatefulWidget {
  @override
  State<Lp> createState() => _LpState();
}

class _LpState extends State<Lp> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _KataSandiController = TextEditingController();

  // LoginSubmit() async {
  //   try{
  //     _firebaseAuth.signInWithEmailAndPassword(email: _, password: password)
  //   }
  // }
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
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: ListView(
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Image.asset(
                  "img/logo.png",
                  height: 100,
                  width: 100,
                ),
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
                    // controller: ,
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
                    // controller: ,
                    // obscureText: ,
                    decoration: InputDecoration(
                        // suffixIcon: InkWell(
                        //   // onTap: ,
                        //   child: Icon(Icons.visibility),
                        // ),s
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
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => RegisterPage()));
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
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  },
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterPage()));
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
