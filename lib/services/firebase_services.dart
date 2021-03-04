import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dgmentor_mujer_user/model/contact_model.dart';

class FirebaseService {
  static Future<void> createRlativesDetails(ContactModel relativesdetails) async {
    try {
      FirebaseFirestore _firestore = FirebaseFirestore.instance;

      await _firestore.collection('relatives').doc().set({
        'lastname': relativesdetails.lastname,
        'firstname': relativesdetails.firstname,
        'phone': relativesdetails.phone,
        'address': relativesdetails.address,
      });
    } catch (e) {
      print('createRlativesDetails > $e');
    }
  }
}
