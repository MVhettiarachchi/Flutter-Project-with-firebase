import 'package:flutter/material.dart';
import 'package:dgmentor_mujer_user/screen/add_user_main_page.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(title: Text('DgmentorMujer')),
        body: Center(child: Text('Home Page!')),
      ),
    );
  }
}

// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('DgmentorMujer')),
//       body: Center(child: Text('Home Page!')),

//       // drawer: Drawer(

//       //   child: ListView(
//       //     // Important: Remove any padding from the ListView.
//       //     padding: EdgeInsets.zero,
//       //     children: <Widget>[
//       //       DrawerHeader(
//       //         child: Text('Drawer Header'),
//       //         decoration: BoxDecoration(
//       //           color: Colors.yellow[700],

//       //         ),
//       //       ),
//       //       ListTile(
//       //         title: Text('Contacts'),
//       //         onTap: () {
//       //          Navigator.push(context, MaterialPageRoute(builder: (_) => AddUserScreen()));
//       //         },
//       //       ),
//       //       ListTile(
//       //         title: Text('Item 2'),
//       //         onTap: () {
//       //           // Update the state of the app
//       //           // ...
//       //           // Then close the drawer
//       //           Navigator.pop(context);
//       //         },
//       //       ),
//       //     ],
//       //   ),
//       // ),
//     );
//   }
// }
