import 'package:flutter/material.dart';
import 'package:dgmentor_mujer_user/screen/add_user_details.dart';
class AddUserScreen extends StatefulWidget {
  @override
  _AddUserScreenState createState() => _AddUserScreenState();
}

class _AddUserScreenState extends State<AddUserScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(title: Text('DgmentorMujer')),
     
        backgroundColor: Colors.white,
        body: SafeArea(
            child: SingleChildScrollView(
          child: Container(
            width: width,
            height: height,
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Add users',
                  style: TextStyle(
                    color: Colors.yellow[700],
                    fontSize: 36.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 60.0,
                ),
                Container(
                  height: 50.0,
                  width: 200.0,
                  child: RaisedButton(
                    color: Colors.yellow[700],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0)),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => AddUserDetailsScreen()));
                    },
                    child: Text(
                      'User 1',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),

                Container(
                  height: 50.0,
                  width: 200.0,
                  child: RaisedButton(
                    color: Colors.yellow[700],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0)),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => AddUserDetailsScreen()));
                    },
                    child: Text(
                      'User 2',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  height: 50.0,
                  width: 200.0,
                  child: RaisedButton(
                    color: Colors.yellow[700],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0)),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => AddUserDetailsScreen()));
                    },
                    child: Text(
                      'User 3',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
              ],
            ),
          ),
        )),
        
      //    drawer: Drawer(
        
      //   child: ListView(
      //     // Important: Remove any padding from the ListView.
      //     padding: EdgeInsets.zero,
      //     children: <Widget>[
      //       DrawerHeader(
      //         child: Text('Drawer Header'),
      //         decoration: BoxDecoration(
      //           color: Colors.yellow[700],
                
      //         ),
      //       ),
      //       ListTile(
      //         title: Text('Contacts'),
      //         onTap: () {
      //          Navigator.push(context, MaterialPageRoute(builder: (_) => AddUserScreen()));
      //          // Navigator.pop(context);
      //         },
      //       ),
      //       ListTile(
      //         title: Text('Item 2'),
      //         onTap: () {
      //           // Update the state of the app
      //           // ...
      //           // Then close the drawer
      //           Navigator.pop(context);
      //         },
      //       ),
      //     ],
      //   ),
      // ),
        );

  }
}
