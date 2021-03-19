import 'package:cloud_firestore/cloud_firestore.dart';

class ContactModel {
 
  final String id;
  final String firstname;
  final String lastname;
  final String phone;
  final String address;
  final String ownerID;

  ContactModel({ 
  this.id,
  this.firstname,
  this.lastname,
  this.address,
  this.phone,
  this.ownerID,
  });

  factory ContactModel.fromDoc(DocumentSnapshot doc) {
    return ContactModel(
      
    id: doc['id'],
    firstname: doc['firstname'],
    lastname: doc['lastname'],
    address: doc['address'],
    phone: doc['phone'],
    ownerID: doc['ownerID'],
   
    );
  }
}
