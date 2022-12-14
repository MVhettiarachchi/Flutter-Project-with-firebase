import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String id;
  final String firstName;
  final String lastName;
  final String phone;
  final String email;
  //final String address;
 
   
  UserModel({
     this.id,
    this.firstName,
    this.lastName,
    this.phone,
    this.email,
    //this.address,
   
  });

  factory UserModel.fromDoc(DocumentSnapshot doc) {
    return UserModel(
      id: doc.id,
      firstName: doc['first_name'],
      lastName: doc['last_name'],
      phone: doc['phone'],
      email: doc['email'],
      //address: doc['address'],
     
    );
  }

  UserModel copyWith({
    String id,
    String firstName,
    String lastName,
    String phone,
    String email,
    //String address,
  
  }) {
    return UserModel(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      //address: address ?? this.address,
     
    );
  }
}
