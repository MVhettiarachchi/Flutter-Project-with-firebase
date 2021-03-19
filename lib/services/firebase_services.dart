import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dgmentor_mujer_user/model/contact_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class FirebaseService {

 static Future<void> createRlativesDetails(ContactModel relativesdetails) async {
    try {
      FirebaseFirestore _firestore = FirebaseFirestore.instance;
        final _auth = FirebaseAuth.instance.currentUser;
        final String uid = _auth.uid.toString();

      //  String rowCount = await _firestore.collection('relatives').where("ownerID", isEqualTo: uid).snapshots().length.toString();
       
      //  var rowCountInt = int.parse(rowCount);
      //   assert(rowCountInt is int);
      //   print("rows count : ");
      //   print(rowCountInt);

      
      print("rows count : ");

      
  

        // if (rowCountInt > 3) {
        //   print("max data ");
        // } else {
          await _firestore.collection('relatives').doc().set({
                  'lastname': relativesdetails.lastname,
                  'firstname': relativesdetails.firstname,
                  'phone': relativesdetails.phone,
                  'address': relativesdetails.address,
                  'ownerID':uid,
                });
        // }

      
    } catch (e) {
      print('createRlativesDetails > $e');
    }
  }
  
  static Future<int> getRelativesCount() async {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
        final _auth = FirebaseAuth.instance.currentUser;
        final String uid = _auth.uid.toString();

  var respectsQuery = await _firestore.collection('relatives').where("ownerID", isEqualTo: uid);
  var querySnapshot = await respectsQuery.snapshots();
  var totalEquals = querySnapshot.length;
    return totalEquals;
  }
  

  // static Future<List<ContactModel>>  getUserDetails(String ownerID) async {
    
  //   try {
  //   //   FirebaseFirestore _firestore = FirebaseFirestore.instance;
  //   //  final _auth = FirebaseAuth.instance.currentUse r.toString();
  //   //   QuerySnapshot postsSnapshot =
  //   //       await _firestore.collection('relatives').get();


  //       // QuerySnapshot postsSnapshot =
  //       //           await _firestore.collection('relatives').get().then((querySnapshot) {
  //       //           querySnapshot.docs.forEach((result) {
  //       //             print(result.data());
  //       //           });
  //       //   });

      
  //       // ContactModel userdetails= postsSnapshot.d;
  //       // return userdetails;

  //       //  List<QueryDocumentSnapshot> userdetails = postsSnapshot.docs;

  //       //  for (var i = 0; i < userdetails.length; i++) {
  //       //    print(userdetails[i]);
  //       //  }
  //       // return null;

  //   // return await Future.wait(postsSnapshot.docs.map((doc) async {
  //   //   // final user = await doc["user"].get();
  //   //   ContactModel(
  //   //     id: doc["id"],
  //   //     firstname: doc["firstname"],
  //   //   );
  //   // }).toList(growable: false));

  //   return null;
  //       // (
  //   //   (doc) => UserTask(
  //   //         doc.data['id'],
  //   //         doc.data['Description'],
  //   //         etc...)
  //   // ).toList();

  //   } catch (e) { 
  //     print('getUserDetails > $e');

  //     return null;
  //    }
  // }
  
}
