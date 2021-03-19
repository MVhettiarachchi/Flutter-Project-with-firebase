import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dgmentor_mujer_user/model/user_model.dart';
import 'package:dgmentor_mujer_user/util/constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AuthService {
  // ignore: missing_return
  static Future<bool> signUpUser(
      {String firstName, String lastName, String phone, String email, String password}) async {
    final _firestore = FirebaseFirestore.instance;
    final _auth = FirebaseAuth.instance;
    try {
      UserCredential authResult = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      User signedUser = authResult.user;

      if (signedUser != null) {
        try {
          _firestore.collection('users').doc(signedUser.uid).set({
            'id': signedUser.uid,
            'first_name': firstName,
            'last_name': lastName,
            'email': email,
            'phone': phone,
          });
          UserModel userModel = await getUserById(signedUser.uid);
          if (userModel != null) {
            Constants.user = userModel;
            return true;
          } else {
            return false;
          }
        } catch (e) {
          return false;
        }
      }
    } on FirebaseAuthException catch (err) {
      throw (err);
    }
  }

  static Future<bool> login({BuildContext context, String email, String password}) async {
    final _auth = FirebaseAuth.instance;
    try {
      UserCredential authResult = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User user = authResult.user;
      if (user != null) {
        return true;
      }
      return false;
    } on PlatformException catch (err) {
      throw (err);
    }
  }

  static signOut() {
    // resetFcmToken(Constants.user.id);
    final _auth = FirebaseAuth.instance;
    _auth.signOut();
  }

  static Future<UserModel> getUserById(String id) async {
    try {
      print(id);
      final _firestore = FirebaseFirestore.instance;
      DocumentSnapshot documentSnapshot = await _firestore.collection('users').doc(id).get();

      return null;
    } catch (e) {
      print('AuthService > getUserDetails $e');
      return null;
    }
  }
}
