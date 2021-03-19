import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dgmentor_mujer_user/model/contact_model.dart';
import 'package:dgmentor_mujer_user/screen/login_screen.dart';
import 'package:dgmentor_mujer_user/services/auth_services.dart';
import 'package:dgmentor_mujer_user/services/firebase_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:dgmentor_mujer_user/screen/add_user_details.dart';

class AddUserScreen extends StatefulWidget {
  @override
  _AddUserScreenState createState() => _AddUserScreenState();
}

class _AddUserScreenState extends State<AddUserScreen> {

// List<ContactModel> _usersList = FirebaseService.getUserDetails("0") as List<ContactModel>;
FirebaseFirestore _firestore = FirebaseFirestore.instance;


// Widget projectWidget() {
//   return FutureBuilder(
//     builder: (context, projectSnap) {
//       if (projectSnap.connectionState == ConnectionState.none &&
//           projectSnap.hasData == null) {
//         print('project snapshot data is: ${projectSnap.data}');
//         return Container();
//       }
//       return ListView.builder(
//         itemCount: projectSnap.data.docs.length,
//         itemBuilder: (context, index) {
//           // ContactModel project = projectSnap.data[index];
//           final List<DocumentSnapshot> documents = projectSnap.data.docs;
//           return Card(
//                 child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: <Widget>[
//                     Text("Name: " + documents[index]["id"]),
//                     ],
//                 ),
//                 );
          
//         },
//       );
//     },
//     future: _firestore.collection('relatives').get()
//   );
// }

  @override
  Widget build(BuildContext context) {

    // Future<List<ContactModel>> _usersList = FirebaseService.getUserDetails("0");
    final _auth = FirebaseAuth.instance.currentUser;
    final String uid = _auth.uid.toString();

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('DgmentorMujer'),
        actions: [
          IconButton(
            color: Colors.white,
            icon: Icon(Icons.exit_to_app),
            onPressed: () => _showExitDailog(),
          ),
        ],
      ),

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
                  color: Colors.black,
                  fontSize: 36.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Container(
                height: 50.0,
                width: 200.0,
                child: RaisedButton(
                  color: Colors.tealAccent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0)),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => AddUserDetailsScreen()));
                  },
                  child: Text(
                    'Add users',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
               Row(
              children: [
                
                SizedBox(
                  width: 10,
                ),
               
               SizedBox(
                  width: 10,
                
                ),
                Expanded(
                  child: Container(
                    height: 40.0,
                    width: 4.0,                  
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      color: Colors.purple[200],
                    ),
                    child: Center(
                      child: Text(
                        'Name',
                        style: TextStyle(fontSize: 22.0, color: Colors.white),
                      ),
                    ),
                    
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 18,
            ),

              //   ListView.builder(
              //   padding: const EdgeInsets.all(8),
              //   itemCount: _usersList.length,
              //   itemBuilder: (BuildContext context, int index) {
              //     return Container(
              //       height: 50,
              //       // color: Colors.amber[colorCodes[index]],
              //       child: Center(child: Text('Entry ${index}')),
              //     );
              //   }
              // )

              // projectWidget(),

              StreamBuilder(
                stream: _firestore.collection('relatives').where('ownerID', isEqualTo: uid).snapshots(),
                builder: (context,AsyncSnapshot<QuerySnapshot> snapshots){
                  if (snapshots.hasData) {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshots.data.docs.length,
                      itemBuilder: (context, index){
                        // DocumentSnapshot docsnap = snapshots.data.documents[index];
                      List<QueryDocumentSnapshot> docsnap = snapshots.data.docs;

                        return Row(
                          children: <Widget>[
                            // Expanded(
                            //    child: Text(index.toString(),style: TextStyle(fontSize: 22.0, color: Colors.black)),
                            // ),
                            Expanded(child: Text(docsnap[index]['firstname'],style: TextStyle(fontSize: 22.0, color: Colors.black)),
                      
                       ),
                          ],
                        );
                      }
                      );
                  }else{
                    return Align(
                      alignment: FractionalOffset.bottomCenter,
                      child: CircularProgressIndicator(),
                    );
                  }
                }
              )

            // FutureBuilder<List<ContactModel>>(
            //   future: FirebaseService.getUserDetails("0"),
            //   builder: (context, snapshot) {
            //       if (snapshot.hasData) {
                    
            //       }
            //       return CircularProgressIndicator();
            //     },

            // )


            // ListView.builder(
              
            //   shrinkWrap: true,
            //   // itemCount:  FirebaseService.getUserDetails("0").,
            //   itemBuilder: (context, index) {
            //     return Padding(
            //       padding: const EdgeInsets.symmetric(vertical: 5.0),
            //       child: Row(
            //         children: [
            //           Expanded(
            //             child: Container(
            //               height: 32.0,
            //               child: Center(
            //                 child: ListTile(
            //                   title: Text(
            //                     index.toString(),
            //                     style: TextStyle(
            //                       fontSize: 20.0,
            //                       color: Colors.black,
            //                     ),
            //                   ),
            //                 ),
            //               ),
            //             ),
            //           ),
            //           SizedBox(
            //             width: 10,
            //           ),
                      
            //           Expanded(
            //             child: Container(
            //               height: 32.0,
            //               decoration: BoxDecoration(
            //                 border: Border.all(color: Colors.black),
            //                 color: Color(0xFFCDCDCD),
            //               ),
            //               child: Center(
            //                 child: Text(
            //                   _usersList[index].firstname,
            //                   overflow: TextOverflow.ellipsis,
            //                   style: TextStyle(
            //                       fontSize: 20.0, color: Colors.black),
            //                 ),
            //               ),
            //             ),
            //           ),
            //         ],
            //       ),
            //     );
            //   },
            // ),
            ],
          ),
        ),
      )
      
      ),
    );
  }

  _showExitDailog() {
    // var context;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("LOGOUT"),
          content: new Text('Are you sure you want to sign out?'),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Yes"),
              onPressed: () {
                Navigator.of(context).pop();
                AuthService.signOut();
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                    (Route<dynamic> route) => false);
              },
            ),
            new FlatButton(
              child: new Text("No"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
