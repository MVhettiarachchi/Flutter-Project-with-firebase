

class AuthService {
  // Stream<FirebaseUser> get user => _auth.onAuthStateChanged;

  static Future<bool> signUpUser(
      {String firstName, String lastName, String phone, String email, String password }) async {
    final _firestore = FirebaseFirestore.instance;
    final _auth = FirebaseAuth.instance;
    try {
      String address = '';
      
      UserCredential authResult = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      User signedUser = authResult.user;
     
      FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
      String fcmToken = await _firebaseMessaging.getToken();
  

      if (signedUser != null) {
        try {
          _firestore.collection('users').doc(signedUser.uid).set({
            'userId': signedUser.uid,
            'first_name': firstName,
            'last_name': lastName,
            'email': email,
            'phone': phone,
            'address': address,
            'fcm_token': fcmToken,
            'last_login_time': DateTime.now(),
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

  static Future<bool> login({String email, String password}) async {
    final _auth = FirebaseAuth.instance;
    try {
      UserCredential authResult = await _auth.signInWithEmailAndPassword(email: email, password: password);

      if (authResult != null) {
        await setFcmToken(authResult.user.uid);
        UserModel userModel = await getUserById(authResult.user.uid);
        if (userModel != null) {
          Constants.user = userModel;
          return true;
        } else {
          return false;
        }
      }
      return false;
    } on FirebaseAuthException catch (err) {
      print('Login error  0000 $err');
      throw (err);
    }
  }

  static signOut() {
    resetFcmToken(Constants.user.id);
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
    
      static Future<UserModel> setFcmToken(String userid) async {
        try {
          FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
          String fcmToken = await _firebaseMessaging.getToken();
          final _firestore = FirebaseFirestore.instance;
          await _firestore.collection('users').doc(Constants.user.id).update({
            'fcm_token': fcmToken,
          });
        } catch (e) {
          print('AuthService > setFcmToken $e');
          return null;
        }
      }
    
      static Future<UserModel> resetFcmToken(String userid) async {
        try {
          final _firestore = FirebaseFirestore.instance;
          await _firestore.collection('users').doc(Constants.user.id).update({
            'fcm_token': null,
          });
        } catch (e) {
          print('AuthService > resetFcmToken $e');
          return null;
        }
      }
    }
    
    class FirebaseAuth {
}
