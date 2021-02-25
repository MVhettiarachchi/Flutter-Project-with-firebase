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
      title: 'DgMentor Mujer',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
    );
  }
}


