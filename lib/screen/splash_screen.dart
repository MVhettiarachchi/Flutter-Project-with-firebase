import 'package:dgmentor_mujer_user/screen/add_user_main_page.dart';
import 'package:dgmentor_mujer_user/screen/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'login_screen.dart';

class SpalshScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SpalshScreenState();
  }
}

class _SpalshScreenState extends State<SpalshScreen> {
  void pageMap() {
    Future.delayed(const Duration(milliseconds: 3000), () async {
      var user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        // signed in
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => AddUserScreen()));
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => LoginScreen()));
      }
    });
  }

  @override
  void initState() {
    pageMap();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
          width: width,
          height: height,
          child: Center(
            child: Container(
              height: height / 5,
              child: Image(image: AssetImage('assets/images/dg_mentor.png')),
            ),
          )),
    );
  }
}
