import 'package:dgmentor_mujer_user/screen/login_screen.dart';
import 'package:dgmentor_mujer_user/screen/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DgMentor Mujer',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: SpalshScreen(),
      //  home: HomeScreen(),
    );
  }
}

// import 'package:dgmentor_mujer_user/firebaseAuthDemo.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: FirebaseAuth(),
//     );
//   }
// }
